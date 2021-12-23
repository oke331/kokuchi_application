import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TermsOfService extends StatelessWidget {
  const TermsOfService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Text('利用規約'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text(
                ''' 
この規約は、Flying Ostrichが提供する「Kokuchi」という名称のアプリケーションソフトウェア（理由の如何を問わずアプリの名称、又は内容が変更された場合は、当該変更後のものを含みます。）をご利用頂く際の取扱いにつき定めるものです。本規約に同意した上で本サービスをご利用ください。　

第１条（定義）
１　本規約上で使用する用語の定義は、次に掲げるとおりとします。
（１）本アプリ
　　「Kokuchi」という名称のアプリケーションソフトウェア
（２）本サービス
　　「Kokuchi」という名称のアプリケーションソフトウェアが提供するサービス
（３）本アプリ利用者
　　　本サービスを利用するすべての方
（４）知的財産
　発明、考案、植物の新品種、意匠、著作物その他の人間の創造的活動により生み出されるもの（発見または解明がされた自然の法則または現象であって、産業上の利用可能性があるものを含む）、商標、商号その他事業活動に用いられる商品または役務を表示するもの、及び営業秘密その他の事業活動に有用な技術上または営業上の情報。
（５）知的財産権
　特許権、実用新案権、育成者権、意匠権、著作権、商標権その他の知的財産に関して法令により定められた権利または法律上保護される利益に係る権利。
（６）個人情報
　住所、氏名、職業、電話番号等個人を特定することのできる情報の総称。

第２条（本規約への同意）
１　本アプリ利用者は、本利用規約に同意頂いた上で、本サービスを利用できるものとします。
２　本アプリ利用者が、本サービスをスマートフォンその他の情報端末にダウンロードし、本規約への同意手続を行った時点で、本アプリ利用者とFlying Ostrichとの間で、本規約の諸規定に従った利用契約が成立するものとします。
３　本アプリ利用者が未成年者である場合には、親権者その他の法定代理人の同意を得たうえで、本サービスをご利用ください。
４　未成年者の本アプリ利用者が、法定代理人の同意がないにもかかわらず同意があると偽りまたは年齢について成年と偽って本サービスを利用した場合、その他行為能力者であることを信じさせるために詐術を用いた場合、本サービスに関する一切の法律行為を取り消すことは出来ません。
５　本規約の同意時に未成年であった本アプリ利用者が成年に達した後に本サービスを利用した場合、当該本アプリ利用者は本サービスに関する一切の法律行為を追認したものとみなされます。

第３条（規約の変更）
１　Flying Ostrichは、本アプリ利用者の承諾を得ることなく、いつでも、本規約の内容を改定することができるものとし、本アプリ利用者はこれを異議なく承諾するものとします。
２　Flying Ostrichは、本規約を改定するときは、その内容についてFlying Ostrich所定の方法により本アプリ利用者に通知します。
３　前本規約の改定の効力は、Flying Ostrichが前項により通知を行った時点から生じるものとします。
４　本アプリ利用者は、本規約変更後、本サービスを利用した時点で、変更後の本利用規約に異議なく同意したものとみなされます。

第４条（表明及び保証並びに誓約）
１　本アプリ利用者は、本サービスを利用するに当たり、以下の事項を表明及び保証し、又は誓約するものとします。
（１） 本アプリ利用者は、反社会的勢力等（暴力団、暴力団員、右翼団体、反社会的勢力、その他これに準ずる者を意味します。以下同じ。）ではなく、又、資金提供その他を通じて反社会的勢力等の維持、運営、若しくは経営に協力、若しくは関与する等、反社会的勢力等との何らかの交流、若しくは関与を行っていないこと。　又、本アプリ利用者は、利用契約の有効期間中、反社会的勢力等の維持、運営、若しくは経営に協力、若しくは関与する等反社会的勢力等との何らかの交流、若しくは関与を行わないこと。

第５条（利用料）
１　利用料金の金額、支払期日および支払方法は、本アプリまたは公式サイト上で定めます。
２　本サービスのご利用には、別途通信料が必要になります。通信料の支払いについては、利用者に対し電気通信サービスを提供している電気通信事業者の定めに従ってください。
３　Flying Ostrichは、本アプリ利用者の事前の了承を得ることなく、いつでも利用料金の金額、支払期日または支払方法を変更することができるものとし、Flying Ostrichが別途定める場合を除き、Flying Ostrichがその変更内容を本アプリまたは公式サイト上に表示した時点より、その効力を生じるものとします。　Flying Ostrichは、Flying Ostrichが事前告知期間として合理的と判断する期間、これらの変更がされる旨およびその内容を、本アプリまたは公式サイト上で事前に告知することがあります。
４　本アプリ利用者は、Flying Ostrichが支払方法として指定する決済手段について、その取扱事業者（以下「決済事業者」といいます）が別途定める支払条件等に従い、利用料金を支払うものとします。
５　本アプリ利用者は、本アプリ利用者と決済事業者との間で利用料金の支払いに関して紛争が発生した場合、当該決済事業者との間で当該紛争を処理解決するものとします。　
６　Flying Ostrichは、Flying Ostrichに故意または重過失がある場合を除き、当該紛争について一切の責任を負わないものとします。
７　本サービスの利用には「Apple決済」または「Google決済」がご利用いただけます。
８　「Apple決済」または「Google決済」利用者の利用料
（１）利用者は、iOSまたはAndroidが搭載されている対応端末へソフトウェアをダウンロードする方法により本サービスを利用する場合には、Apple Inc.、及びその関連会社またはGoogle Inc.及びその関連会社がApp StoreまたはGoogle Play ストアで提供する決済方法（以下それぞれ「Apple決済」、「Google決済」といいます）による利用料の支払方法を選択することができます。
（２）利用者が、Apple決済またはGoogle決済により利用料を支払う場合には、それぞれの決済事業者が定める「サービス規約」が適用になり、当該利用料は、決済事業者によって請求されます。　Flying Ostrichは、いかなる理由によっても、決済事業者によって課金され、又は利用者が各決済によって支払った利用料を返還いたしません。また、サービス利用料は、為替変動等に基づく決済事業者の都合により、Flying Ostrichの意図にかかわらず変更されることがあります。

第６条（禁止行為）
１　本サービスの利用に際し、Flying Ostrichは、本アプリ利用者に対し、次に掲げる行為を禁止します。　Flying Ostrichにおいて、本アプリ利用者が禁止事項に違反したと認めた場合、本アプリ利用者に対して本アプリの利用の停止、その他Flying Ostrichが必要と判断した措置を取ることができます。
（１）Flying Ostrichまたは第三者の知的財産権を侵害する行為
（２）Flying Ostrichまたは第三者の名誉・信用を毀損または不当に差別もしくは誹謗中傷する行為
（３）Flying Ostrichまたは第三者の財産を侵害する行為、または侵害する恐れのある行為
（４）Flying Ostrichまたは第三者に経済的損害を与える行為
（５）Flying Ostrichまたは第三者に対する脅迫的な行為
（６）本アプリ利用者が本サービスの一つである情報掲載機能を利用して行う明らかな虚偽情報の掲載行為
（７）本アプリ利用者が本サービスの一つである情報掲載機能を利用して公序良俗に反する情報の掲載行為
（８）過度に暴力的な表現、露骨な性的表現、児童ポルノ・児童虐待に相当する表現、人種、国籍、信条、性別、社会的身分、門地等による差別につながる表現、自殺、自傷行為、薬物乱用を誘引または助長する表現、その他反社会的な内容を含み他人に不快感を与える表現を掲載する行為
（９）コンピューターウィルス、有害なプログラムを仕様またはそれを誘発する行為
（１０）本サービス用インフラ設備に対して過度な負担となるストレスをかける行為
（１１）当サイトのサーバーやシステム、セキュリティへの攻撃
（１２）Flying Ostrich提供のインターフェース以外の方法でFlying Ostrichサービスにアクセスを試みる行為
（１３）個人を特定できる可能性のある情報を収集または取得すること。ただし、その人物が許可している場合は除きます。
（１４）他の利用者、第三者、若しくは当社の著作権、商標等の知的財産権、肖像権、人格権、プライバシー権、パブリシティー権その他の権利を侵害する行為またはそれらのおそれのある行為。

第7条（掲載情報）
１．本アプリ利用者は、自身が本サービスを利用して、情報（文章）、画像、その他のデータを掲載することについて適法な権利を有していること、および掲載情報が第三者の権利を侵害していないことについて、Flying Ostrichに対して保証するものとします。
２．本アプリ利用者は、自己の掲載情報に伴う結果につき単独で責任を負うものとします。
３．本アプリ利用者は、Flying Ostrichが、利用者が掲載する掲載情報について何らの秘密保持を保証しないことを理解するものとします。
４．料金プランが無料の利用者の場合、新規の掲載、掲載情報の変更、その他アプリの利用形跡が6カ月以上無いとFlying Ostrichが認める場合はアカウント及ひすべての掲載情報が削除される場合があります。

第８条（掲載情報の削除）
1.　Flying Ostrichは、本アプリ利用者による本サービスの利用が本規約に違反し、若しくは違反するおそれがあると認めた場合、第三者から肖像権、プライバシー権、名誉権、著作権等の権利侵害がある旨の通報を受けた場合、本サービスの利用が公序良俗に反すると認められる場合、その他Flying Ostrichが適切でないと判断した場合には、本アプリ利用者に予め通知することなく、掲載情報の全部、若しくは一部の非公開、公開停止、若しくは削除、又は本アプリ利用者に対し是正を求める等Flying Ostrichが適当と判断する措置を講じることができるものとし、本アプリ利用者は、予めこれに同意するものとします。　但し、Flying Ostrichは、本アプリ利用者による違反を防止、又は是正する義務を負うものではありません。
２．Flying Ostrichが前項に基づき掲載情報を削除した場合にも、これにより利用者、又は他の第三者が被った損害について、Flying Ostrichは一切責任を負わないものとします。

第９条（掲載情報を含む一切のデータのバックアップ）
１．本アプリ利用者がFlying Ostrichの管理するサーバに保存している掲載情報を含む一切のデータについて、 Flying Ostrich ではバックアップの義務を負わないものとし、本アプリ利用者自らバックアップを行うものとします。
２．Flying Ostrichは、本アプリ利用者が本サービスに保存、又は登録した掲載情報を含む一切のデータが何らかの事由により消失した場合も、Flying Ostrichに故意、又は重過失がある場合を除き、一切の責任を負いません。

第１０条（権利帰属）
１　本アプリ利用者は、本サービスに関する権利帰属につき、以下の事項を確認します。
（１）本アプリ、及び本サービスに関する所有権及び知的財産権は全てFlying Ostrich又はFlying Ostrichにライセンスを許諾している者に帰属しており、本利用規約に定める本アプリの利用許諾、及び本サービスの提供は、本利用規約において明示されているものを除き、本アプリ、又は本サービスに関するFlying Ostrich又はFlying Ostrichにライセンスを許諾している者の知的財産権の譲渡、又は使用許諾を意味するものではありません。本アプリ利用者は、いかなる理由によってもFlying Ostrich、又はFlying Ostrichにライセンスを許諾している者の知的財産権を侵害するおそれのある行為（逆アセンブル、逆コンパイル、リバースエンジニアリングを含みますが、これに限定されません。）をしないものとします。

第１１条（免責）
１　Flying Ostrichは、本サービスで掲載される掲載内容について、何ら保証するものではありません。
２　Flying Ostrichは、本サービスで掲載される掲載内容に起因して生じたいかなる損害についても、一切の責任を負いません。
３　Flying Ostrichは、本サービスの内容変更、中断、終了によって生じたいかなる損害についても、一切の責任を負いません。
４　Flying Ostrichは、本アプリ利用者の本サービスの利用環境について一切関与せず、また一切の責任を負いません。
５　Flying Ostrichは、本サービスが本アプリ利用者の特定の目的に適合すること、期待する機能・商品的価値・正確性・有用性を有すること、本アプリ利用者による本サービスの利用が本アプリ利用者に適用のある法令または業界団体の内部規則等に適合すること、および不具合が生じないことについて、何ら保証するものではありません。
６　Flying Ostrichは、本サービスが全ての情報端末に対応していることを保証するものではなく、本サービスの利用に供する情報端末のOSのバージョンアップ等に伴い、本サービスの動作に不具合が生じる可能性があることにつき、本アプリ利用者はあらかじめ了承するものとします。Flying Ostrichは、かかる不具合が生じた場合にFlying Ostrichが行うプログラムの修正等により、当該不具合が解消されることを保証するものではありません。
７　本アプリ利用者は、AppStore、GooglePlay等のサービスストアの利用規約および運用方針の変更等に伴い、本サービスの一部、又は全部の利用が制限される可能性があることをあらかじめ了承するものとします。
８　Flying Ostrichは、本サービスを利用したことにより直接的または間接的に本アプリ利用者に発生した損害について、一切賠償責任を負いません。
９　Flying Ostrichは、本アプリ利用者その他の第三者に発生した機会逸失、業務の中断その他いかなる損害（間接損害や逸失利益を含みます）に対して、Flying Ostrichが係る損害の可能性を事前に通知されていたとしても、一切の責任を負いません。
１０　Flying Ostrichは、本サービスに関連して本アプリ利用者が被った損害について、一切賠償の責任を負いません。消費者契約法の適用その他の理由により弊社が本アプリ利用者に対して損害賠償責任を負う場合においても、Flying Ostrichの賠償責任は、直接かつ通常の損害についての責任に限るものとします。
１１　Flying Ostrichは、本アプリ利用者と他の本アプリ利用者間の紛争及びトラブルについて、一切の責任を負いません。
１２　本アプリ利用者と他の本アプリ利用者間でトラブルになった場合でも、両者同士の責任で解決するものとし、Flying Ostrichに対して一切の請求をしないものとします。
１３　本アプリ利用者は、本サービスの利用に関連し、他の本アプリ利用者に損害を与えた場合または第三者との間に紛争を生じた場合、自己の費用と責任において、かかる損害を賠償またはかかる紛争を解決するものとし、Flying Ostrichには一切の迷惑や損害を与えないものとします。
１４　本アプリ利用者の行為により、第三者からFlying Ostrichが損害賠償等の請求をされた場合には、本アプリ利用者の費用（弁護士費用）と責任で、これを解決するものとします。Flying Ostrichが、当該第三者に対して、損害賠償金を支払った場合には、本アプリ利用者は、Flying Ostrichに対して当該損害賠償金を含む一切の費用（弁護士費用及び逸失利益を含む）を支払うものとします。
１５　本アプリ利用者が本サービスの利用に関連してFlying Ostrichに損害を与えた場合、本アプリ利用者の費用と責任においてFlying Ostrichに対して損害を賠償（訴訟費用及び弁護士費用を含む）するものとします。

第１２条（個人情報(位置情報も含む)）
１　Flying Ostrichが本サービスの提供に伴って取得した本アプリ利用者の個人情報については、Flying Ostrichが別途定めるプライバシーポリシーに従って取扱うものとし、本アプリ利用者は、Flying Ostrichのプライバシーポリシーに同意するものとします。なお、本アプリは本アプリ利用中に本アプリ利用者の位置情報を使用します。

第１３条（広告の掲載について）
　本アプリ利用者は、本サービス上にあらゆる広告が含まれる場合があること、Flying Ostrichまたはその提携先があらゆる広告を掲載する場合があることを理解しこれを承諾したものとみなします。本サービス上の広告の形態や範囲は、Flying Ostrichによって随時変更されます。

第１４条（設備の負担等）
１　Flying Ostrichが本サービスを提供するに当たり、本アプリ利用者は、その設備負担等について、以下の事項を確認するものとします。
（１）本アプリをダウンロードし、本サービスの提供を受けるために必要な対応端末、コンピューター、ソフトウェアその他の機器、通信回線その他の通信環境等の準備、及び維持は、本アプリ利用者の費用と責任において行うものとします。
（２）本アプリ利用者は自己の本サービスの利用環境に応じて、コンピューター・ウィルスの感染の防止、不正アクセス及び情報漏洩の防止等のセキュリティ対策を自らの費用と責任において講じるものとします。
（３）本アプリ利用者は、本サービスの利用開始に際し、又は本サービスの利用中に、本アプリを本アプリ利用者の対応端末にインストールする場合には、本アプリ利用者が保有する情報の消滅、若しくは改変又は機器の故障、損傷等が生じないよう十分な注意を払うものとし、Flying Ostrichは本アプリ利用者に発生したかかる損害について一切責任を負わないものとします。

第１５条　（アンインストール等）
１　本アプリ利用者は、以下に掲げる事由に該当する場合、いかなる理由においても、本サービスを利用することはできません。加えて、この場合、Flying Ostrichは、本アプリ利用者の本サービスの利用を停止することができるものとし、本アプリ利用者は、自己の占有又は管理下にある対応端末から、本アプリを速やかにアンインストールその他の方法で消去しなければなりません。なお、Flying Ostrichは、本条に基づきFlying Ostrichが行った措置に基づき本アプリ利用者に生じた損害について一切の責任を負いません。
（１）本利用規約のいずれかの条項に違反した場合、又は第４条記載の表明、及び保証、若しくは誓約に違反した場合。
（２）Flying Ostrich、他の本アプリ利用者、その他の第三者に損害を生じさせるおそれのある目的、又は方法で本サービスを利用した。又は利用しようとした場合。
（３）手段の如何を問わず、本サービスの運営を妨害した場合。
（４）その他、Flying Ostrichが本アプリ利用者として適当でないと判断した場合。

第１６条　（本サービスの停止）
１　Flying Ostrichは、以下のいずれかに該当する場合には、本アプリ利用者に事前に通知することなく、本サービスの利用の全部、又は一部を停止、又は中断することができるものとします。なお、Flying Ostrichは、本条に基づきFlying Ostrichが行った措置に基づき本アプリ利用者に生じた損害について一切の責任を負いません。
（１）本アプリに係るコンピューター・システムの点検、又は保守作業を定期的、又は緊急に行う場合。
（２）コンピューター、通信回線等が事故により停止した場合。
（３）火災、停電、天災地変等の不可抗力により本サービスの提供ができなくなった場合。
(４）その他、Flying Ostrichが停止、又は中断を必要と判断した場合。

第１７条　 （譲渡禁止）
１　本アプリ利用者は、利用契約に係る権利及び義務を第三者に移転、譲渡、担保に供する等をすることができません。Flying Ostrichは本サービスにかかる事業を他社に譲渡した場合には、当該事業譲渡に伴い利用契約上の地位、本利用規約に基づく権利、及び義務、並びに顧客情報を当該事業譲渡の譲受人に譲渡することができるものとし、本アプリ利用者は、かかる譲渡につき本項において予め同意したものとします。なお、本項に定める事業譲渡には、通常の事業譲渡のみならず、その他事業が移転するあらゆる場合を含むものとします。

第１８条　 （有効期間）
１　利用契約は、本アプリ利用者が第2条に従って本利用規約に同意した日に効力を生じ、本サービスから退会した日、又は本サービスの提供が終了した日のいずれか早い日まで、Flying Ostrichと本アプリ利用者との間で有効に存続するものとします。

第１９条　（分離可能性）
本規約のいずれかの条項、又はその一部が、消費者契約法その他の法令等により無効、又は執行不能と判断された場合であっても、本規約の残りの規定、及び一部が無効、又は執行不能と判断された規定の残りの部分は、継続して完全に効力を有するものとします。

第２０条（Flying Ostrichへの連絡方法）
本アプリに関するお問い合わせは，下記の窓口までお願いいたします。
    Eメールアドレス：flyingo0ostrich@gmail.com
              ''',
                style: TextStyle(fontSize: 14, height: 1.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
