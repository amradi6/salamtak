import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/core/constants/widgets/circle_for_bg.dart';
import 'package:salamtak/features/auth/cubit/auth_cubit.dart';
import 'package:salamtak/features/auth/cubit/auth_state.dart';
import 'package:salamtak/features/auth/views/forgot_screen.dart';
import 'package:salamtak/features/auth/widgets/auth_with_google.dart';
import 'package:salamtak/features/auth/widgets/custom_elevated_button.dart';
import 'package:salamtak/features/auth/widgets/custom_text_button.dart';
import 'package:salamtak/features/auth/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController emailController = TextEditingController();

final TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit,AuthState>(
      listener: (context, state) {
        if(state is LogInSuccess){
          Navigator.pushNamed(context, '/layout');
        }
        if(state is LogInError){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (BuildContext context, state) {
        if (state is LogInLoading) {
         return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold(
          backgroundColor: Color(0XFFFFFFFF),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                CircleForBg(
                  size: size,
                  width: size.width * 0.5625,
                  height: size.width * 0.5625,
                  top: size.height * -0.1242,
                  left: size.width * -0.0859,
                  color: Color(0x8461CEFF),
                ),

                CircleForBg(
                  size: size,
                  width: size.width * 0.716145,
                  height: size.width * 0.716145,
                  top: size.height * 0.8057,
                  left: size.width * 0.5260,
                  color: Color(0x4D0EBE7E),
                ),

                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.1577052),
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
                            controller: emailController,
                            obscure: false,
                            size: size,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "Email",
                          ),
                          SizedBox(height: size.height * 0.022351),
                          CustomTextFormField(
                            controller: passwordController,
                            size: size,
                            obscure: context
                                .watch<AuthCubit>()
                                .obscurePassword,
                            keyboardType: TextInputType.visiblePassword,
                            hintText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  context
                                      .read<AuthCubit>()
                                      .togglePasswordVisibility(),
                              icon: Icon(
                                context
                                    .read<AuthCubit>()
                                    .obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0XFF677294),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.0397367),
                      CustomElevatedButton(
                        onPressed: () {
                          context.read<AuthCubit>().logIn(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        },
                        text: "Log in",
                        size: size,
                      ),
                      SizedBox(height: size.height * 0.023593),
                      CustomTextButton(
                        text: "Forgot password?",
                        onPressed: () {
                          ForgotScreen.showForgotPasswordSheet(context);
                        },
                      ),
                      SizedBox(height: size.height * 0.1),
                      CustomTextButton(
                        text: "Don’t have an account? Join us",
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/Signup");
                        },
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
