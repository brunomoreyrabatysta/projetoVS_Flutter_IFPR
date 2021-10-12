import 'package:agenda_crud/app/view/contact_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(ContactFormBack back) {
    return TextFormField(
      validator: back.validateName,
      onSaved: (newValue) => back.contato.nome = newValue,
      initialValue: back.contato.nome,
      decoration: InputDecoration(labelText: 'Nome: '),
    );
  }

  Widget fieldEmail(ContactFormBack back) {
    return TextFormField(
      validator: back.validateEmail,
      onSaved: (newValue) => back.contato.email = newValue,
      initialValue: back.contato.email,
      decoration: InputDecoration(labelText: 'e-mail: '),
    );
  }

  Widget fieldTelefone(ContactFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');

    return TextFormField(
      validator: back.validateTelefone,
      onSaved: (newValue) => back.contato.telefone = newValue,
      initialValue: back.contato.telefone,
      inputFormatters: [mask],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: 'Telefone: ', hintText: '(99) 9 9999-9999'),
    );
  }

  Widget fieldUrlImage(ContactFormBack back) {
    return TextFormField(
      onSaved: (newValue) => back.contato.urlAvatar = newValue,
      initialValue: back.contato.urlAvatar,
      decoration: InputDecoration(
          labelText: 'Endereço foto: ', hintText: 'http://www.site.com'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);

    return Scaffold(
        appBar: AppBar(title: Text("Cadastro de Contato"), actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();

                if (_back.isValid) {
                  _back.save();
                  Navigator.of(context).pop();
                }
              })
        ]),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _form,
            child: Column(
              children: [
                fieldName(_back),
                fieldEmail(_back),
                fieldTelefone(_back),
                fieldUrlImage(_back),
              ],
            ),
          ),
        ));
  }
}
