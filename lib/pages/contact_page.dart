import 'package:contact_list/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:contact_list/models/contact.dart';
import 'package:contact_list/widgets/custom_text_field.dart';
import 'package:contact_list/widgets/custom_button.dart';
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
                        : Image.asset(
                            "images/img-padrao.png",
                          ).image,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _nameController,
                  hintText: "Nome",
                  fieldType: TextInputType.text,
                  icon: Icons.person_outline,
                  onChanged: (text) {
                    setState(() {
                      _editedContact!.name = text;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _phoneController,
                  hintText: "Telefone",
                  fieldType: TextInputType.phone,
                  icon: Icons.phone_outlined,
                  onChanged: (number) {
                    setState(() {
                      _editedContact!.phone = number;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _emailController,
                  hintText: "Email",
                  fieldType: TextInputType.emailAddress,
                  icon: Icons.email_outlined,
                  onChanged: (text) {
                    setState(() {
                      _editedContact!.email = text;
                    });
                  },
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
            CustomButton(
              icon: Icons.check,
              textInfo: "Salvar",
              onTap: () {
                if (_nameController.text.isNotEmpty &&
                    _phoneController.text.isNotEmpty) {
                  if (_emailController.text.isEmpty) {
                    _editedContact!.email = "";
                    Navigator.pop(context, _editedContact);
                    return;
                  }
                  Navigator.pop(context, _editedContact);
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => const CustomAlertDialog(
                      title: "Informação",
                      contentInfo: "Há campos vazios",
                    ),
                  );
                }
              },
            ),
            CustomButton(
              icon: Icons.delete_outline,
              textInfo: "Excluir",
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}
