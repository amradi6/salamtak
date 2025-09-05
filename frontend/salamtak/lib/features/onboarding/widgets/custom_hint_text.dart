import 'package:flutter/material.dart';

class CustomHintText extends StatelessWidget {
  const CustomHintText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14,
        fontFamily: "Rubik",
        fontWeight: FontWeight.w300,
        color: Color(0xFF677294),
      ),
    );
  }
}
