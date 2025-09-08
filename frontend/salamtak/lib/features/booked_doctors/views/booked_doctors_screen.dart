import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/core/constants/widgets/circle_for_bg.dart';
import 'package:salamtak/features/auth/cubit/auth_cubit.dart';
import 'package:salamtak/features/booked_doctors/cubit/booked_doctors_cubit.dart';
import 'package:salamtak/features/booked_doctors/cubit/booked_doctors_state.dart';
import 'package:salamtak/features/booked_doctors/widgets/container_for_booked.dart';
import 'package:salamtak/shared/utils/doctor_shimmer.dart';

class BookedDoctorsScreen extends StatefulWidget {
  const BookedDoctorsScreen({super.key});

  @override
  State<BookedDoctorsScreen> createState() => _BookedDoctorsScreenState();
}

class _BookedDoctorsScreenState extends State<BookedDoctorsScreen> {
  @override
  void initState() {
    Future.microtask(() async {
    final patientId = await context.read<AuthCubit>().patientId;
    context.read<BookedDoctorsCubit>().getUpcomingBookings(patientId);
    });
    super.initState();
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
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.0447,
              left: size.width * 0.052,
              right: size.width * 0.052,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: size.width * 0.16771),
                Text(
                  "Booked Doctors",
                  style: TextStyle(
                    color: Color(0XFF222222),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Rubik",
                  ),
                ),
                SizedBox(height: size.height * 0.01749),
                Expanded(
                  child: BlocBuilder<BookedDoctorsCubit, BookedDoctorsState>(
                    builder: (context, state) {
                      print(state);
                      if (state is UpcomingBookingLoading) {
                        return SingleChildScrollView(
                          child: Column(
                            children:
                              List.generate(5, (index) {
                                return Padding(
                                  padding:  EdgeInsets.only(bottom: size.height * 0.017499),
                                  child: DoctorShimmer(size: size, width: size.width*0.894506, height: size.height*0.425462),
                                );
                              },),
                          ),
                        );
                      } else if (state is UpcomingBookingSuccess) {
                        List<dynamic> bookings = state.bookings;
                        return SingleChildScrollView(
                          child: Column(
                            children:
                                bookings.map((booking) {
                                  final doctor = booking["doctor"];
                                  final user = doctor["user"];
                                  final bookingId=booking["id"];
                                  return ContainerForBooked(
                                    size: size,
                                    bookingId: bookingId,
                                    photo: doctor["photo"],
                                    name: user["username"],
                                    specialty: doctor["sepciality"],
                                    date: booking["booked_at"]
                                        .toString()
                                        .substring(0, 10),
                                    time: booking["booked_at"]
                                        .toString()
                                        .substring(11, 16),
                                    address: doctor["address"],
                                    phone: doctor["phoneNumber"],
                                  );
                                }).toList(),
                          ),
                        );
                      } else if (state is UpcomingBookingError) {
                        return Center(child: Text(state.message));
                      }
                      return SizedBox();
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.10937),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
