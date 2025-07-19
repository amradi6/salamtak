import 'package:flutter/material.dart';

class CustomIconsForClassification extends StatelessWidget {
  const CustomIconsForClassification({
    super.key,
    required this.size,
    required this.color,
    required this.image,
    required this.onTap,
  });

  final Size size;
  final List<Color> color;
  final String image;
  final void Function()?  onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: size.height * 0.147771017,
        width: size.width * 0.29427083,
        child: Stack(
          children: [
            Container(
              width: size.width * 0.20833333,
              height: size.height * 0.1117595,
              margin: EdgeInsets.only(left: size.width*0.0520833),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  colors: color,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  width: size.width * 0.0859375,
                  height: size.height * 0.04631814,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.01862659,
              left: size.width * 0.1302083,
              child: Container(
                width: size.width * 0.17447916,
                height: size.width * 0.17447916,
                decoration: BoxDecoration(
                  color: Color(0X10FFFFFF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.04967093,
              left: size.width * 0.0062088,
              child: Container(
                width: size.width * 0.20833333,
                height: size.width * 0.20833333,
                decoration: BoxDecoration(
                  color: Color(0X06FFFFFF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
