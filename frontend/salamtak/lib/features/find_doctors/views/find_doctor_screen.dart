import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/core/constants/widgets/circle_for_bg.dart';
import 'package:salamtak/core/constants/widgets/text_form_for_search.dart';
import 'package:salamtak/data/models/doctors.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_cubit.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_state.dart';
import 'package:salamtak/features/find_doctors/cubit/find_doctor_cubit.dart';
import 'package:salamtak/features/find_doctors/cubit/find_doctor_state.dart';
import 'package:salamtak/features/find_doctors/widgets/container_for_search_doctors.dart';
import 'package:salamtak/shared/utils/doctor_shimmer.dart';

class FindDoctorScreen extends StatefulWidget {
  const FindDoctorScreen({super.key});

  @override
  State<FindDoctorScreen> createState() => _FindDoctorScreenState();
}

class _FindDoctorScreenState extends State<FindDoctorScreen> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<FavoriteDoctorCubit>().fetchAllDoctors();
  }

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
                      "Find Doctors",
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
                Form(
                  key: _formKey,
                  child: TextFormForSearch(
                    controller: controller,
                    size: size,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please Enter The Name Doctor";
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      if (_formKey.currentState!.validate()) {
                        context.read<FindDoctorCubit>().filterDoctors(
                          value.trim(),
                        );
                      }
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<FindDoctorCubit>().resetDoctors();
                        controller.clear();
                      },
                      icon: Icon(Icons.cancel),
                    ),
                    onChanged: (value) {
                      final trimmedValue = value.trim();
                      if (trimmedValue.isEmpty) {
                        context.read<FindDoctorCubit>().resetDoctors();
                      } else {
                        context.read<FindDoctorCubit>().filterDoctors(
                          trimmedValue,
                        );
                      }
                    },
                    textInputType: TextInputType.text,
                    filled: true,
                    hintText: "Search....",
                  ),
                ),
                SizedBox(height: size.height * 0.0298),
                SingleChildScrollView(
                  child: SizedBox(
                    height: size.height * 0.745,
                    width: size.width * 0.872,
                    child: RefreshIndicator(
                      onRefresh: () => context.read<FindDoctorCubit>().fetchAllDoctors(),
                      color: Colors.green,
                      backgroundColor: Colors.white,
                      child: BlocBuilder<FindDoctorCubit, FindDoctorState>(
                        builder: (context, state) {
                          print("State:$state");
                          List<Doctors> doctors = context
                              .watch<FavoriteDoctorCubit>()
                              .allDoctors;
                          if(state is FindDoctorLoad){
                            return   ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:  EdgeInsets.only(bottom: size.height*0.0099),
                                  child: DoctorShimmer(
                                    size: size,
                                    height: size.height * 0.2111,
                                    width: size.width * 0.8723,
                                  ),
                                );
                              },
                            );
                          }

                          else if (state is DoctorFilterState) {
                            doctors = state.filteredDoctors;
                          }

                          else if (state is FindDoctorSuccess) {
                            doctors = state.doctors.take(5).toList();
                          }

                          else if (state is FindDoctorError) {
                            return Center(
                              child: Text("Error: ${state.message}"),
                            );
                          }

                          if (doctors.isEmpty) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.085,
                                vertical: size.height * 0.074,
                              ),
                              child: Text(
                                "No doctor found with this name",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0XFF333333),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }
                          return BlocBuilder<
                            FavoriteDoctorCubit,
                            FavoriteDoctorState
                          >(
                            builder: (context, state) {
                              return ListView.builder(
                                itemCount: doctors.length,
                                itemBuilder: (context, index) {
                                  final doctor = doctors[index];
                                  return ContainerForFindDoctors(
                                    size: size,
                                    doctor: doctor,
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
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
