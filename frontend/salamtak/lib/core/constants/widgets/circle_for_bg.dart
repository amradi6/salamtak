import 'dart:ui';

import 'package:flutter/material.dart';

class CircleForBg extends StatelessWidget {
  const CircleForBg({
    super.key,
    required this.size,  this.top,  this.left, required this.width, required this.height, required this.color, this.bottom, this.right,
  });

  final Size size;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [color, Colors.transparent],
                radius: 0.8,
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: Container(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}