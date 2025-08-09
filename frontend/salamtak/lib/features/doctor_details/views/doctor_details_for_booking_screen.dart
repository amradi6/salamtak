import 'package:flutter/material.dart';

class DoctorDetailsForBookingScreen extends StatelessWidget {
  const DoctorDetailsForBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                                backgroundImage: AssetImage(
                                  "assets/images/AmrAdi.jpg",
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.03125),
                            Text(
                              "Dr. James Wilson",
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
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.0416,
                          top: size.height * 0.01986,
                          right: size.width * 0.0416,
                          bottom: size.height * 0.0298,
                        ),
                        child: Row(
                          children: [
                            AnimatedRotation(
                              duration: Duration(milliseconds: 200),
                              turns: 0.0,
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: size.width * 0.0208),
                            Text(
                              "Sunday, June 1",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF000000),
                              ),
                            ),
                            SizedBox(width: size.width * 0.151),
                            Text(
                              "No appointments \n available",
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
                            true
                                ? Column(
                                  children: [
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                              color: Color(0xFF059669),
                                              width: 2,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            "09:00",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Inter",
                                              color: Color(0XFF059669),
                                            ),
                                          ),
                                        ),
                                        // أضف أزرار أوقات أخرى هنا
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Divider(
                                      color: Colors.grey[300],
                                      thickness: 1,
                                    ),
                                  ],
                                )
                                : SizedBox.shrink(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.0416,
                          top: size.height * 0.01986,
                          right: size.width * 0.0416,
                          bottom: size.height * 0.0298,
                        ),
                        child: Row(
                          children: [
                            AnimatedRotation(
                              duration: Duration(milliseconds: 200),
                              turns: 0.25,
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: size.width * 0.0208),
                            Text(
                              "Monday, June 2",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF000000),
                              ),
                            ),
                            SizedBox(width: size.width * 0.151),
                            Text(
                              "6 slots available",
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
                            true
                                ? Column(
                                  children: [
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                              color: Color(0xFF059669),
                                              width: 2,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            "09:00",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Inter",
                                              color: Color(0XFF059669),
                                            ),
                                          ),
                                        ),
                                        // أضف أزرار أوقات أخرى هنا
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Divider(
                                      color: Colors.grey[300],
                                      thickness: 1,
                                    ),
                                  ],
                                )
                                : SizedBox.shrink(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.0416,
                          top: size.height * 0.01986,
                          right: size.width * 0.0416,
                          bottom: size.height * 0.0298,
                        ),
                        child: Row(
                          children: [
                            AnimatedRotation(
                              duration: Duration(milliseconds: 200),
                              turns: 0.25,
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: size.width * 0.0208),
                            Text(
                              "Tuesday, June 3",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF000000),
                              ),
                            ),
                            SizedBox(width: size.width * 0.151),
                            Text(
                              "6 slots available",
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
                            true
                                ? Column(
                                  children: [
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                              color: Color(0xFF059669),
                                              width: 2,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            "09:00",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Inter",
                                              color: Color(0XFF059669),
                                            ),
                                          ),
                                        ),
                                        // أضف أزرار أوقات أخرى هنا
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Divider(
                                      color: Colors.grey[300],
                                      thickness: 1,
                                    ),
                                  ],
                                )
                                : SizedBox.shrink(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.0416,
                          top: size.height * 0.01986,
                          right: size.width * 0.0416,
                          bottom: size.height * 0.0298,
                        ),
                        child: Row(
                          children: [
                            AnimatedRotation(
                              duration: Duration(milliseconds: 200),
                              turns: 0.25,
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: size.width * 0.0208),
                            Text(
                              "Wednesday, June 4",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF000000),
                              ),
                            ),
                            SizedBox(width: size.width * 0.151),
                            Expanded(
                              child: Text(
                                "6 slots available",
                                style: TextStyle(
                                  color: Color(0XFF6B7280),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Inter",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child:
                            true
                                ? Column(
                                  children: [
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                              color: Color(0xFF059669),
                                              width: 2,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            "09:00",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Inter",
                                              color: Color(0XFF059669),
                                            ),
                                          ),
                                        ),
                                        // أضف أزرار أوقات أخرى هنا
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Divider(
                                      color: Colors.grey[300],
                                      thickness: 1,
                                    ),
                                  ],
                                )
                                : SizedBox.shrink(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.0416,
                          top: size.height * 0.01986,
                          right: size.width * 0.0416,
                          bottom: size.height * 0.0298,
                        ),
                        child: Row(
                          children: [
                            AnimatedRotation(
                              duration: Duration(milliseconds: 200),
                              turns: 0.25,
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: size.width * 0.0208),
                            Text(
                              "Thursday, June 5",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF000000),
                              ),
                            ),
                            SizedBox(width: size.width * 0.151),
                            Expanded(
                              child: Text(
                                "6 slots available",
                                style: TextStyle(
                                  color: Color(0XFF6B7280),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Inter",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child:
                            true
                                ? Column(
                                  children: [
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                              color: Color(0xFF059669),
                                              width: 2,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            "09:00",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Inter",
                                              color: Color(0XFF059669),
                                            ),
                                          ),
                                        ),
                                        // أضف أزرار أوقات أخرى هنا
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Divider(
                                      color: Colors.grey[300],
                                      thickness: 1,
                                    ),
                                  ],
                                )
                                : SizedBox.shrink(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.0416,
                          top: size.height * 0.01986,
                          right: size.width * 0.0416,
                          bottom: size.height * 0.0298,
                        ),
                        child: Row(
                          children: [
                            AnimatedRotation(
                              duration: Duration(milliseconds: 200),
                              turns: 0.25,
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: size.width * 0.0208),
                            Text(
                              "Friday, June 6",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF000000),
                              ),
                            ),
                            SizedBox(width: size.width * 0.151),
                            Expanded(
                              child: Text(
                                "6 slots available",
                                style: TextStyle(
                                  color: Color(0XFF6B7280),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Inter",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child:
                            true
                                ? Column(
                                  children: [
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                              color: Color(0xFF059669),
                                              width: 2,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            "09:00",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Inter",
                                              color: Color(0XFF059669),
                                            ),
                                          ),
                                        ),
                                        // أضف أزرار أوقات أخرى هنا
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Divider(
                                      color: Colors.grey[300],
                                      thickness: 1,
                                    ),
                                  ],
                                )
                                : SizedBox.shrink(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.0416,
                          top: size.height * 0.01986,
                          right: size.width * 0.0416,
                          bottom: size.height * 0.0298,
                        ),
                        child: Row(
                          children: [
                            AnimatedRotation(
                              duration: Duration(milliseconds: 200),
                              turns: 0.25,
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: size.width * 0.0208),
                            Text(
                              "Saturday, June 7",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF000000),
                              ),
                            ),
                            SizedBox(width: size.width * 0.151),
                            Expanded(
                              child: Text(
                                "6 slots available",
                                style: TextStyle(
                                  color: Color(0XFF6B7280),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Inter",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child:
                            true
                                ? Column(
                                  children: [
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                              color: Color(0xFF059669),
                                              width: 2,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            "09:00",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Inter",
                                              color: Color(0XFF059669),
                                            ),
                                          ),
                                        ),
                                        // أضف أزرار أوقات أخرى هنا
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                  ],
                                )
                                : SizedBox.shrink(),
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
