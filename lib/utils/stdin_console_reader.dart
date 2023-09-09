import 'dart:convert';
import 'dart:io';

abstract class ConsoleReader {
  dynamic readLineSync();
}

class StdinConsoleReader implements ConsoleReader {
  @override
  dynamic readLineSync() {
    return stdin.readLineSync(encoding: utf8);
  }
}
