import 'package:calculadora/utils/console_util.dart';
import 'package:calculadora/utils/stdin_console_reader.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'console_utils_test.mocks.dart';

@GenerateMocks([MockConsoleReader])
void main() {
  final mockConsoleReader = MockMockConsoleReader();
  final consoleUtil = ConsoleUtil(mockConsoleReader);
  final dadosTestesSucessoInputDouble = ['3.14', '5', '7', '0.12', '-1.2'];
  final dadosTestesSucessoInputString = ['3.14', '5', '7', '0.12', '-1.2'];
  final dadosTestesErroInputDouble = ['ABC', null, ''];

  group('Testes ConsoleUtil.inputDouble()', () {
    for (var entrada in dadosTestesSucessoInputDouble) {
      test('Testar inputDouble com entrada valida deve retornar double', () {
        when(mockConsoleReader.readLineSync()).thenReturn(entrada);
        final resultado = consoleUtil.inputDouble();
        expect(resultado, double.parse(entrada));
        expect(resultado, isA<double>());
      });
    }

    for (var entrada in dadosTestesErroInputDouble) {
      test('Testar inputDouble com entrada invalida deve retornar zero', () {
        when(mockConsoleReader.readLineSync()).thenReturn(entrada);
        final resultado = consoleUtil.inputDouble();
        expect(resultado, 0);
      });
    }
  });

  group('Testes ConsoleUtil.inputString()', () {
    for (var entrada in dadosTestesSucessoInputString) {
      test('Testar inputString com entrada valida deve retornar String', () {
        when(mockConsoleReader.readLineSync()).thenReturn(entrada);
        final resultado = consoleUtil.inputString();
        expect(resultado, entrada);
        expect(resultado, isA<String>());
      });
    }
    test('Testar inputString com entrada invalida deve retornar String vazia',
        () {
      when(mockConsoleReader.readLineSync()).thenReturn("");
      final resultado = consoleUtil.inputString();
      expect(resultado, equals(""));
    });
  });
}

class MockConsoleReader extends Mock implements ConsoleReader {}
