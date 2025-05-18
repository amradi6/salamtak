import 'package:flutter/material.dart';
import 'package:salamtak/features/auth/widgets/custom_elevated_button.dart';
import 'package:salamtak/features/auth/widgets/custom_text_form_field.dart';

class ForgotScreen {
  static void showForgotPasswordSheet(BuildContext context) {
    final Size size=MediaQuery.of(context).size ;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.height*0.025),
            Center(
              child: Container(
                width: 130,
                height: 5,
                decoration: BoxDecoration(
                  color: Color(0XFFC4C4C4),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            SizedBox(height: size.height*0.0682975),
            Padding(
              padding: EdgeInsets.only(left:size.width*0.05208333),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot password",
                      style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF000000),
                            fontFamily: "Rubik",
                          ),
                        ),
                    SizedBox(height: size.height*0.03125),
                    Text(
                      "Enter your email for the verification process, \n we will send 4 digits code to your email.",
                      style: TextStyle(
                          color: Color(0XFF677294),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Rubik"
                      ),
                    ),
                    SizedBox(height: size.height*0.044703837),
                  ],
                ),
              ),
            ),
            CustomTextFormField(
              size: size,
              keyboardType: TextInputType.emailAddress,
              hintText: "Email",
            ),
            SizedBox(height: size.height*0.03725319),
            CustomElevatedButton(size: size,text: "Continue",onPressed: () {},),
            SizedBox(height: size.height*0.0620886),
          ],
        ),
      ),
    );
  }
}