import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/core/constants/widgets/circle_for_bg.dart';
import 'package:salamtak/core/constants/widgets/text_form_for_search.dart';
import 'package:salamtak/features/home/cubit/home__cubit.dart';
import 'package:salamtak/features/home/cubit/home__state.dart';
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
        final popDoctors = context.watch<HomeCubit>().popularDoctors;
        final featDoctors = context.watch<HomeCubit>().featureDoctors;

        return Scaffold(
          backgroundColor: Color(0XFFFFFFFF),
          body: Stack(
            children: [
              CircleForBg(
                size: size,
                top: size.height * 0.1838,
                left: size.width * -0.265625,
                width: size.width * 0.56,
                height: size.width * 0.56,
                color: Color(0x8061CEFF),
              ),

              CircleForBg(
                size: size,
                bottom: size.height * 0.0062,
                left: size.width * 0.4896,
                width: size.width * 0.630208,
                height: size.width * 0.630208,
                color: Color(0x480EBE7E),
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
                      GestureDetector(
                        onTap:
                            () => Navigator.pushNamed(context, "/find_doctor"),
                        child: AbsorbPointer(
                          child: TextFormForSearch(
                            size: size,
                            filled: true,
                            textInputType: TextInputType.text,
                            hintText: "Search..... ",
                          ),
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(height: size.height * 0.037253197),

                          SizedBox(
                            height: size.height * 0.14777101,
                            width: size.width * 1.0130208,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                CustomIconsForClassification(
                                  size: size,
                                  color: [Color(0XFF2753F3), Color(0XFF765AFC)],
                                  image: "assets/images/teeth.png",
                                ),
                                CustomIconsForClassification(
                                  size: size,
                                  color: [Color(0XFF0EBE7E), Color(0XFF07D9AD)],
                                  image: "assets/images/heart.png",
                                ),
                                CustomIconsForClassification(
                                  size: size,
                                  color: [Color(0XFFFE7F44), Color(0XFFFFCF68)],
                                  image: "assets/images/eye.png",
                                ),
                                CustomIconsForClassification(
                                  size: size,
                                  color: [Color(0XFFFF484C), Color(0XFFFF6C60)],
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
                                  itemCount: popDoctors.length,
                                  itemBuilder: (context, index) {
                                    final doctor = popDoctors[index];
                                    return ContainerForPopularDoctor(
                                      onTap: () {
                                        Navigator.of(context).pushReplacementNamed("/doctor_details");
                                      },
                                      size: size,
                                      image: doctor.image,
                                      nameDoctor: doctor.name,
                                      doctorSpecialty: doctor.specialty!,
                                      rating: doctor.rating,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: size.height * 0.03849497),

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
                                height: size.height * 0.2,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: featDoctors.length,
                                  itemBuilder: (context, index) {
                                    final doctor = featDoctors[index];
                                    return ContainerForFeatureDoctor(
                                      size: size,
                                      totalRate: doctor.rating,
                                      image: doctor.image,
                                      nameDoctor: doctor.name,
                                      price: doctor.price!,
                                      isFavourite: doctor.isFavorite!,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: size.height * 0.124),
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
