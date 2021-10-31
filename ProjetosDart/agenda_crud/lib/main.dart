import 'package:flutter/material.dart';

import 'app/injection.dart';
import 'app/my_app.dart';

void main() async {
  setupInjection();
  runApp(MyApp());

/*
  await Firebase.initializeApp();
  FirebaseFirestore.instance.collection('contact').doc().set({
    'name': 'Joaquim',
    'phone': '(11)9 99852-9632',
    'e-mail': 'joaquim@email.com'
  });
  */
  /*
  await Firebase.initializeApp();
  var collection = FirebaseFirestore.instance.collection('contact');

  collection
      //.doc('rujevbTO3g07RxCieWoN')
      .doc()
      .set({
        'name': 'Hortência',
        'phone': '(11)9 9852-5555',
        'email': 'hortencia@email.com'
      } /*, SetOptions(merge: true)*/)
      //.update({'name': 'Eva5'})
      //.delete()
      .then((value) => print('deu certo!'))
      .catchError((error) => print('deu errado $error'));
      
  var result = await collection.get();

  // Ficar escutando alguma alteração
  collection.snapshots().listen((r) {
    result = r;
    print(r.docs[0]['name']);
  });

  for (var doc in result.docs) {
    print(doc['name']);
  }
  */
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
