import 'package:calculadora/calculadora.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  group('GetPesoPessoa com valores válidos. Deve retornar Peso', () {
    List<double> dadosPesoPessoa = [1, 0.10, -1.5];
    for (var peso in dadosPesoPessoa) {
      test('Peso: $peso', () {
        var calculadora = Calculadora("Pessoa", peso, 1);
        expect(calculadora.getPesoPessoa(), peso);
      });
    }
  });

  group('GetAlturaPessoa com valores válidos. Deve retornar altura', () {
    List<double> dadosAlturaPessoa = [1, 0.10, -1.5];
    for (var altura in dadosAlturaPessoa) {
      test('Altura: $altura', () {
        var calculadora = Calculadora("Pessoa", 1, altura);
        expect(calculadora.getAlturaPessoa(), altura);
      });
    }
  });

  group('GetNomePessoa com valores válidos. Deve retornar nome', () {
    var dadosNomePessoa = ['AAA', 'aaa', 'AAA bbb'];
    for (var nome in dadosNomePessoa) {
      test('Nome: $nome', () {
        var calculadora = Calculadora(nome, 1, 1);
        expect(calculadora.getNomePessoa(), nome);
      });
    }
  });

  group('Calcula IMC com dados válidos. Deve retornar resultado do cálculo IMC',
      () {
    var dadosTesteCalculadoraIMC = [
      {
        "nome": "Pessoa1",
        "peso": 15.9,
        "altura": 1.0,
        "resultado": "Nome: Pessoa1. IMC: 15.9. Magreza grave",
      },
      {
        "nome": "Pessoa2",
        "peso": 16.0,
        "altura": 1.0,
        "resultado": "Nome: Pessoa2. IMC: 16.0. Magreza moderada",
      },
      {
        "nome": "Pessoa3",
        "peso": 16.9,
        "altura": 1.0,
        "resultado": "Nome: Pessoa3. IMC: 16.9. Magreza moderada",
      },
      {
        "nome": "Pessoa4",
        "peso": 17.0,
        "altura": 1.0,
        "resultado": "Nome: Pessoa4. IMC: 17.0. Magreza leve",
      },
      {
        "nome": "Pessoa5",
        "peso": 18.4,
        "altura": 1.0,
        "resultado": "Nome: Pessoa5. IMC: 18.4. Magreza leve",
      },
      {
        "nome": "Pessoa5",
        "peso": 18.5,
        "altura": 1.0,
        "resultado": "Nome: Pessoa5. IMC: 18.5. Saudável",
      },
      {
        "nome": "Pessoa6",
        "peso": 24.9,
        "altura": 1.0,
        "resultado": "Nome: Pessoa6. IMC: 24.9. Saudável",
      },
      {
        "nome": "Pessoa7",
        "peso": 25.0,
        "altura": 1.0,
        "resultado": "Nome: Pessoa7. IMC: 25.0. Sobrepeso",
      },
      {
        "nome": "Pessoa8",
        "peso": 29.9,
        "altura": 1.0,
        "resultado": "Nome: Pessoa8. IMC: 29.9. Sobrepeso",
      },
      {
        "nome": "Pessoa9",
        "peso": 30.0,
        "altura": 1.0,
        "resultado": "Nome: Pessoa9. IMC: 30.0. Obesidade Grau I",
      },
      {
        "nome": "Pessoa10",
        "peso": 34.9,
        "altura": 1.0,
        "resultado": "Nome: Pessoa10. IMC: 34.9. Obesidade Grau I",
      },
      {
        "nome": "Pessoa11",
        "peso": 35.0,
        "altura": 1.0,
        "resultado": "Nome: Pessoa11. IMC: 35.0. Obesidade Grau II (Severa)",
      },
      {
        "nome": "Pessoa12",
        "peso": 39.9,
        "altura": 1.0,
        "resultado": "Nome: Pessoa12. IMC: 39.9. Obesidade Grau II (Severa)",
      },
      {
        "nome": "Pessoa13",
        "peso": 40.0,
        "altura": 1.0,
        "resultado": "Nome: Pessoa13. IMC: 40.0. Obesidade Grau III (Mórbida)",
      },
    ];

    for (var element in dadosTesteCalculadoraIMC) {
      test(
          'Calcula IMC ${element["nome"]}, peso ${element["peso"]}, altura ${element["altura"]}',
          () {
        var calculadora = Calculadora(
            element["nome"].toString(),
            double.parse(element["peso"].toString()),
            double.parse(element["altura"].toString()));

        var resultado = calculadora.calcularIMC();

        expect(resultado, equals(element["resultado"]));
      });
    }
  });

  test('Calcula IMC com exceção. Deve retornar a mensagem da exceção', () {
    final calculadora = Calculadora("Nome", 0, 0);
    var result = calculadora.calcularIMC();
    expect(result, equals('ERRO: Exception: Dados incorretos'));
  });
}

class MockCalculadora extends Mock implements Calculadora {}
