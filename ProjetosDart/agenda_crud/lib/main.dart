import 'package:flutter/material.dart';

import 'app/injection.dart';
import 'app/my_app.dart';

void main() {
  setupInjection();
  runApp(MyApp());
}

/*
voi main() async {
  // await/async avisa para aguardar a finalização do método, para continuar
  await BuscarDados();
  print('carrega a tela');
  print('botões');
  print('campos');
  print('imagens');
}

Future buscarDados() {
  return Future.delayed(Duration(seconds:5),() => print('carregou os dados... '));
}
*/
