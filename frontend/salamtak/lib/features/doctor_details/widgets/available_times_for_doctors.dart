
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/doctor_details/cubit/doctor_details_cubit.dart';
import 'package:salamtak/features/doctor_details/cubit/doctor_details_state.dart';

class AvailableTimesForDoctors extends StatefulWidget {
  const AvailableTimesForDoctors({
    super.key,
    required this.size,
    required this.date,
    required this.slots,
    required this.times
  });

  final Size size;
  final String date;
  final List<Map<String, dynamic>> slots;
  final List<String> times;

  @override
  State<AvailableTimesForDoctors> createState() =>
      _AvailableTimesForDoctorsState();
}

class _AvailableTimesForDoctorsState extends State<AvailableTimesForDoctors> {
  bool isOpen = false;
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => setState(() {
        isOpen = !isOpen;
      }),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: widget.size.width * 0.0416,
              top: widget.size.height * 0.01986,
              right: widget.size.width * 0.0416,
              bottom: widget.size.height * 0.0298,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AnimatedRotation(
                  duration: Duration(milliseconds: 200),
                  turns: isOpen ? 0.25 : 0.0,
                  child: Icon(Icons.play_arrow, color: Colors.green),
                ),
                SizedBox(width: widget.size.width * 0.0208),
                Expanded(
                  child: Text(
                    widget.date,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter",
                      color: Color(0XFF000000),
                    ),
                  ),
                ),
                SizedBox(width: widget.size.width * 0.151),
                Text(
                  widget.times.isEmpty
                      ? "No appointments \n available"
                      : "${widget.times.length} slots available",
                  style: TextStyle(
                    color: Color(0XFF6B7280),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter",
                  ),
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child:
            isOpen
                ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: widget.size.width * 0.0388,
                  ),
                  child: Wrap(
                    spacing: widget.size.height * 0.0087,
                    runSpacing: widget.size.height * 0.0087,
                    children:
                    widget.slots.map((slot) {
                      int slotId=slot["id"];
                      String time = (slot["start_time"] as String).substring(0, 5);
                      return BlocBuilder<DoctorDetailsCubit,DoctorDetailsState>(
                        builder: (BuildContext context, DoctorDetailsState state) {
                          final cubit =
                          context.read<DoctorDetailsCubit>();
                          final bool isSelected = (state is AppointmentSelected) &&
                              state.date == widget.date &&
                              state.time == time;
                          return SizedBox(
                            width: widget.size.width * 0.2268,
                            height: widget.size.height * 0.0459,
                            child: OutlinedButton(
                              onPressed: () {
                                cubit.selectAppointment(widget.date,time,slotId);
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: isSelected
                                    ? Color(0xFFAAF0D1)
                                    : Colors.white,
                                side: BorderSide(
                                  color: Color(0xFF059669),
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                ),
                              ),
                              child: Text(
                                time,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Inter",
                                  color: Color(0XFF059669),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 12),
                Divider(color: Colors.grey[300], thickness: 1),
              ],
            )
                : Column(
              children: [
                SizedBox.shrink(),
                Divider(color: Colors.grey[300], thickness: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}