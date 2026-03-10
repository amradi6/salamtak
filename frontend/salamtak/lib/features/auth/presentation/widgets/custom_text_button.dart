import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, required this.text, this.onPressed,
  });
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Color(0X800EBE7F),
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: "Rubik",
        ),
      ),
    );
  }
}