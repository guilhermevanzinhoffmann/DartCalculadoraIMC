import 'package:calculadora/utils/stdin_console_reader.dart';

class ConsoleUtil {
  final ConsoleReader _consoleReader;

  ConsoleUtil(this._consoleReader);

  double inputDouble() {
    try {
      dynamic response = _consoleReader.readLineSync();
      return double.parse(response);
    } catch (e) {
      return 0;
    }
  }

  String inputString() {
    try {
      dynamic response = _consoleReader.readLineSync();
      return response.toString();
    } catch (e) {
      return "";
    }
  }
}
