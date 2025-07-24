import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_cubit.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_state.dart';

class ContainerForFindDoctors extends StatelessWidget {
  const ContainerForFindDoctors({
    super.key,
    required this.size,
    required this.image,
    required this.nameDoctor,
    required this.doctorSpecialty,
    required this.numberOfYearsOfExperience,
    required this.rate,
    required this.numberOfPatients,
    required this.timeNextAvailable,
    required this.isFavourite,
    required this.id,
  });

  final int id;
  final Size size;
  final String image;
  final String nameDoctor;
  final String doctorSpecialty;
  final int numberOfYearsOfExperience;
  final double rate;
  final int numberOfPatients;
  final String timeNextAvailable;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteDoctorCubit, FavoriteDoctorState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: size.height * 0.0124),
          width: size.width * 0.8723,
          height: size.height * 0.2111,
          decoration: BoxDecoration(
            color: Color(0XFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.0442,
              top: size.height * 0.0223,
              left: size.width * 0.0042,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      child: Image.asset(
                        image,
                        width: size.width * 0.239,
                        height: size.height * 0.108,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: size.width * 0.03645),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameDoctor,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0XFF333333),
                              fontFamily: "Rubik",
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: size.height * 0.0012),
                          Text(
                            doctorSpecialty,
                            style: TextStyle(
                              color: Color(0XFF0EBE7F),
                              fontFamily: "PT Sans",
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: size.height * 0.0049),
                          Text(
                            "$numberOfYearsOfExperience Years experience ",
                            style: TextStyle(
                              color: Color(0XFF677294),
                              fontFamily: "Rubik",
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: size.height * 0.00124),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0XFF0EBE7F),
                                size: size.width * 0.026,
                              ),
                              SizedBox(width: size.width * 0.0052),
                              Text(
                                "$rate%",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0XFF677294),
                                  fontFamily: "Rubik",
                                ),
                              ),
                              SizedBox(width: size.width * 0.044),
                              Icon(
                                Icons.circle,
                                color: Color(0XFF0EBE7F),
                                size: size.width * 0.026,
                              ),
                              SizedBox(width: size.width * 0.0052),
                              Text(
                                "$numberOfPatients Patient Stories",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0XFF677294),
                                  fontFamily: "Rubik",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.04),
                    SizedBox(
                      width: size.width * 0.0494,
                      height: size.height * 0.021,
                      child: IconButton(
                        onPressed: () {
                          context.read<FavoriteDoctorCubit>().toggleFavorite(
                            id,
                          );
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: isFavourite ? Colors.red : Colors.grey,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01738),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Next Available ",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Rubik",
                              color: Color(0XFF0EBE7F),
                            ),
                          ),
                          SizedBox(height: size.height * 0.006),
                          Text(
                            timeNextAvailable,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Rubik",
                              color: Color(0XFF677294),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.2135),
                    SizedBox(
                      width: size.width * 0.291,
                      height: size.height * 0.0422,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFF0EBE7F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                            color: Color(0XFFFFFFFF),
                            fontFamily: "Rubik",
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
