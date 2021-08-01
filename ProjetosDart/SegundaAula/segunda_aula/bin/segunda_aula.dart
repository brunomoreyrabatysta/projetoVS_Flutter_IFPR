import 'package:segunda_aula/segunda_aula.dart' as segunda_aula;
import 'dart:io';

void main(List<String> arguments) {
  print('Informe a sua nota: ');
  var entradaNota = stdin.readLineSync();
  var nota = double.parse(entradaNota);

  print('Informe o % da sua presença: ');
  var entradaPresenca = stdin.readLineSync();
  var presenca = int.parse(entradaPresenca);

/*
  if ((nota > 5.99 || notaRecuperacao > 5.99) && presenca >= 75) {
    print('Você foi aprovado! Parabéns!');
  } else {
    if (presenca < 75) {
      print('Você foi reprovado pela frequência!');
    } else {
      var notaQueFaltou = 0.0;
      if (nota < 6) {
        notaQueFaltou = 6 - nota;
        print('Você foi reprovado! Faltou $notaQueFaltou pontos na prova!');
      }
      if (notaRecuperacao < 6) {
        notaQueFaltou = 6 - notaRecuperacao;
        print(
            'Você foi reprovado! Faltou $notaQueFaltou pontos na recuperação!');
      }
    }
    //print('Você foi reprovado!');
  }
  */

  if (presenca >= 75) {
    if (nota >= 6) {
      print('Você foi aprovado!');
    } else {
      print('Informe a nota da recuperação: ');
      var entradaNotaRecuperacao = stdin.readLineSync();
      var notaRecuperacao = double.parse(entradaNotaRecuperacao);

      if (notaRecuperacao >= 6) {
        print('Você foi aprovado na recuperação!');
      } else {
        print('Você foi reprovado na recuperação');
      }
    }
  } else {
    print('Você foi reprovado pela frequência!');
  }
}
