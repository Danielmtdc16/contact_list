import 'package:flutter/material.dart';
import 'package:contact_list/constantes.dart';
import 'package:contact_list/models/contact.dart';
import 'package:contact_list/pages/contact_page.dart';
import 'dart:io';


class ContactBox extends StatefulWidget {

  final Map<String, List<Contact>> lettersContacts;
  final String letter;

  const ContactBox({Key? key, required this.lettersContacts, required this.letter}) : super(key: key);

  @override
  State<ContactBox> createState() => _ContactBoxState();
}

class _ContactBoxState extends State<ContactBox> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20.0, bottom: 5),
          child: Text(
            widget.letter,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: kbackgroundContact,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.lettersContacts[widget.letter]!.length,
            itemBuilder: (context, index) {
              return _cardContact(context, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _cardContact(BuildContext context, int index){
    return GestureDetector(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              CircleAvatar(
                child: Text("oi"),
                backgroundColor: Colors.blue,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Text(
                    _organizer(index),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          _generateDivider(index)
        ],
      ),
      onTap: (){
        _showContactPage(widget.lettersContacts[widget.letter]![index]);
      },
    );
  }
  
  String _organizer(int index){
    if (widget.lettersContacts[widget.letter]![index].name == null || widget.lettersContacts[widget.letter]![index].name![0].toUpperCase() != widget.letter){
      return "";
    }
    return widget.lettersContacts[widget.letter]![index].name!;
  }

  Widget _generateDivider(int index){
    if (index + 1 != widget.lettersContacts[widget.letter]!.length){
      return const Padding(
        padding: EdgeInsets.only(right: 20, left: 50),
        child: Divider(
          color: Colors.white10,
          height: 7,
          thickness: 1,
        ),
      );
    } 
    return Container();
  }

  void _showContactPage(Contact contact) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage(contact: contact)));
  }

}
