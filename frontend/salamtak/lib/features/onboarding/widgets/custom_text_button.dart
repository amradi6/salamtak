import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Skip",
        style: TextStyle(
          fontSize: 14,
          fontFamily: "Rubik",
          fontWeight: FontWeight.w300,
          color: Color(0xFF677294),
        ),
      ),
    );
  }
}
