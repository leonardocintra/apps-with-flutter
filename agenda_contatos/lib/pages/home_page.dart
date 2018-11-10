import 'package:agenda_contatos/helpers/contact_helpers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    super.initState();

    Contact contact = Contact();
    contact.name = "Juliana Cintra";
    contact.email = "juliana.cintra@luizalabs.com";
    contact.phone = "45454545";
    contact.img = "teste";

    helper.saveContact(contact);

    helper.getAllContact().then((list) {
      print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
