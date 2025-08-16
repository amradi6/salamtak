import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/data/models/doctors.dart';
import 'package:salamtak/features/doctor_details/cubit/doctor_details_cubit.dart';
import 'package:salamtak/features/doctor_details/cubit/doctor_details_state.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_cubit.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_state.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key, required this.doctor});

  final Doctors doctor;

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorDetailsCubit>().getAvailability(widget.doctor.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.3501,
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.2384,
                    width: double.infinity,
                    color: Color(0XFF10B981),
                  ),
                  Positioned(
                    top: size.height * 0.0372,
                    left: size.width * 0.04166,
                    right: size.width * 0.04166,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Container(
                            width: size.height * 0.064,
                            height: size.height * 0.064,
                            decoration: BoxDecoration(
                              color: Color(0XFFFFFFFF),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(Icons.arrow_back_ios_new),
                          ),
                        ),
                        BlocBuilder<FavoriteDoctorCubit, FavoriteDoctorState>(
                          builder: (context, state) {
                            return IconButton(
                              onPressed: () {
                                context
                                    .read<FavoriteDoctorCubit>()
                                    .toggleFavorite(widget.doctor);
                              },
                              icon: Container(
                                width: size.height * 0.064,
                                height: size.height * 0.064,
                                decoration: BoxDecoration(
                                  color: Color(0XFFFFFFFF),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color:
                                      context
                                              .read<FavoriteDoctorCubit>()
                                              .isFavorite(widget.doctor.id)
                                          ? Colors.red
                                          : Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.15,
                    left: size.width * 0.2864,
                    child: SizedBox(
                      width: size.height * 0.1986,
                      height: size.height * 0.1986,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(widget.doctor.image),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.0198),
            Column(
              children: [
                Text(
                  "DR.${widget.doctor.name}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter",
                    color: Color(0XFF1F2937),
                  ),
                ),
                SizedBox(height: size.height * 0.0024),
                Text(
                  widget.doctor.specialty,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter",
                    color: Color(0XFF10B981),
                  ),
                ),
                SizedBox(height: size.height * 0.0149),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xFFFACC15),
                      size: size.height * 0.023,
                    ),
                    SizedBox(width: size.width * 0.0078),
                    Text(
                      "${widget.doctor.rating} (124 reviews)",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0XFF4B5563),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.0397),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.0416),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0XFFFFFFFF),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.1)],
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.0248),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: size.height * 0.139,
                          width: size.width * 0.3541,
                          decoration: BoxDecoration(
                            color: Color(0XFFF9FAFB),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: size.height * 0.01986),
                              Text(
                                "Consultation",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Inter",
                                  color: Color(0XFF6B7280),
                                ),
                              ),
                              SizedBox(height: size.height * 0.00869),
                              Text(
                                "${widget.doctor.consultation} min's",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Color(0XFF1F2937),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: size.width * 0.0416),
                        Container(
                          height: size.height * 0.139,
                          width: size.width * 0.3541,
                          decoration: BoxDecoration(
                            color: Color(0XFFF9FAFB),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: size.height * 0.0198),
                              Text(
                                "Fee Starts From",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Inter",
                                  color: Color(0XFF6B7280),
                                ),
                              ),
                              SizedBox(height: size.height * 0.00869),
                              Text(
                                "\$${widget.doctor.price}",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Color(0XFF1F2937),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.0298),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.09375,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: size.height * 0.0596,
                                width: size.height * 0.0596,
                                decoration: BoxDecoration(
                                  color: Color(0XFFECFDF5),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.phone,
                                  color: Color(0XFF10B981),
                                  size: size.height * 0.02359,
                                ),
                              ),
                              SizedBox(width: size.width * 0.041),
                              Text(
                                "${widget.doctor.phoneNumber}",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Color(0XFF4B5563),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.0198),
                          Row(
                            children: [
                              Container(
                                height: size.height * 0.0596,
                                width: size.height * 0.0596,
                                decoration: BoxDecoration(
                                  color: Color(0XFFECFDF5),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.mail,
                                  color: Color(0XFF10B981),
                                  size: size.height * 0.02359,
                                ),
                              ),
                              SizedBox(width: size.width * 0.041),
                              Expanded(
                                child: Text(
                                  widget.doctor.email!,
                                  softWrap: true,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Color(0XFF4B5563),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.0198),
                          Row(
                            children: [
                              Container(
                                height: size.height * 0.0596,
                                width: size.height * 0.0596,
                                decoration: BoxDecoration(
                                  color: Color(0XFFECFDF5),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: Color(0XFF10B981),
                                  size: size.height * 0.02359,
                                ),
                              ),
                              SizedBox(width: size.width * 0.041),
                              Text(
                                widget.doctor.address!,
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Color(0XFF4B5563),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02483),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.0298),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.0416),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0XFFFFFFFF),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.1)],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.052),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.02483),
                      Text(
                        "Services",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter",
                          color: Color(0XFF000000),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02483),
                      if (widget.doctor.services != null &&
                          widget.doctor.services!.isNotEmpty) ...[
                        ...widget.doctor.services!.map(
                          (service) => Padding(
                            padding: EdgeInsets.only(
                              bottom: size.height * 0.0149,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: size.height * 0.0149,
                                  color: Color(0XFF10B981),
                                ),
                                SizedBox(width: size.width * 0.02083),
                                Text(
                                  service,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Inter",
                                    color: Color(0XFF374151),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ] else ...[
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: size.height * 0.0149,
                              color: Colors.red,
                            ),
                            SizedBox(width: size.width * 0.02083),
                            Text(
                              "No services available",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF374151),
                              ),
                            ),
                          ],
                        ),
                      ],
                      SizedBox(height: size.height * 0.02484),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.0298),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.0416),
              child: BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
                builder: (BuildContext context, DoctorDetailsState state) {
                  if (state is GetAvailabilityLoading) {
                    return Center(child: CircularProgressIndicator(color: Colors.green));
                  }
                  else if (state is GetAvailabilitySuccess) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0XFFFFFFFF),
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 0.1),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.052,
                          // bottom: size.height * 0.0298,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.02483),
                            Text(
                              "Working Hours",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                color: Color(0XFF000000),
                              ),
                            ),
                            SizedBox(height: size.height * 0.0235),
                            ...state.workingHours.map((day) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: size.width * 0.052,
                                    bottom: size.height * 0.0298,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      day["day"]!,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Inter",
                                        color: Color(0XFF4B5563),
                                      ),
                                    ),
                                    Text(
                                      day['start'] != null && day['end'] != null
                                          ? "${day['start']!.substring(0, 5)} - ${day['end']!.substring(0, 5)}"
                                          : "Closed",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Inter",
                                        color: Color(0XFF1F2937),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    );
                  }
                  else {
                    return Text("No data available");
                  }
                },
              ),
            ),
            SizedBox(height: size.height * 0.0298),
            SizedBox(
              width: size.width * 0.854,
              height: size.height * 0.0844,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushNamed("/doctor_details_for_booking",arguments: widget.doctor);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Color(0XFF10B981),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_alarm,
                      size: size.height * 0.0223,
                      color: Color(0XFFFFFFFF),
                    ),
                    SizedBox(width: size.width * 0.03125),
                    Text(
                      "Book Appointment",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: "inter",
                        color: Color(0XFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.0397),
          ],
        ),
      ),
    );
  }
}
