import 'package:calculadora/models/pessoa.dart';

class Calculadora {
  Pessoa? _pessoa;

  Calculadora(String nome, double peso, double altura) {
    _pessoa = Pessoa(nome, peso, altura);
  }

  String getNomePessoa() {
    return _pessoa?.getNome() ?? "";
  }

  double getAlturaPessoa() {
    return _pessoa?.getAltura() ?? 0.001;
  }

  double getPesoPessoa() {
    return _pessoa?.getPeso() ?? 0.001;
  }

  String calcularIMC() {
    try {
      var peso = getPesoPessoa();
      var altura = getAlturaPessoa();
      var nome = getNomePessoa();
      var resultado = peso / (altura * altura);
      if (resultado.isNaN || resultado.isInfinite) {
        throw Exception("Dados incorretos");
      }
      var retorno = "Nome: $nome. IMC: $resultado.";
      if (resultado < 16) {
        return "$retorno Magreza grave";
      } else if (resultado >= 16 && resultado < 17) {
        return "$retorno Magreza moderada";
      } else if (resultado >= 17 && resultado < 18.5) {
        return "$retorno Magreza leve";
      } else if (resultado >= 18.5 && resultado < 25) {
        return "$retorno Saudável";
      } else if (resultado >= 25 && resultado < 30) {
        return "$retorno Sobrepeso";
      } else if (resultado >= 30 && resultado < 35) {
        return "$retorno Obesidade Grau I";
      } else if (resultado >= 35 && resultado < 40) {
        return "$retorno Obesidade Grau II (Severa)";
      } else {
        return "$retorno Obesidade Grau III (Mórbida)";
      }
    } catch (e) {
      return "ERRO: $e";
    }
  }
}
