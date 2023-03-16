import 'package:flutter/material.dart';
import 'package:contact_list/constantes.dart';

class CardContact extends StatelessWidget {

  const CardContact({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kbackgroundContact,
      ),
      child: const Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("oi"),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              "SDASD",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
