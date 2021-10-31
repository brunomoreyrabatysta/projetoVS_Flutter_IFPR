import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

class ContactService {
  var _dao = GetIt.I.get<ContactDAO>();

  // Tem que salvar um contato, ter a possibilidade de alterar e excluir elistar todos os contatos
  // nome -> seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  // e-amil-> seja obrigatório e tenha @
  // telefone -> seja obrigatório e tenha o formato (99) 9 9999-9999

  save(Contact contact) {
    validateName(contact.nome);
    validateEmail(contact.email);
    validateTelefone(contact.telefone);

    _dao.save(contact);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Contact>> find() {
    return _dao.find();
  }

  validateName(String name) {
    var min = 3;
    var max = 50;

    if (name == null) {
      throw new DomainLayerExcpetion("O nome é obrigatório.");
    } else if (name.length < min) {
      throw new DomainLayerExcpetion(
          "O nome deve ter conter pelo menos $min caraceres.");
    } else if (name.length > max) {
      throw new DomainLayerExcpetion(
          "O nome deve ter conter no máximo $max caraceres.");
    }
  }

  validateEmail(String email) {
    if (email == null) {
      throw new DomainLayerExcpetion("O e-mail é obrigatório.");
    } else if (!email.contains('@')) {
      throw new DomainLayerExcpetion("O e-mail deve conter o caracter @.");
    }
  }

  validateTelefone(String telefone) {
    var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$');
    if (telefone == null) {
      throw new DomainLayerExcpetion("O telefone é obrigatório.");
    } else if (!format.hasMatch(telefone)) {
      throw new DomainLayerExcpetion(
          "O telefone está no formato inválido. O formato deve ser (99) 9 9999-9999.");
    }
  }
}
