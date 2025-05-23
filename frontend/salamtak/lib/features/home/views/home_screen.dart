import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:salamtak/features/home/widgets/custom_icons_for_classification.dart .dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.1838,
              left: size.width * -0.265625,
              child: Stack(
                children: [
                  Container(
                    width: size.width * 0.56,
                    height: size.width * 0.56,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [Color(0x8061CEFF), Colors.transparent],
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
              top: size.height * 1.1697,
              left: size.width * 0.4896,
              child: Stack(
                children: [
                  Container(
                    width: size.width*0.630208,
                    height: size.width*0.630208,
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

            Container(
              width: double.infinity,
              height: size.height * 0.19371662,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0XFF0EBE7E), Color(0XFF07D9AD)],
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            ),

            Positioned(
              top: size.height * 0.0447038,
              left: size.width * 0.049479166,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi AmrAdi",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Rubik",
                              color: Color(0XFFFAFAFA),
                              decoration:
                              TextDecoration.none, // Removed underline
                            ),
                          ),
                          SizedBox(height: size.height * 0.0074506),
                          Text(
                            "Find Your Doctor",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Rubik",
                              color: Color(0XFFFFFFFF),
                              decoration:
                              TextDecoration.none, // Removed underline
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: size.width * 0.18489583),
                      CircleAvatar(radius: 30, child: Icon(Icons.person)),
                    ],
                  ),
                  SizedBox(height: size.height * 0.0335278),
                  SizedBox(
                    width: size.width * 0.872395,
                    height: size.height * 0.0670557,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0XFF0EBE7E),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0XFFFFFFFF),
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search..... ",
                        suffixIcon: Icon(Icons.cancel),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: size.height*0.2607723,
              left: size.width*0.04947916,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: size.width*0.04947916),
                    child: Text(
                      "reels",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF333333),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: size.height*0.02483546
                  ),
                  SizedBox(
                    height: size.height * 0.208617906,
                    width:size.width * 0.9,
                    child: ListView.builder(
                      itemCount: 20,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: size.height*0.208617906,
                          width: size.width*0.303333,
                          margin: EdgeInsets.only(left: size.width*0.03781),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Placeholder(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              left: size.width*0.0520833,
              top: size.height*0.55755619,
              child: SizedBox(
                height: size.height*0.14777101,
                width: size.width*1.0130208,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CustomIconsForClassification(size: size, color: [
                      Color(0XFF2753F3),
                      Color(0XFF765AFC),
                    ], image: "assets/images/teeth.png",),
                    CustomIconsForClassification(size: size, color: [
                      Color(0XFF0EBE7E),
                      Color(0XFF07D9AD),
                    ], image: "assets/images/heart.png",),
                    CustomIconsForClassification(size: size, color: [
                      Color(0XFFFE7F44),
                      Color(0XFFFFCF68),
                    ], image: "assets/images/eye.png",),
                    CustomIconsForClassification(size: size, color: [
                      Color(0XFFFF484C),
                      Color(0XFFFF6C60),
                    ], image: "assets/images/Digestive.png",),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}