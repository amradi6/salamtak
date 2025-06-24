import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ContainerForPopularDoctor extends StatelessWidget {
  const ContainerForPopularDoctor({
    super.key,
    required this.size,
    required this.image,
    required this.nameDoctor,
    required this.doctorSpecialty,
    required this.rating,
    this.onTap,
  });

  final Size size;
  final String image;
  final String nameDoctor;
  final String doctorSpecialty;
  final double rating;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.327828138,
        width: size.width * 0.4947916,
        margin: EdgeInsets.only(left: size.width * 0.0520833),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          boxShadow: [BoxShadow(color: Color(0X08000000), blurRadius: 40)],
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
                bottom: Radius.circular(2),
              ),
              child: Image.asset(
                image,
                width: size.width * 0.4947916,
                height: size.height * 0.2235191,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.01738482),
            Text(
              nameDoctor,
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Rubik",
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: size.height * 0.00248354),
            Text(
              doctorSpecialty,
              style: TextStyle(
                fontSize: 12,
                fontFamily: "Rubik",
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(height: size.height * 0.00248354),
            RatingBarIndicator(
              rating: rating,
              itemBuilder:
                  (context, index) => Icon(Icons.star, color: Colors.amber),
              itemCount: 5,
              itemSize: 16.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
      ),
    );
  }
}
