import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/data/models/doctors.dart';
import 'package:salamtak/features/auth/cubit/auth_cubit.dart';
import 'package:salamtak/features/doctor_details/cubit/doctor_details_cubit.dart';
import 'package:salamtak/features/doctor_details/cubit/doctor_details_state.dart';

Future thankYouAlert(
  BuildContext context, {
  required Doctors doctor,
  required String month,
  required String selectedTime,
  required int slotId,
}) {
  final size = MediaQuery.of(context).size;
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        icon: CircleAvatar(
          radius: 60,
          backgroundColor: Color(0XFFE7F8F2),
          child: Icon(
            Icons.thumb_up,
            color: Color(0XFF0EBE7F),
            size: size.height * 0.08749,
          ),
        ),
        title: Column(
          children: [
            Text(
              "Thank You !",
              style: TextStyle(
                color: Color(0XFF333333),
                fontFamily: "Rubik",
                fontSize: 38,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: size.height * 0.00437),
            Text(
              "Your Appointment Successful",
              style: TextStyle(
                color: Color(0XFF677294),
                fontFamily: "Rubik",
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        titlePadding: EdgeInsets.only(bottom: size.height * 0.03171),
        content: Text(
          "You booked an appointment with Dr. \n ${doctor.name} on $month \n,at $selectedTime",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0XFF677294),
            fontSize: 14,
            fontFamily: "Rubik",
            fontWeight: FontWeight.w400,
          ),
        ),
        contentPadding: EdgeInsets.only(bottom: size.height * 0.03171),
        actions: [
          SizedBox(
            width: double.infinity,
            child: BlocConsumer<DoctorDetailsCubit, DoctorDetailsState>(
              listener: (context, state) {
                if (state is AddBookingSuccess) {
                  Navigator.pop(context);
                  context
                      .read<DoctorDetailsCubit>()
                      .getAppointmentsAvailability(doctor.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("The operation was completed successfully"),
                      showCloseIcon: true,
                    ),
                  );
                }
                if (state is AddBookingError) {
                  Navigator.pop(context);
                  context
                      .read<DoctorDetailsCubit>()
                      .getAppointmentsAvailability(doctor.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${state.message} Please try again"),
                      showCloseIcon: true,
                    ),
                  );
                }
              },
              builder: (BuildContext context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (state is AddBookingLoading)
                      LinearProgressIndicator(color: Colors.black),

                    if (state is AppointmentSelected)
                      SizedBox(
                        width: size.width * 0.71706,
                        child: ElevatedButton(
                          onPressed: () async{
                            context.read<DoctorDetailsCubit>().addBooking(
                              doctorId: doctor.id,
                              slotId: slotId,
                              patientId: await context.read<AuthCubit>().patientId
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            backgroundColor: Color(0XFF0EBE7F),
                          ),
                          child: Text(
                            "Done",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Rubik",
                            ),
                          ),
                        ),
                      ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context
                            .read<DoctorDetailsCubit>()
                            .getAppointmentsAvailability(doctor.id);
                      },
                      child: Text(
                        "Edit your appointment",
                        style: TextStyle(
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0XFF677294),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      );
    },
  );
}
