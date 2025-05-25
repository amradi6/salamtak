import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/home/cubit/home__cubit.dart';
import 'package:salamtak/features/home/widgets/container_for_feature_doctor.dart';
import 'package:salamtak/features/home/widgets/container_for_popular_doctor.dart';
import 'package:salamtak/features/home/widgets/custom_icons_for_classification.dart .dart';

class NoGlowScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final doctors = context.read<HomeCubit>().doctors;
        return Scaffold(
          backgroundColor: Color(0XFFFFFFFF),
          body: Stack(
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
                bottom: size.height*0.0062,
                left: size.width * 0.4896,
                child: Stack(
                  children: [
                    Container(
                      width: size.width * 0.630208,
                      height: size.width * 0.630208,
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

              Column(
                children: [
                  SizedBox(height: size.height * 0.044703837),

                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04947916,
                        ),
                        child: Row(
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
                                        TextDecoration
                                            .none, // Removed underline
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
                                        TextDecoration
                                            .none, // Removed underline
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: size.width * 0.18489583),
                            CircleAvatar(radius: 30, child: Icon(Icons.person)),
                          ],
                        ),
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.037253197),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.width * 0.04947916,
                            ),
                            child: Text(
                              "reels",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w300,
                                color: Color(0XFF333333),
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.02483546),

                          SizedBox(
                            height: size.height * 0.208617906,
                            child: ListView.builder(
                              itemCount: 20,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: size.height * 0.208617906,
                                  width: size.width * 0.303333,
                                  margin: EdgeInsets.only(
                                    left: size.width * 0.03781,
                                  ),
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

                          SizedBox(height: size.height * 0.037253197),

                          SizedBox(
                            height: size.height * 0.14777101,
                            width: size.width * 1.0130208,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                CustomIconsForClassification(
                                  size: size,
                                  color: [
                                    Color(0XFF2753F3),
                                    Color(0XFF765AFC),
                                  ],
                                  image: "assets/images/teeth.png",
                                ),
                                CustomIconsForClassification(
                                  size: size,
                                  color: [
                                    Color(0XFF0EBE7E),
                                    Color(0XFF07D9AD),
                                  ],
                                  image: "assets/images/heart.png",
                                ),
                                CustomIconsForClassification(
                                  size: size,
                                  color: [
                                    Color(0XFFFE7F44),
                                    Color(0XFFFFCF68),
                                  ],
                                  image: "assets/images/eye.png",
                                ),
                                CustomIconsForClassification(
                                  size: size,
                                  color: [
                                    Color(0XFFFF484C),
                                    Color(0XFFFF6C60),
                                  ],
                                  image: "assets/images/Digestive.png",
                                ),
                              ],
                            ),
                          ),

                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.0494791,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Popular Doctor",
                                      style: TextStyle(
                                        fontFamily: "Rubik",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0XFF333333),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "See all>",
                                        style: TextStyle(
                                          fontFamily: "Rubik",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w200,
                                          color: Color(0XFF677294),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.027319011),
                              SizedBox(
                                height: size.height * 0.327828138,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      context
                                          .read<HomeCubit>()
                                          .doctors
                                          .length,
                                  itemBuilder: (context, index) {
                                    final doctor = doctors[index];
                                    return ContainerForPopularDoctor(
                                      size: size,
                                      image: doctor["image"],
                                      nameDoctor: doctor["name"],
                                      doctorSpecialty: doctor["specialty"],
                                      rating: doctor["rating"],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: size.height*0.03849497),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.0494791,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Feature Doctor",
                                      style: TextStyle(
                                        fontFamily: "Rubik",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0XFF333333),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "See all>",
                                        style: TextStyle(
                                          fontFamily: "Rubik",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w200,
                                          color: Color(0XFF677294),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.027319011),
                              SizedBox(
                                height: size.height*0.2,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:5,
                                  itemBuilder: (context, index) {
                                    return ContainerForFeatureDoctor(size: size,totalRate: "3.7",image: "assets/images/doctor1.png",nameDoctor: "Dr. Crick", price: 25.00,);
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: size.height*0.0248354),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
