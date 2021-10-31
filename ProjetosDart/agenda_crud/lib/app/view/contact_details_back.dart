import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailsBack {
  BuildContext context;
  Contact contato;

  ContactDetailsBack(this.context) {
    contato = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async {
    await canLaunch(url) ? await launch(url) : showModalError(context);
  }

  launchPhone(Function(BuildContext context) showModalError) async {
    _launchApp('tel:${contato.telefone}', showModalError);
  }

  launchSMS(Function(BuildContext context) showModalError) async {
    _launchApp('sms:${contato.telefone}', showModalError);
  }

  launchEmail(Function(BuildContext context) showModalError) async {
    _launchApp('mailto:${contato.email}', showModalError);
  }
}
