import 'package:flutter/material.dart';
import '../models/contact_helper.dart';
import '../constantes.dart';
import 'e.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  List<Contact> contacts = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    Contact c = Contact();
    c.name = "D";
    c.email = "as";
    c.phone = "sdas";
    c.img = "asds";
    Contact d = Contact();
    d.name = "D";
    d.email = "as";
    d.phone = "sdas";
    d.img = "asds";

    helper.saveContact(c);
    helper.saveContact(d);

    helper.getAllContacts().then((list) {
      setState(() {
        contacts = list as List<Contact>;
      });
    });

    print(contacts.length);
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
                  width: double.infinity,
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
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                  child: const Text(
                    "A",
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      print(contacts.length);
                      return _contactCard(context, index);
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                  child: const Text(
                    "B",
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      print(contacts.length);
                      return _contactCard(context, index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: const Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Text("oi"),
                backgroundColor: Colors.blue,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Text(
                  "SDASD",
                  style: TextStyle(color: Colors.white),
                ),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 50),
            child: Divider(
              color: Colors.white10,
              height: 19,
              thickness: 1,
            ),
          )
        ],
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => E()));
      },
    );
  }
}
