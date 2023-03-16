import 'package:flutter/material.dart';
import 'package:contact_list/models/contact.dart';
import 'package:contact_list/models/contact_helper.dart';
import 'package:contact_list/widgets/contact_box.dart';
import 'package:contact_list/widgets/card_contact.dart';
import 'contact_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  Map<String, List<Contact>> lettersContacts = {};

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    _getAllContacts();
    helper.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Contatos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _showContactPage();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          iconSize: 30,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 5),
                  child: Text(
                    "Meu perfil",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const CardContact(),
                generateContactBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  generateContactBox() {
    return Column(
        children: List.generate(lettersContacts.length, (index) {
      List<String> keys = lettersContacts.keys.toList();
      return ContactBox(lettersContacts: lettersContacts, letter: keys[index]);
    }));
  }

  void _showContactPage({Contact? contact}) async {
    final recContact = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactPage(contact: contact),
      ),
    );
    if (recContact != null){
      if (contact == null){
        await helper.saveContact(recContact);
        _getAllContacts();
      }
    }
  }

  void _getAllContacts(){
    helper.getAllContacts().then((map) {
      setState(() {
        lettersContacts = map;
      });
    });
  }
}
