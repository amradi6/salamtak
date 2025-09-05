import 'package:flutter/material.dart';
import 'package:salamtak/core/constants/widgets/circle_for_bg.dart';
import 'package:salamtak/features/onboarding/widgets/custom_elevated_button.dart';
import 'package:salamtak/features/onboarding/widgets/custom_hint_text.dart';
import 'package:salamtak/features/onboarding/widgets/custom_circle_for_onboarding.dart';
import 'package:salamtak/features/onboarding/widgets/custom_text.dart';
import 'package:salamtak/features/onboarding/widgets/custom_text_button.dart';

class OnboardingScreen03 extends StatelessWidget {
  const OnboardingScreen03({super.key});

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
            bottom: size.height * -0.08,
            right: size.width * -0.15,
            color: Color(0x480EBE7E),
          ),
          Column(
            children: [
              CustomCircleForOnboarding(
                size: size,
                top: size.height * -0.0248,
                left: size.width * -0.2708,
                image: "assets/images/onboarding3.png",
              ),
              SizedBox(height: size.height * 0.10555),
              CustomText(text: "Easy Appointments"),
              SizedBox(height: size.height * 0.01365),
              CustomHintText(
                text:
                    "Book your visits in just a few taps and manage your health with ease.",
              ),
              SizedBox(height: size.height * 0.06457),
              CustomElevatedButton(
                onPressed:
                    () => Navigator.pushReplacementNamed(context, "/who_are_you"),
              ),
              SizedBox(height: size.height * 0.017384),
              CustomTextButton(
                onPressed:
                    () => Navigator.pushReplacementNamed(context, "/who_are_you"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
