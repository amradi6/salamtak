import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/auth/cubit/auth_cubit.dart';
import 'package:salamtak/features/auth/cubit/auth_state.dart';
import 'package:salamtak/features/auth/widgets/custom_text_form_field.dart';

import '../widgets/custom_elevated_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double circleSize = size.width * 0.5625;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is SingUpLoading){
          CircularProgressIndicator();
        }
        if (state is SingUpSuccess) {
          Navigator.pushReplacementNamed(context, '/home');
        }
        if(state is SingUpError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0XFFFFFFFF),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
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
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.1887495,
                          left: size.width * 0.02,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Join us to start searching",
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
                      SizedBox(height: size.height * 0.083229),
                      Container(
                        width: size.width * 0.41666,
                        height: size.height * 0.06705575,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Color(0X06000000), blurRadius: 22),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0XFFFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: size.width * 0.03),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/google.png",
                                  width: size.width * 0.0473177,
                                  height: size.height * 0.022563,
                                ),
                                SizedBox(width: size.width * 0.0333),
                                Text(
                                  "Google",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Rubik",
                                    color: Color(0XFF677294),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.04222),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.052083),
                        child: Column(
                          children: [
                            CustomTextFormField(
                              size: size,
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              hintText: "Name",
                            ),
                            SizedBox(height: size.height * 0.022351),
                            CustomTextFormField(
                              controller: emailController,
                              size: size,
                              keyboardType: TextInputType.emailAddress,
                              hintText: "Email",
                            ),
                            SizedBox(height: size.height * 0.022351),
                            CustomTextFormField(
                              controller: passwordController,
                              size: size,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: "Password",
                              suffixIcon: Icon(Icons.remove_red_eye),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.1043089),
                      CustomElevatedButton(
                        size: size,
                        text: "Sign up",
                        onPressed: () {
                          context.read<AuthCubit>().signup(
                            email: emailController.text,
                            username: nameController.text,
                            password1: passwordController.text,
                            password2: passwordController.text,
                          );
                        },
                      ),
                      SizedBox(height: size.height * 0.002111),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Have an account? Log in",
                          style: TextStyle(
                            color: Color(0X800EBE7F),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Rubik",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
