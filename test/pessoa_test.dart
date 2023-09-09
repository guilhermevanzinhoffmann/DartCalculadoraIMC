import 'package:calculadora/models/pessoa.dart';
import 'package:test/test.dart';

void main() {
  group('Criar Pessoa deve retornar dados da Pessoa', () {
    var testData = [
      {"nome": "Nome 1", "peso": 100, "altura": 1.80},
      {"nome": "Nome 2", "peso": 80, "altura": 1.75},
      {"nome": "Nome 3", "peso": 70, "altura": 1.65}
    ];

    for (var element in testData) {
      test(
          'Cria pessoa ${element["nome"]}, peso ${element["peso"]}, altura ${element["altura"]}',
          () {
        var pessoa = Pessoa(
            element["nome"].toString(),
            double.parse(element["peso"].toString()),
            double.parse(element["altura"].toString()));
        expect(pessoa.getNome(), equals(element["nome"]));
        expect(pessoa.getPeso(), equals(element["peso"]));
        expect(pessoa.getAltura(), equals(element["altura"]));
      });
    }
  });
}
