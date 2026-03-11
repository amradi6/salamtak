import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/data/models/doctors.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_cubit.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_state.dart';

class ContainerForFeatureDoctor extends StatelessWidget {
  const ContainerForFeatureDoctor({
    super.key,
    required this.size,
    required this.doctor,
    required this.onTap,
  });

  final Size size;
  final Doctors doctor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteDoctorCubit, FavoriteDoctorState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: size.height * 0.2,
            width: size.width * 0.3,
            margin: EdgeInsets.only(
              left: size.width * 0.0520833,
              right: size.width * 0.026,
            ),
            decoration: BoxDecoration(
              color: Color(0XFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(6)),
              boxShadow: [
                BoxShadow(
                  color: Color(0X06000000),
                  offset: Offset(0, -1),
                  blurRadius: 20,
                ),
              ],
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<FavoriteDoctorCubit>().toggleFavorite(
                          doctor,
                        );
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 18,
                        color: context.read<FavoriteDoctorCubit>().isFavorite(doctor.id)
                            ? Colors.red
                            : Colors.grey,
                      ),
                    ),
                    SizedBox(width: size.width * 0.05),
                    Icon(Icons.star, color: Colors.amber, size: 15),
                    SizedBox(width: size.width * 0.0078),
                    Text(
                      doctor.rating.toString(),
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.002483),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.network(
                    doctor.image,
                    width: size.width * 0.140625,
                    height: size.width * 0.140625,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: size.height * 0.00372),
                Text(
                  doctor.name,
                  style: TextStyle(
                    color: Color(0XFF333333),
                    fontSize: 12,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w300,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: size.height * 0.0037),
                Text(
                  "\$ ${doctor.price}/ hours",
                  style: TextStyle(
                    color: Color(0XFF333333),
                    fontSize: 9,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
