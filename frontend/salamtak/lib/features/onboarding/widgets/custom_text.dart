import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 28,
        fontFamily: "Rubik",
        fontWeight: FontWeight.normal,
        color: Color(0xFF333333),
      ),
    );
  }
}
