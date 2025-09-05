import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/core/constants/widgets/circle_for_bg.dart';
import 'package:salamtak/features/find_doctors/widgets/container_for_search_doctors.dart';
import 'package:salamtak/features/home/cubit/home__cubit.dart';
import 'package:salamtak/features/home/cubit/home__state.dart';
import 'package:salamtak/shared/utils/doctor_shimmer.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchPopularDoctors();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
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
            bottom: size.height * 0.0062,
            left: size.width * 0.4896,
            color: Color(0X1E0EBE7E),
          ),
          Positioned(
            top: size.height * 0.0447,
            left: size.width * 0.052,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: size.width * 0.078,
                        height: size.width * 0.078,
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0XFF677294),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.049),
                    Text(
                      "Popular Doctors",
                      style: TextStyle(
                        color: Color(0XFF222222),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Rubik",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.0422),
                SizedBox(
                  height: size.height*0.76561,
                  width: size.width * 0.872,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is PopularDoctorsSuccess) {
                        return RefreshIndicator(
                          onRefresh: () => context.read<HomeCubit>().fetchPopularDoctors(),
                          backgroundColor: Colors.white,
                          color: Colors.green,
                          child: ListView.builder(
                            itemCount: state.popularDoctors.length,
                            itemBuilder: (context, index) {
                              final doctor = state.popularDoctors[index];
                              return GestureDetector(
                                onTap:
                                  () => Navigator.pushNamed(
                                context,
                                "/doctor_details",
                                arguments: doctor,
                              ),
                                child: ContainerForFindDoctors(
                                  size: size,
                                  doctor: doctor,
                                  onTap: () => Navigator.pushNamed(context, "/doctor_details",arguments: doctor),
                                ),
                              );
                            },
                          ),
                        );
                      } else if (state is PopularDoctorsLoading) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: size.height * 0.0099,
                              ),
                              child: DoctorShimmer(
                                size: size,
                                height: size.height * 0.2111,
                                width: size.width * 0.8723,
                              ),
                            );
                          },
                        );
                      } else if (state is PopularDoctorsError) {
                        return Center(child: Text("Error: ${state.message}"));
                      } else {
                        return Center(child: Text("Error: some thing failed"));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
