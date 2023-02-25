import 'package:flutter/material.dart';
import '../models/contact_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /*Contact c = Contact();
    c.name = "D";
    c.email = "as";
    c.phone = "sdas";
    c.img = "asds";

    helper.saveContact(c);

    helper.getAllContacts().then((value) => print(value));*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 80),
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
                height: 80,
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
              SizedBox(height: 20,),
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
                  color: Color(0xFF171717),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Text("oi"),
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(width: 20,),
                    Expanded(child: Text("SDASD", style: TextStyle(color: Colors.white),)),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
