import 'package:flutter/material.dart';
import 'package:salamtak/core/constants/widgets/circle_for_bg.dart';
import 'package:salamtak/core/constants/widgets/text_form_for_search.dart';

class FindDoctorScreen extends StatelessWidget {
  const FindDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CircleForBg(
            size: size,
            width: size.width * 0.56,
            height: size.width * 0.56,
            top: size.height * -0.0397,
            left: size.width * -0.1875,
            color: Color(0X4361CEFF),
          ),
          CircleForBg(
            size: size,
            width: size.width * 0.56,
            height: size.width * 0.56,
            top: size.height * 0.257,
            left: size.width * 1.638,
            color: Color(0X1E0EBE7E),
          ),
          Positioned(
            top: size.height*0.0447,
            left: size.width*0.052,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap:() => Navigator.pop(context),
                      child: Container(
                        width: size.width*0.078,
                        height: size.width*0.078,
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0XFF677294),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width*0.049),
                    Text(
                      "Find Doctors",
                      style: TextStyle(
                        color: Color(0XFF222222),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Rubik"
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height*0.0422),
                TextFormForSearch(size: size, textInputType: TextInputType.text, filled: true, hintText: "Search...."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
