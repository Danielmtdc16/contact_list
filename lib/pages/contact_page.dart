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

  bool _userEdited = false;
  Contact? _editedContact;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
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
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              GestureDetector(
                child: CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: Colors.blue,
                  backgroundImage: _editedContact!.img != null ?
                                   FileImage(File(_editedContact!.img!)) :
                                   null,
                  child: Center(
                    child: Icon(Icons.camera_alt),
                  ),
                ),
              ),
              SizedBox(height: 10,),
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
                      child: TextField(
                        controller: _nameController,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: "Nome",
                          hintStyle: TextStyle(color: Colors.white54,),
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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
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
                      child: TextField(
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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
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
                      child: TextField(
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
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check, color: kcolorIconsContactPage,),
                Text('Salvar', style: TextStyle(color: Colors.white, fontSize: 12),)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete_outline, color: kcolorIconsContactPage,),
                Text('Excluir', style: TextStyle(color: Colors.white, fontSize: 12),)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
