import 'package:flutter/material.dart';
import 'package:contact_list/widgets/card_contact.dart';
import 'package:contact_list/models/contact.dart';
import '../constantes.dart';

class ContactGroup extends StatelessWidget {

  final String? letter;
  final List<Contact> contacts;


  const ContactGroup({Key? key, this.letter, required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column();
  }


}
