import 'package:flutter/material.dart';
import 'package:salamtak/core/constants/widgets/circle_for_bg.dart';
import 'package:salamtak/features/onboarding/widgets/custom_elevated_button.dart';
import 'package:salamtak/features/onboarding/widgets/custom_hint_text.dart';
import 'package:salamtak/features/onboarding/widgets/custom_circle_for_onboarding.dart';
import 'package:salamtak/features/onboarding/widgets/custom_text.dart';
import 'package:salamtak/features/onboarding/widgets/custom_text_button.dart';

class OnboardingScreen02 extends StatelessWidget {
  const OnboardingScreen02({super.key});

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
                right: size.width * -0.2708,
                image: "assets/images/onboarding2.png",
              ),
              SizedBox(height: size.height * 0.10555),
              CustomText(text: "Choose Best Doctors"),
              SizedBox(height: size.height * 0.01365),
              CustomHintText(
                text:
                    "Contrary to popular belief, Lorem Ipsum is not \n simply random text. It has roots in a piece of it \n over 2000 years old.",
              ),
              SizedBox(height: size.height * 0.06457),
              CustomElevatedButton(
                onPressed:
                    () =>
                        Navigator.pushReplacementNamed(context, "/onboarding3"),
              ),
              SizedBox(height: size.height * 0.017384),
              CustomTextButton(
                onPressed:
                    () => Navigator.pushReplacementNamed(context, "/Signup"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
