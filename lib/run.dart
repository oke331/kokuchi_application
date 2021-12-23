import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kokuchi_event/algolia_environment.dart';
import 'package:kokuchi_event/application/auth_app_service.dart';
import 'package:kokuchi_event/application/event_app_service.dart';
import 'package:kokuchi_event/application/event_lets_go_app_service.dart';
import 'package:kokuchi_event/application/event_report_app_service.dart';
import 'package:kokuchi_event/application/user_app_service.dart';
import 'package:kokuchi_event/application/user_report_app_service.dart';
import 'package:kokuchi_event/common/color.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/domain/event_report/event_repository_base.dart';
import 'package:kokuchi_event/domain/login/auth_repository_base.dart';
import 'package:kokuchi_event/domain/user/user_repository_base.dart';
import 'package:kokuchi_event/domain/user_report/user_report_repository_base.dart';
import 'package:kokuchi_event/infrastructure/auth/auth_repository.dart';
import 'package:kokuchi_event/infrastructure/event/event_factory.dart';
import 'package:kokuchi_event/infrastructure/event/event_repository.dart';
import 'package:kokuchi_event/infrastructure/event_report/event_report_factory.dart';
import 'package:kokuchi_event/infrastructure/event_report/event_report_repository.dart';
import 'package:kokuchi_event/infrastructure/user/user_factory.dart';
import 'package:kokuchi_event/infrastructure/user/user_repository.dart';
import 'package:kokuchi_event/infrastructure/user_report/user_report_factory.dart';
import 'package:kokuchi_event/infrastructure/user_report/user_report_repository.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/notifier/block_user/block_user_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/event/event_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/lets_go/lets_go_state.dart';
import 'package:kokuchi_event/presentation/notifier/search/search_state.dart';
import 'package:kokuchi_event/presentation/notifier/setting/setting_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:kokuchi_event/presentation/route/router.dart';
import 'package:kokuchi_event/presentation/widget/version_check/version_check_service.dart';
import 'package:kokuchi_event/restart_widget.dart';
import 'package:provider/provider.dart';

enum Flavor {
  development,
  staging,
  production,
}
final getItLocator = GetIt.instance;

void setupLocator() {
  getItLocator
      .registerLazySingleton<VersionCheckService>(() => VersionCheckService());
}

