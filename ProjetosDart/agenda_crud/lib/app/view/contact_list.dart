import 'package:agenda_crud/app/database/script.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../my_app.dart';

class ContactList extends StatelessWidget {
  /*
  final lista = [
    {
      'nome': 'Pietro',
      'telefone': '(11) 9 9874-5656',
      'avatar':
          'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png'
    },
    {
      'nome': 'Maitê',
      'telefone': '(11) 9 9632-8578',
      'avatar':
          'https://cdn.pixabay.com/photo/2021/01/17/09/11/woman-5924366_960_720.jpg'
    },
    {
      'nome': 'Hortência',
      'telefone': '(11) 9 9562-3356',
      'avatar':
          'https://cdn.pixabay.com/photo/2021/01/24/09/28/girl-5944691_960_720.jpg'
    }
  ];
  */

  Future<List<Map<String, dynamic>>> _buscar() async {
    String path = join(await getDatabasesPath(), 'banco');
    Database db = await openDatabase(path, version: 1, onCreate: (db, v) {
      db.execute(createTable);
      db.execute(insert1);
      db.execute(insert2);
      db.execute(insert3);
    });

    return db.query('contact');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            var lista = futuro.data;

            return Scaffold(
              appBar: AppBar(
                title: Text('Lista de Contatos'),
                actions: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
                    },
                  )
                ],
              ),
              body: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, i) {
                  var contato = lista[i];
                  var avatar = CircleAvatar(
                      backgroundImage: NetworkImage(contato['url_avatar']));
                  //return Text(contato['nome']);
                  return ListTile(
                      leading: avatar,
                      title: Text(contato['nome']),
                      subtitle: Text(contato['telefone']),
                      trailing: Container(
                          width: 100,
                          child: Row(children: [
                            IconButton(icon: Icon(Icons.edit), onPressed: null),
                            IconButton(
                                icon: Icon(Icons.delete), onPressed: null),
                          ])));
                },
              ),
            );
          } else {
            return Scaffold();
          }
        });
  }
}
