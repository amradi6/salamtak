import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/auth/cubit/auth_cubit.dart';
import 'package:salamtak/features/auth/cubit/auth_state.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.size, required this.hintText, required this.keyboardType, this.suffixIcon, this.controller, required this.obscure,
  });

  final Size size;
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return SizedBox(
          width: size.width*0.872395,
          height: size.height*0.0670557,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscure,
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
      },
    );
  }
}