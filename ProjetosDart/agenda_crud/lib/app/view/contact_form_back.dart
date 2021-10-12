import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store {
  Contact contato;
  var _service = GetIt.I.get<ContactService>();
  bool _nameIsValid;
  bool _emailIsValid;
  bool _telefoneIsValid;

  @action
  bool get isValid => _nameIsValid && _emailIsValid && _telefoneIsValid;

  // Diferenciar novo com alteração
  _ContactFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    contato = (parameter == null) ? Contact() : parameter;
  }

  // Salvar
  save() async {
    await _service.save(contato);
  }

  // Validações
  String validateName(String name) {
    try {
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String validateEmail(String email) {
    try {
      _service.validateEmail(email);
      _emailIsValid = true;
      return null;
    } catch (e) {
      _emailIsValid = false;
      return e.toString();
    }
  }

  String validateTelefone(String telefone) {
    try {
      _service.validateTelefone(telefone);
      _telefoneIsValid = true;
      return null;
    } catch (e) {
      _telefoneIsValid = false;
      return e.toString();
    }
  }
}
