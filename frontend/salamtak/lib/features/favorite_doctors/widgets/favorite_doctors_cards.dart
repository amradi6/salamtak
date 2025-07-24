import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_cubit.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_state.dart';

class FavoriteDoctorsCards extends StatelessWidget {
  const FavoriteDoctorsCards({
    super.key,
    required this.size,
    required this.name,
    required this.specialization,
    required this.isFavorite,
    required this.image,
    required this.id,
  });

  final Size size;
  final String name;
  final String specialization;
  final String image;
  final bool isFavorite;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteDoctorCubit, FavoriteDoctorState>(
      builder: (context, state) {
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: size.width * 0.065,
                  top: size.height * 0.0105,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: size.width * 0.0436,
                      height: size.height * 0.0186,
                      child: IconButton(
                        onPressed: () {
                          context.read<FavoriteDoctorCubit>().toggleFavorite(
                            id,
                          );
                          context
                              .read<FavoriteDoctorCubit>()
                              .controller
                              .clear();
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.0186),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Image.asset(
                  image,
                  height: size.height * 0.1043,
                  width: size.height * 0.1043,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: size.height * 0.0136),
              Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0XFF333333),
                  fontWeight: FontWeight.normal,
                  fontFamily: "Rubik",
                ),
              ),
              SizedBox(height: size.height * 0.00496),
              Text(
                specialization,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0XFF0EBE7E),
                  fontWeight: FontWeight.w300,
                  fontFamily: "Rubik",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