Future<void> run({bool isEmulator = false}) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebaseの各サービスを使う前に初期化を済ませておく必要がある
  await Firebase.initializeApp();

  // Crashlytics
  await debugModeSetup();

  // ステータスバーとナビゲーションバーの色を変更
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: CommonColor.backLightColor,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: CommonColor.backLightColor,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));

  final flavor = EnumToString.fromString(
    Flavor.values,
    const String.fromEnvironment('FLAVOR'),
  );
  logger.d('flavor: $flavor');

  // Algoliaの環境設定
  switch (flavor) {
    case Flavor.development:
      AlgoliaEnvironment.development();
      break;
    case Flavor.staging:
      AlgoliaEnvironment.staging();
      break;
    case Flavor.production:
      AlgoliaEnvironment.production();
      break;
  }

  if (isEmulator) {
    final domain = (!kIsWeb && Platform.isAndroid) ? '10.0.2.2' : 'localhost';
    CloudFunctions.instance.useFunctionsEmulator(origin: 'http://$domain:5001');
    FirebaseFirestore.instance.settings = Settings(
      persistenceEnabled: false,
      host: '$domain:58080',
      sslEnabled: false,
    );
  }

  //　Flutterフレームワーク内でのすべてのキャッチされていないエラーを
  // フレームワークからCrashlyticsに渡す
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  await runZonedGuarded(() async {
    // 強制アップデート
    setupLocator();

    runApp(
      RestartWidget(
        child: MultiProvider(
          providers: [
            Provider.value(value: flavor),
            Provider<AuthRepositoryBase>(create: (_) => AuthRepository()),
            Provider<UserRepositoryBase>(create: (_) => UserRepository()),
            Provider<UserReportRepositoryBase>(
                create: (_) => UserReportRepository()),
            Provider<EventRepositoryBase>(create: (_) => EventRepository()),
            Provider<EventReportRepositoryBase>(
              create: (_) => EventReportRepository(),
            ),
            StateNotifierProvider<AuthStateNotifier, AuthState>(
              create: (context) => AuthStateNotifier(
                app: AuthAppService(
                  repository: context.read<AuthRepositoryBase>(),
                ),
              ),
            ),
            StateNotifierProvider<UserStateNotifier, UserState>(
              create: (context) => UserStateNotifier(
                  app: UserAppService(
                    factory: const UserFactory(),
                    repository: context.read<UserRepositoryBase>(),
                  ),
                  reportApp: UserReportAppService(
                    reportFactory: const UserReportFactory(),
                    reporrtRepository: context.read<UserReportRepositoryBase>(),
                  )),
            ),
            StateNotifierProvider<BlockUserStateNotifier, BlockUserState>(
              create: (context) => BlockUserStateNotifier(
                app: UserAppService(
                  factory: const UserFactory(),
                  repository: context.read<UserRepositoryBase>(),
                ),
              ),
            ),
            StateNotifierProvider<EventStateNotifier, EventState>(
              create: (context) => EventStateNotifier(
                reportApp: EventReportAppService(
                    factory: const EventReportFactory(),
                    repository: context.read<EventReportRepositoryBase>()),
                app: EventAppService(
                  factory: const EventFactory(),
                  repository: context.read<EventRepositoryBase>(),
                ),
              ),
            ),
            StateNotifierProvider<LetsGoStateNotifier, LetsGoState>(
              create: (context) => LetsGoStateNotifier(
                app: EventLetsGoAppService(
                  repository: context.read<EventRepositoryBase>(),
                ),
              ),
            ),
            StateNotifierProvider<SearchStateNotifier, SearchState>(
              create: (context) => SearchStateNotifier(),
            ),
            StateNotifierProvider<SettingStateNotifier, SettingState>(
              create: (context) => SettingStateNotifier(),
            ),
          ],
          child: NeumorphicApp(
            color: CommonColor.backLightColor,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: RouteName.loginCheck,
            themeMode: ThemeMode.light,
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ja', 'JP'),
            ],
            theme: NeumorphicThemeData(
              baseColor: CommonColor.backLightColor,
              defaultTextColor: const Color(0xFF3E3E3E),
              accentColor: Colors.grey,
              variantColor: Colors.black38,
              depth: 8,
              intensity: 0.65,
              textTheme: GoogleFonts.notoSansTextTheme(const TextTheme()),
              appBarTheme: NeumorphicAppBarThemeData(
                color: CommonColor.backLightColor,
                centerTitle: true,
                textStyle: GoogleFonts.notoSans(fontSize: 20),
                icons: NeumorphicAppBarIcons(
                    backIcon: Platform.isAndroid
                        ? const Icon(
                            Icons.arrow_back,
                          )
                        : const Icon(
                            CupertinoIcons.back,
                            size: 28,
                          )),
                buttonStyle: const NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle()),
              ),
            ),
            darkTheme: NeumorphicThemeData(
              baseColor: const Color(0xFF454545),
              lightSource: LightSource.topLeft,
              shadowLightColorEmboss: const Color(0xFF999999),
              shadowLightColor: const Color(0xFF999999),
              depth: 4,
              defaultTextColor: const Color(0xFF555555),
              accentColor: const Color(0xFF555555),
              variantColor: Colors.black38,
              intensity: 0.6,
              textTheme: GoogleFonts.notoSansTextTheme(const TextTheme()),
              appBarTheme: NeumorphicAppBarThemeData(
                color: CommonColor.backDarkColor,
                centerTitle: true,
                textStyle: GoogleFonts.notoSans(fontSize: 20),
                icons: NeumorphicAppBarIcons(
                    backIcon: Platform.isAndroid
                        ? const Icon(
                            Icons.arrow_back,
                          )
                        : const Icon(
                            CupertinoIcons.back,
                            size: 28,
                          )),
                buttonStyle: const NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle()),
              ),
            ),
          ),
        ),
      ),
    );
  }, (e, s) async => FirebaseCrashlytics.instance.recordError(e, s));
}

Future<void> debugModeSetup() async {
  if (kDebugMode) {
    // Force disable Crashlytics collection while doing every day development.
    // Temporarily toggle this to true if you want to test crash reporting in your app.
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  } else {
    // Handle Crashlytics enabled status when not in Debug,
    // e.g. allow your users to opt-in to crash reporting.
  }
}

class ReceivedNotification {
  const ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}
