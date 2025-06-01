import 'package:flutter/material.dart';

class TextFormForSearch extends StatelessWidget {
  const TextFormForSearch({
    super.key,
    required this.size,
    required this.textInputType,
    required this.filled,
    this.controller,
    required this.hintText,
    this.onTap,
    this.onChanged,
    this.suffixIcon, this.validator, this.onFieldSubmitted,
  });

  final Size size;
  final TextInputType textInputType;
  final bool filled;
  final TextEditingController? controller;
  final String hintText;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.872395,
      height: size.height * 0.0670557,
      child: TextFormField(
        onTap: onTap,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted ,
        onChanged: onChanged,
        controller: controller,
        keyboardType: textInputType,
        cursorColor: Color(0XFF0EBE7E),
        decoration: InputDecoration(
          isDense: true,
          filled: filled,
          fillColor: Color(0XFFFFFFFF),
          prefixIcon: Icon(Icons.search),
          hintText: hintText,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          errorBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),
      ),
    );
  }
}
