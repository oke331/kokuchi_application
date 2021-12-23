import 'package:kokuchi_event/run.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

void main() => run();
