import 'package:calculadora/utils/console_util.dart';
import 'package:calculadora/utils/stdin_console_reader.dart';

class ConsoleUtilFactory {
  static ConsoleUtil create() {
    return ConsoleUtil(StdinConsoleReader());
  }
}
