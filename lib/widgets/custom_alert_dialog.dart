import 'package:flutter/material.dart';
import 'package:contact_list/constantes.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String contentInfo;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.contentInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kbackgroundContact,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: kinformationStyle,
      ),
      content: Text(
        contentInfo,
        textAlign: TextAlign.center,
        style: kinformationStyle,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
