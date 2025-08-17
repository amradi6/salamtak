import 'package:flutter/material.dart';
import 'package:salamtak/core/constants/widgets/circle_for_bg.dart';

class BookedDoctorsScreen extends StatelessWidget {
  const BookedDoctorsScreen({super.key});

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
            child: SingleChildScrollView(
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
                  SizedBox(height: size.height * 0.0874),
                  // كل كونتينر وسايز بوكس هو حجز
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  child: Image.asset(
                                    "assets/images/AmrAdi.jpg",
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
                                    "Dr. James Wilson",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0XFF1F2937),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.00437),
                                  Text(
                                    "General Practitioner",
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
                                        "Thursday, July 17, 2025",
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
                                        "3:00 PM",
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
                                    Icons.location_on_outlined,
                                    color: Color(0XFF10B981),
                                    size: 16,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.01944),
                              Text(
                                "123 Medical Center, Healthcare Ave.",
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
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0XFFECFDF5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          color: Color(0XFF059669),
                                          size: size.width * 0.0324,
                                        ),
                                        SizedBox(width: size.width * 0.01295),
                                        Text(
                                          "+1 234 567 8900",
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
                                    onPressed: () {},
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
                  // كل كونتينر وسايز بوكس هو حجز
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  child: Image.asset(
                                    "assets/images/AmrAdi.jpg",
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
                                    "Dr. James Wilson",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0XFF1F2937),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.00437),
                                  Text(
                                    "General Practitioner",
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
                                        "Thursday, July 17, 2025",
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
                                        "3:00 PM",
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
                                    Icons.location_on_outlined,
                                    color: Color(0XFF10B981),
                                    size: 16,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.01944),
                              Text(
                                "123 Medical Center, Healthcare Ave.",
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
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0XFFECFDF5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          color: Color(0XFF059669),
                                          size: size.width * 0.0324,
                                        ),
                                        SizedBox(width: size.width * 0.01295),
                                        Text(
                                          "+1 234 567 8900",
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
                                    onPressed: () {},
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
                  // كل كونتينر وسايز بوكس هو حجز
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  child: Image.asset(
                                    "assets/images/AmrAdi.jpg",
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
                                    "Dr. James Wilson",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0XFF1F2937),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.00437),
                                  Text(
                                    "General Practitioner",
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
                                        "Thursday, July 17, 2025",
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
                                        "3:00 PM",
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
                                    Icons.location_on_outlined,
                                    color: Color(0XFF10B981),
                                    size: 16,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.01944),
                              Text(
                                "123 Medical Center, Healthcare Ave.",
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
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0XFFECFDF5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          color: Color(0XFF059669),
                                          size: size.width * 0.0324,
                                        ),
                                        SizedBox(width: size.width * 0.01295),
                                        Text(
                                          "+1 234 567 8900",
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
                                    onPressed: () {},
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
                  // كل كونتينر وسايز بوكس هو حجز
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  child: Image.asset(
                                    "assets/images/AmrAdi.jpg",
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
                                    "Dr. James Wilson",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0XFF1F2937),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.00437),
                                  Text(
                                    "General Practitioner",
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
                                        "Thursday, July 17, 2025",
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
                                        "3:00 PM",
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
                                    Icons.location_on_outlined,
                                    color: Color(0XFF10B981),
                                    size: 16,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.01944),
                              Text(
                                "123 Medical Center, Healthcare Ave.",
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
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0XFFECFDF5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          color: Color(0XFF059669),
                                          size: size.width * 0.0324,
                                        ),
                                        SizedBox(width: size.width * 0.01295),
                                        Text(
                                          "+1 234 567 8900",
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
                                    onPressed: () {},
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

                  SizedBox(height: size.height * 0.10937),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
