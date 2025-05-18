import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.size, required this.hintText, required this.keyboardType, this.suffixIcon,
  });

  final Size size;
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width*0.872395,
      height: size.height*0.0670557,
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            fontFamily: "Rubik",
            color: Color(0XFF677294),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(
              color: Color(0X90677294),
            ),
          ),
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(
              color: Color(0X90677294),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(
              color: Color(0X90677294),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(
              color: Color(0X90677294),
            ),
          ),
        ),
      ),
    );
  }
}