import 'package:flutter/material.dart';
import 'package:contact_list/constantes.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String textInfo;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.textInfo,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: kcolorIconsContactPage,
            ),
            Text(
              textInfo,
              style: kinfoButtonStyle,
            )
          ],
        ),
      ),
    );
  }
}
