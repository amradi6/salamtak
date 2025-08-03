import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/core/constants/widgets/circle_for_bg.dart';
import 'package:salamtak/features/auth/cubit/auth_cubit.dart';

import '../widgets/custom_elevated_button.dart';

class WhoAreYouScreen extends StatefulWidget {
  const WhoAreYouScreen({super.key});

  @override
  State<WhoAreYouScreen> createState() => _WhoAreYouScreenState();
}

class _WhoAreYouScreenState extends State<WhoAreYouScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final authCubit = context.read<AuthCubit>();
    final isLoggedIn = await authCubit.isLoggedIn();
    if (isLoggedIn) {
      Future.microtask(() {
        Navigator.pushReplacementNamed(context, "/layout");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CircleForBg(
            size: size,
            width: size.width * 0.5625,
            height: size.width * 0.5625,
            top: size.height * -0.1242,
            left: size.width * -0.0859,
            color: const Color(0x8461CEFF),
          ),

          CircleForBg(
            size: size,
            width: size.width * 0.716145,
            height: size.width * 0.716145,
            top: size.height * 0.8057,
            left: size.width * 0.5260,
            color: Color(0x4D0EBE7E),
          ),

          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Who are you ?",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0XFF000000),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Rubik',
                  ),
                ),
                SizedBox(height: size.height * 0.0186),
                Text(
                  "Please choose the method you want to \n use to access the application.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0XFF677294),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                  ),
                ),
                SizedBox(height: size.height * 0.0645),
                CustomElevatedButton(
                  size: size,
                  text: "Sick",
                  onPressed: () {
                    Navigator.pushNamed(context, "/Signup");
                  },
                ),
                SizedBox(height: size.height * 0.039),
                CustomElevatedButton(
                  size: size,
                  text: "Doctor",
                  onPressed: () {
                    Navigator.pushNamed(context, "/Signup");
                  },
                ),
                SizedBox(height: size.height * 0.039),
                CustomElevatedButton(
                  size: size,
                  text: "Laboratory",
                  onPressed: () {
                    Navigator.pushNamed(context, "/Signup");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
