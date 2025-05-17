import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:salamtak/features/onboarding/views/onboarding_screen_02.dart';
import 'package:salamtak/features/onboarding/widgets/custom_elevated_button.dart';
import 'package:salamtak/features/onboarding/widgets/custom_hint_text.dart';
import 'package:salamtak/features/onboarding/widgets/custom_sizedbox.dart';
import 'package:salamtak/features/onboarding/widgets/custom_text.dart';
import 'package:salamtak/features/onboarding/widgets/custom_text_button.dart';
import 'package:salamtak/shared/utils/create_route.dart';

class OnboardingScreen01 extends StatelessWidget {
  const OnboardingScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: size.height * -0.08,
            right: size.width * -0.15,
            child: Stack(
              children: [
                Container(
                  width: size.width * 0.5625,
                  height: size.width * 0.5625,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [Color(0x480EBE7E), Colors.transparent],
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
          Column(
            children: [
              CustomSizedBox(
                size: size,
                top: size.height * -0.0248,
                left: size.width * -0.2708,
                image: "assets/images/onboarding1.png",
              ),
              SizedBox(height: size.height * 0.10555),
              CustomText(text: "Find Trusted Doctors"),
              SizedBox(height: size.height * 0.01365),
              CustomHintText(
                text:
                    "Contrary to popular belief, Lorem Ipsum is not \n simply random text. It has roots in a piece of it \n over 2000 years old.",
              ),
              SizedBox(height: size.height * 0.06457),
              CustomElevatedButton(
                onPressed:
                    () => Navigator.pushReplacementNamed(context, "/onboarding2"),
              ),
              SizedBox(height: size.height * 0.017384),
              CustomTextButton(),
            ],
          ),
        ],
      ),
    );
  }
}
