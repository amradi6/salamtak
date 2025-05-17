import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 295,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: Color(0xFF0EBE7F),
        ),
        child: Text(
          "Get Started",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Rubik",
            fontWeight: FontWeight.normal,
            color: Color(0XFFFFFFFF),
          ),
        ),
      ),
    );
  }
}