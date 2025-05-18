import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
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
