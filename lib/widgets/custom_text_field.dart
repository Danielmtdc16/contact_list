import 'package:flutter/material.dart';
import 'package:contact_list/constantes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final TextInputType fieldType;
  final Function(String) onChanged;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.icon,
    required this.fieldType,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 17),
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
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              style: ktextFieldStyle,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.white54),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                prefixIcon: Icon(
                  icon,
                  color: kcolorIconsContactPage,
                ),
                contentPadding: EdgeInsets.zero,
              ),
              keyboardType: fieldType,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
