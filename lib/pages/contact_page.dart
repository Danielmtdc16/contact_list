import 'package:flutter/material.dart';
import 'package:contact_list/models/contact.dart';
import 'package:contact_list/constantes.dart';
import 'dart:io';

class ContactPage extends StatefulWidget {
  final Contact? contact;

  const ContactPage({Key? key, this.contact}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Contact? _editedContact;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameFocus = FocusNode();
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      print("Entrei na contact Page");
      print("O contato é : ${widget.contact!.name}");
      print("O contato é : ${widget.contact!.phone}");
      print("O contato é : ${widget.contact!.email}");
      _editedContact = Contact.fromMap(widget.contact!.toMap());

      _nameController.text = _editedContact!.name!;
      _phoneController.text = _editedContact!.phone!;
      _emailController.text = _editedContact!.email!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
          child: Form(
            key: _key,
            child: Column(
              children: [
                GestureDetector(
                  child: CircleAvatar(
                    maxRadius: 40,
                    backgroundColor: Colors.blue,
                    backgroundImage: _editedContact!.img != null
                        ? FileImage(File(_editedContact!.img!))
                        : Image.asset("images/img-padrao.png",).image,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 17),
                  height: 50,
                  decoration: BoxDecoration(
                    color: kbackgroundContact,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _nameController,
                          focusNode: _nameFocus,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText: "Nome",
                            hintStyle: TextStyle(
                              color: Colors.white54,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: kcolorIconsContactPage,
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                          onChanged: (text) {
                            setState(() {
                              _editedContact!.name = text;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 17),
                  height: 50,
                  decoration: BoxDecoration(
                    color: kbackgroundContact,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _phoneController,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText: "Telefone",
                            hintStyle: TextStyle(color: Colors.white54),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.phone_outlined,
                              color: kcolorIconsContactPage,
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                          keyboardType: TextInputType.phone,
                          onChanged: (number) {
                            setState(() {
                              _editedContact!.phone = number;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 17),
                  height: 50,
                  decoration: BoxDecoration(
                    color: kbackgroundContact,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _emailController,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.white54),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: kcolorIconsContactPage,
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (text) {
                            setState(() {
                              _editedContact!.email = text;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check,
                    color: kcolorIconsContactPage,
                  ),
                  Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
              onTap: () {
                if (_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty) {
                  if (_emailController.text.isEmpty){
                    _editedContact!.email = ' ';
                    Navigator.pop(context, _editedContact);
                    return;
                  }
                  Navigator.pop(context, _editedContact);
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      backgroundColor: kbackgroundContact,
                      title: Text(
                        "Ops...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      content: Text(
                        "Há campos em branco.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                }
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete_outline,
                  color: kcolorIconsContactPage,
                ),
                Text(
                  'Excluir',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
