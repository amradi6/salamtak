
import 'package:flutter/material.dart';

class ContainerForFeatureDoctor extends StatelessWidget {
  const ContainerForFeatureDoctor({
    super.key,
    required this.size, required this.totalRate, required this.image, required this.nameDoctor, required this.price,
  });

  final Size size;
  final String totalRate;
  final String image;
  final String nameDoctor;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.2,
      width: size.width*0.3,
      margin: EdgeInsets.only(left: size.width * 0.0520833),
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0X06000000),
            offset: Offset(0, -1),
            blurRadius: 20,
          ),
        ],
        shape:BoxShape.rectangle,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite,size: 18,),
              ),
              SizedBox(width: size.width*0.05),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 15,
              ),
              SizedBox(width: size.width*0.0078),
              Text(
                totalRate,
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height*0.002483),
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
            child: Image.asset(
              image,
              width: size.width*0.140625,
              height: size.width*0.140625,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: size.height*0.00372),
          Text(
            nameDoctor,
            style: TextStyle(
                color: Color(0XFF333333),
                fontSize: 12,
                fontFamily: "Rubik",
                fontWeight: FontWeight.w300
            ),
          ),
          SizedBox(height: size.height*0.0037),
          Text(
            "\$ $price/ hours",
            style: TextStyle(
              color: Color(0XFF333333),
              fontSize: 9,
              fontFamily: "Rubik",
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}