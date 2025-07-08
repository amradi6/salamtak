import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

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
                        IconButton(
                          onPressed: () {},
                          icon: Container(
                            width: size.height * 0.064,
                            height: size.height * 0.064,
                            decoration: BoxDecoration(
                              color: Color(0XFFFFFFFF),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(Icons.favorite_border),
                          ),
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
                        backgroundImage: AssetImage("assets/images/AmrAdi.jpg"),
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
                  "DR.AMRADI",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter",
                    color: Color(0XFF1F2937),
                  ),
                ),
                SizedBox(height: size.height * 0.0024),
                Text(
                  "General Practitioner",
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
                      "4.8 (124 reviews)",
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 0.1,
                      ),
                    ],
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
                                "60 mins",
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
                                "\$100",
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
                                "0996598693",
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
                              Text(
                                "amreloadi62002@gmail.com",
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
                                  Icons.location_on_outlined,
                                  color: Color(0XFF10B981),
                                  size: size.height * 0.02359,
                                ),
                              ),
                              SizedBox(width: size.width * 0.041),
                              Text(
                                "123 Medical Center, \n Healthcare Ave.",
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0.1,
                    ),
                  ],
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
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: size.height * 0.0149,
                            color: Color(0XFF10B981),
                          ),
                          SizedBox(width: size.width * 0.02083),
                          Text(
                            "General Checkup",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.0149),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: size.height * 0.0149,
                            color: Color(0XFF10B981),
                          ),
                          SizedBox(width: size.width * 0.02083),
                          Text(
                            "Vaccination",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.0149),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: size.height * 0.0149,
                            color: Color(0XFF10B981),
                          ),
                          SizedBox(width: size.width * 0.02083),
                          Text(
                            "Lab Tests",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.0149),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: size.height * 0.0149,
                            color: Color(0XFF10B981),
                          ),
                          SizedBox(width: size.width * 0.02083),
                          Text(
                            "Health Certificates",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02484),
                    ],
                  ),
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0.1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.052),
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
                      Padding(
                        padding:  EdgeInsets.only(right: size.width*0.052),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sunday",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF4B5563),
                              ),
                            ),
                            Text(
                              "Closed",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                                color: Color(0XFF1F2937),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.0149),
                      Padding(
                        padding:  EdgeInsets.only(right: size.width*0.052),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Monday",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF4B5563),
                              ),
                            ),
                            Text(
                              "09:00 - 16:00",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                                color: Color(0XFF1F2937),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.0149),
                      Padding(
                        padding:  EdgeInsets.only(right: size.width*0.052),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tuesday",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF4B5563),
                              ),
                            ),
                            Text(
                              "Closed",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                                color: Color(0XFF1F2937),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.0149),
                      Padding(
                        padding:  EdgeInsets.only(right: size.width*0.052),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Wednesday",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF4B5563),
                              ),
                            ),
                            Text(
                              "09:00 - 16:00",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                                color: Color(0XFF1F2937),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.0149),
                      Padding(
                        padding:  EdgeInsets.only(right: size.width*0.052),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Thursday",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF4B5563),
                              ),
                            ),
                            Text(
                              "Closed",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                                color: Color(0XFF1F2937),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.0149),
                      Padding(
                        padding:  EdgeInsets.only(right: size.width*0.052),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Friday",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF4B5563),
                              ),
                            ),
                            Text(
                              "Closed",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                                color: Color(0XFF1F2937),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.0149),
                      Padding(
                        padding:  EdgeInsets.only(right: size.width*0.052),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Saturday",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: Color(0XFF4B5563),
                              ),
                            ),
                            Text(
                              "09:00 - 16:00",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                                color: Color(0XFF1F2937),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.0149),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.0298),
            SizedBox(
              width: size.width*0.854,
              height: size.height*0.0844,
              child: ElevatedButton(
                onPressed: () {},
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
                      size: size.height*0.0223,
                      color: Color(0XFFFFFFFF),
                    ),
                    SizedBox(width: size.width*0.03125),
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
