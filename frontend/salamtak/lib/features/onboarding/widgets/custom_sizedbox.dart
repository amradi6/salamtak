import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    super.key,
    required this.size,
    this.top,
    this.left,
    this.right,
    required this.image,
  });

  final Size size;
  final double? top;
  final double? left;
  final double? right;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.53,
      child: Stack(
        children: [
          Positioned(
            top: top,
            left: left,
            right: right,
            child: Container(
              width: size.width * 0.89,
              height: size.width * 0.89,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0EBE7E), Color(0xFF07D9AD)],
                ),
                color: Colors.lightBlueAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.113,
            left: size.width * 0.052,
            child: Image.asset(image, width: 336, height: 336),
          ),
        ],
      ),
    );
  }
}
