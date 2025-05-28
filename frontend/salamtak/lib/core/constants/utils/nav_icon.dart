import 'package:flutter/material.dart';

Widget navIcon({
  required IconData icon,
  required int index,
  required int currentIndex,
  required VoidCallback onTap,
}) {
  final isActive = index == currentIndex;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border:
            isActive ? Border.all(color: Color(0XFF0EBE7E), width: 2) : null,
        color: isActive ? Color(0XFF0EBE7E) : Colors.transparent,
      ),
      child: Icon(
        icon,
        color: isActive ? Color(0XFFFFFFFF) : Color(0XFF858EA9),
        size: 28,
      ),
    ),
  );
}
