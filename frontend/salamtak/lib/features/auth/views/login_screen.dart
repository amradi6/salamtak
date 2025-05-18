import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:salamtak/features/auth/views/forgot_screen.dart';
import 'package:salamtak/features/auth/widgets/auth_with_google.dart';
import 'package:salamtak/features/auth/widgets/custom_elevated_button.dart';
import 'package:salamtak/features/auth/widgets/custom_text_button.dart';
import 'package:salamtak/features/auth/widgets/custom_text_form_field.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double circleSize = size.width * 0.5625;
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body:SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: size.height * -0.1242,
              left: size.width * -0.0859,
              child: Stack(
                children: [
                  Container(
                    width: circleSize,
                    height: circleSize,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [Color(0x8461CEFF), Colors.transparent],
                        radius: 0.8,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: size.height * 0.8057,
              left: size.width * 0.5260,
              child: Stack(
                children: [
                  Container(
                    width: size.width * 0.716145,
                    height: size.width * 0.716145,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [Color(0x4D0EBE7E), Colors.transparent],
                        radius: 0.8,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                ],
              ),
            ),

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.1577052,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome back",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Rubik",
                              color: Color(0XFF000000),
                            ),
                          ),
                          SizedBox(height: size.height * 0.018633),
                          Text(
                            "You can search course, apply course and find \n              scholarship for abroad studies",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Rubik",
                              color: Color(0XFF677294),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.083229),
                  AuthWithGoogle(size: size),
                  SizedBox(height: size.height * 0.04222),
                  Column(
                    children: [
                      CustomTextFormField(
                        size: size,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Email",
                      ),
                      SizedBox(height: size.height * 0.022351),
                      CustomTextFormField(
                        size: size,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: "Password",
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height*0.0397367),
                  CustomElevatedButton(onPressed: () {}, text: "Log in", size: size),
                  SizedBox(height: size.height*0.023593),
                  CustomTextButton(text: "Forgot password?", onPressed: () {
                    ForgotScreen.showForgotPasswordSheet(context);
                  },),
                  SizedBox(height: size.height*0.1),
                  CustomTextButton(text: "Don’t have an account? Join us", onPressed: () {
                    Navigator.pushNamed(context, "/Signup");
                  },),
                ],
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
