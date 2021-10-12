import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../my_app.dart';
import 'contact_list_back.dart';

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
  final _back = ContactListBack();

  CircleAvatar circleAvatar(String url) {
    if (Uri.tryParse(url).isAbsolute) {
      return CircleAvatar(backgroundImage: NetworkImage(url));
    } else {
      return CircleAvatar(child: Icon(Icons.person));
    }
  }

  Widget iconEditButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, Function onPressed) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                      title: Text('Excluir'),
                      content: Text('Confirma a exclusão?'),
                      actions: [
                        FlatButton(
                            child: Text('Não'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        FlatButton(child: Text('Sim'), onPressed: onPressed)
                      ]));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Contatos'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _back.gotToForm(context);
                  //Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
                })
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Contact> lista = futuro.data;

                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var contato = lista[i];

                      //return Text(contato['nome']);
                      return ListTile(
                          leading: circleAvatar(contato.urlAvatar),
                          title: Text(contato.nome),
                          subtitle: Text(contato.telefone),
                          trailing: Container(
                              width: 100,
                              child: Row(children: [
                                iconEditButton(() {
                                  _back.gotToForm(context, contato);
                                }),
                                iconRemoveButton(context, () {
                                  _back.remove(contato.id);
                                  Navigator.of(context).pop();
                                })
                              ])));
                    },
                  );
                }
              });
        }));
  }
}
