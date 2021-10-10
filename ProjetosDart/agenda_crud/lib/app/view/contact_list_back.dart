import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../my_app.dart';

part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store {
  var _service = GetIt.I.get<ContactService>();
  // Lista de contato
  @observable
  Future<List<Contact>> list;

  // método para atualizar a lista de contato
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ContactListBack() {
    refreshList();
  }

  // método para chamar o form salvar / alterar
  gotToForm(BuildContext context, [Contact contact]) {
    Navigator.of(context)
        .pushNamed(MyApp.CONTACT_FORM, arguments: contact)
        .then(refreshList());
  }

  // excluir
  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
