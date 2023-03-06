import 'package:flutter/material.dart';
import 'package:contact_list/constantes.dart';
import 'package:contact_list/models/contact.dart';
import 'package:contact_list/models/contact_helper.dart';
import 'package:contact_list/widgets/contact_box.dart';
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


    Contact d = Contact();
    d.name = "D";
    d.email = "as";
    d.phone = "sdas";
    d.img = "images/img-padrao.png";
    Contact c = Contact();
    c.name = "C";
    c.email = "as";
    c.phone = "sdas";
    c.img = "images/img-padrao.png";
    Contact e = Contact();
    e.name = "E";
    e.email = "as";
    e.phone = "sdas";
    e.img = "images/img-padrao.png";
    Contact a = Contact();
    a.name = "A";
    a.email = "as";
    a.phone = "sdas";
    a.img = "images/img-padrao.png";

    helper.saveContact(c);
    helper.saveContact(d);
    helper.saveContact(e);
    helper.saveContact(a);

    helper.getAllContacts().then((map) {
      setState(() {
        lettersContacts = map;
      });
    });

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
                Text(
                  "Contatos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          iconSize: 30,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                  child: const Text(
                    "Meu perfil",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kbackgroundContact,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Text("oi"),
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                            "SDASD",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
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
        }
        ));
  }
}
