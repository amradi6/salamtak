import 'package:flutter/material.dart';

Future buildAlertWarning(BuildContext context,) {
  final size=MediaQuery.of(context).size;
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        icon: CircleAvatar(
          radius: 60,
          backgroundColor: Color(0XFFE7F8F2),
          child: Icon(Icons.warning_amber_rounded, color: Colors.red, size: size.height*0.08749),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: size.height*0.01312),
          child: Text(
            "You did not enter your information.",
            style: TextStyle(
              color: Color(0XFF333333),
              fontFamily: "Rubik",
              fontSize: 30,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        content: Padding(
          padding: EdgeInsets.only(top: size.height*0.0317),
          child: Text(
            "For the medical file, you must enter the information. You can click on the button to enter your information.",
            style: TextStyle(
              color: Color(0XFF677294),
              fontFamily: "Rubik",
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.pushNamed(context, "/medical_questionnaire_screen");
          }, child: Text(
              "OK",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              fontFamily: "Rubik"
            ),
          ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
                "Cancel",
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  fontFamily: "Rubik"
              ),
            ),
          ),
        ],
      );
    },
  );
}
