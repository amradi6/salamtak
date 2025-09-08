import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/auth/cubit/auth_cubit.dart';
import 'package:salamtak/features/booked_doctors/cubit/booked_doctors_cubit.dart';

class ContainerForBooked extends StatelessWidget {
  const ContainerForBooked({
    super.key,
    required this.size,
    required this.photo,
    required this.name,
    required this.specialty,
    required this.date,
    required this.time,
    required this.address,
    required this.phone,
    required this.bookingId,
  });

  final Size size;
  final String photo;
  final String name;
  final String specialty;
  final String date;
  final String time;
  final String address;
  final int phone;
  final int bookingId;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.height * 0.0174,
              vertical: size.height * 0.0174,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Transform.translate(
                      offset: Offset(0, size.height * -0.0218),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Image.network(
                          "https://mohammadhussien.pythonanywhere.com$photo",
                          height: size.width * 0.15556,
                          width: size.width * 0.15556,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.0291),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr. $name",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0XFF1F2937),
                          ),
                        ),
                        SizedBox(height: size.height * 0.00437),
                        Text(
                          specialty,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 13.6,
                            color: Color(0XFF059669),
                          ),
                        ),
                        SizedBox(height: size.height * 0.0164),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                width: size.width * 0.0680,
                                height: size.width * 0.0680,
                                decoration: BoxDecoration(
                                  color: Color(0XFFECFDF5),
                                ),
                                child: Icon(
                                  Icons.calendar_today_sharp,
                                  color: Color(0XFF10B981),
                                  size: 16,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.01944),
                            Text(
                              date,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 13.6,
                                color: Color(0XFF374151),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.0164),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                width: size.width * 0.0680,
                                height: size.width * 0.0680,
                                decoration: BoxDecoration(
                                  color: Color(0XFFECFDF5),
                                ),
                                child: Icon(
                                  Icons.alarm,
                                  color: Color(0XFF10B981),
                                  size: 16,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.01944),
                            Text(
                              time,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 13.6,
                                color: Color(0XFF374151),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.017499),
                Divider(color: Colors.grey),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: size.width * 0.0680,
                        height: size.width * 0.0680,
                        decoration: BoxDecoration(color: Color(0XFFECFDF5)),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Color(0XFF10B981),
                          size: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.01944),
                    Text(
                      address,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                        fontSize: 11.9,
                        color: Color(0XFF374151),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.0131),
                Row(
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<BookedDoctorsCubit>().makePhoneCall(phone.toString());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0XFFECFDF5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: Size(
                              size.width * 0.44239,
                              size.height * 0.04374,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.call,
                                color: Color(0XFF059669),
                                size: size.width * 0.0324,
                              ),
                              SizedBox(width: size.width * 0.014584),
                              Text(
                                phone.toString(),
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.6,
                                  color: Color(0XFF059669),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: size.width * 0.01944),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            context.read<BookedDoctorsCubit>().deleteBooking(bookingId,await context.read<AuthCubit>().patientId);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0XFFFEF2F2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Color(0XFFDC2626),
                                size: size.width * 0.0324,
                              ),
                              SizedBox(width: size.width * 0.01295),
                              Text(
                                "Cancel",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.6,
                                  color: Color(0XFFDC2626),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: size.height * 0.017499),
      ],
    );
  }
}
