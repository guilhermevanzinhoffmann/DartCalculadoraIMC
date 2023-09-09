import 'package:calculadora/calculadora.dart';
import 'package:calculadora/utils/consule_util_factory.dart';

void main(List<String> arguments) {
  try {
    execute();
  } catch (e) {
    print("ERRO: $e. Reiniciando programa ...");
    execute();
  }
}

void execute() {
  final consoleUtil = ConsoleUtilFactory.create();

  var escolha = "S";

  while (escolha.toUpperCase() == "S") {
    escolha = "";

    print("Informe seu nome: ");

    var nome = consoleUtil.inputString();

    print("Informe seu peso: ");

    var peso = consoleUtil.inputDouble();

    print("Informe sua altura: ");

    var altura = consoleUtil.inputDouble();

    var calculadora = Calculadora(nome, peso, altura);

    print(calculadora.calcularIMC());

    while (escolha.toUpperCase() != "S" && escolha.toUpperCase() != "N") {
      print("Calcular novamente? 'S'-Sim, 'N'-Não");
      escolha = consoleUtil.inputString();
    }
  }
}
