import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/core/constants/widgets/circle_for_bg.dart';
import 'package:salamtak/core/constants/widgets/text_form_for_search.dart';
import 'package:salamtak/data/models/doctors.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_cubit.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_state.dart';
import 'package:salamtak/features/favorite_doctors/widgets/favorite_doctors_cards.dart';

class FavoriteDoctorsScreen extends StatefulWidget {
  const FavoriteDoctorsScreen({super.key});

  @override
  State<FavoriteDoctorsScreen> createState() => _FavoriteDoctorsScreenState();
}

class _FavoriteDoctorsScreenState extends State<FavoriteDoctorsScreen> {
  @override
  void dispose() {
    super.dispose();
    context.read<FavoriteDoctorCubit>().controller.dispose();
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
                    Container(
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
                    SizedBox(width: size.width * 0.049),
                    Text(
                      "Favourite Doctors",
                      style: TextStyle(
                        color: Color(0XFF222222),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Rubik",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.042),
                Form(
                  key: context.read<FavoriteDoctorCubit>().formKey,
                  child: TextFormForSearch(
                    size: size,
                    controller: context.read<FavoriteDoctorCubit>().controller,
                    textInputType: TextInputType.text,
                    filled: true,
                    hintText: "Find your favorite doctor",
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<FavoriteDoctorCubit>().resetFavorites();
                        setState(() {
                          context
                              .read<FavoriteDoctorCubit>()
                              .controller
                              .clear();
                        });
                      },
                      icon: Icon(Icons.cancel),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please Enter The Name Doctor";
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      if (context
                          .read<FavoriteDoctorCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context
                            .read<FavoriteDoctorCubit>()
                            .filterFavoriteDoctors(value.trim());
                      }
                    },
                    onChanged: (value) {
                      final trimmedValue = value.trim();
                      if (trimmedValue.isEmpty) {
                        context.read<FavoriteDoctorCubit>().resetFavorites();
                      } else {
                        context
                            .read<FavoriteDoctorCubit>()
                            .filterFavoriteDoctors(trimmedValue);
                      }
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.029),
                BlocBuilder<FavoriteDoctorCubit, FavoriteDoctorState>(
                  builder: (context, state) {
                    List<Doctors> doctor = [];

                    if (state is FavoriteDoctorInitialState) {
                      doctor = state.favoriteDoctors;
                    } else if (state is DoctorFavoriteFilterState) {
                      doctor = state.filteredDoctors;
                    }
                    if (doctor.isEmpty) {
                      final massage =
                          context.read<FavoriteDoctorCubit>().isSearching
                              ? "There is no favorite doctor with this name."
                              : "You don't have any favorite doctors yet.";
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.2483,
                        ),
                        child: Center(
                          child: Text(
                            massage,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0XFF333333),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      child: SizedBox(
                        width: size.width * 0.8723,
                        height: size.height * 0.745,
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 80),
                          itemCount: doctor.length,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 160,
                                mainAxisSpacing: size.height * 0.019,
                                crossAxisSpacing: size.height * 0.019,
                                childAspectRatio: 0.8888,
                              ),
                          itemBuilder: (context, index) {
                            return Container(
                              width: size.width * 0.468,
                              decoration: BoxDecoration(
                                color: Color(0XFFFFFFFF),
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0X06000000),
                                    blurRadius: 20,
                                    offset: Offset(0, -1),
                                  ),
                                ],
                              ),
                              child: FavoriteDoctorsCards(
                                isFavorite: doctor[index].isFavorite!,
                                specialization: doctor[index].specialty,
                                name: doctor[index].name,
                                image: doctor[index].image,
                                size: size,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
