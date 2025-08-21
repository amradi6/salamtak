import 'package:flutter/material.dart';
import 'package:salamtak/data/models/doctors.dart';

class DoctorDetailsForBookingScreen extends StatelessWidget {
  const DoctorDetailsForBookingScreen({super.key, required this.doctor});

  final Doctors doctor;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> availabilities = [
      {
        "week_day": 6,
        "available_slots": [
          {
            "id": 143,
            "date": "2025-08-17",
            "start_time": "10:00:00",
            "end_time": "10:30:00",
          },
          {
            "id": 146,
            "date": "2025-08-17",
            "start_time": "10:30:00",
            "end_time": "11:00:00",
          },
          {
            "id": 147,
            "date": "2025-08-17",
            "start_time": "11:00:00",
            "end_time": "11:30:00",
          },
        ],
      },
      {
        "week_day": 5,
        "available_slots": [
          {
            "id": 143,
            "date": "2025-08-18",
            "start_time": "10:00:00",
            "end_time": "10:30:00",
          },
          {
            "id": 146,
            "date": "2025-08-18",
            "start_time": "10:30:00",
            "end_time": "11:00:00",
          },
        ],
      },
      {
        "week_day": 4,
        "available_slots": [
          {
            "id": 143,
            "date": "2025-08-19",
            "start_time": "10:00:00",
            "end_time": "10:30:00",
          }
        ],
      },
      {
        "week_day": 3,
        "available_slots": [
          {
            "id": 147,
            "date": "2025-08-20",
            "start_time": "11:00:00",
            "end_time": "11:30:00",
          },
        ],
      },
      {
        "week_day": 2,
        "available_slots": [
          {
            "id": 143,
            "date": "2025-08-21",
            "start_time": "10:00:00",
            "end_time": "10:30:00",
          }
        ],
      },
      {
        "week_day": 1,
        "available_slots": [
          {
            "id": 143,
            "date": "2025-08-22",
            "start_time": "10:00:00",
            "end_time": "10:30:00",
          },
        ],
      },
      {
        "week_day": 0,
        "available_slots": [
          {
            "id": 143,
            "date": "2025-08-23",
            "start_time": "10:00:00",
            "end_time": "10:30:00",
          },
        ],
      },
    ];

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFFF9FAFB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.04967,
                left: size.width * 0.0651,
                right: size.width * 0.0416,
                bottom: size.height * 0.076,
              ),
              child: Container(
                width: size.width * 0.8541,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0XFFFFFFFF),
                  boxShadow: [
                    BoxShadow(color: Color(0XFF000000), blurRadius: 0.1),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.chevron_left),
                          ),
                          Text(
                            "June 1 - June 7",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              color: Color(0XFF000000),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.chevron_right),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                        height: 20,
                      ),
                      SizedBox(height: size.height * 0.0198),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.0416),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.height * 0.059,
                              height: size.height * 0.059,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                  doctor.image,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.03125),
                            Text(
                              "Dr. ${doctor.name}",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                color: Color(0XFF000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                        height: 20,
                      ),
                      SizedBox(
                        height: size.height * 1.06748,
                        child: ListView.builder(
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            var dayData = availabilities[index];

                            var slots = dayData["available_slots"] as List;

                            List<String> times = slots.map((slot) {
                              return (slot["start_time"] as String).substring(0, 5);
                            }).toList();

                            String dateLabel = slots.first["date"];

                            return AvailableTimesForDoctors(
                              size: size,
                              date: dateLabel,
                              times: times,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.0844,
              width: size.width * 0.85416,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF10B981),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_today_sharp,
                      color: Color(0XFFFFFFFF),
                      size: size.height * 0.0223,
                    ),
                    SizedBox(width: size.width * 0.03125),
                    Text(
                      "Book Appointment",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        color: Color(0XFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.0211),
            Divider(color: Colors.grey[300], thickness: 1),
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              label: Text(
                "Close",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF4B5563),
                ),
              ),
              icon: Icon(
                Icons.close,
                size: size.height * 0.0198,
                color: Colors.grey,
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.green.shade500,
              ),
            ),
            SizedBox(height: size.height * 0.04594),
          ],
        ),
      ),
    );
  }
}

class AvailableTimesForDoctors extends StatefulWidget {
  const AvailableTimesForDoctors({
    super.key,
    required this.size,
    required this.date,
    required this.times,
  });

  final Size size;
  final String date;
  final List<String> times;

  @override
  State<AvailableTimesForDoctors> createState() =>
      _AvailableTimesForDoctorsState();
}

class _AvailableTimesForDoctorsState extends State<AvailableTimesForDoctors> {
  bool isOpen = false;

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
                Text(
                  widget.date,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter",
                    color: Color(0XFF000000),
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
                                widget.times.map((time) {
                                  return SizedBox(
                                    width: widget.size.width * 0.2268,
                                    height: widget.size.height * 0.0459,
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
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
