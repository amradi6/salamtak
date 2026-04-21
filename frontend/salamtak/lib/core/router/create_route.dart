import 'package:flutter/material.dart';

Route createRoute({required Widget screen}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeInCirc;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return FadeTransition(
        opacity: animation.drive(tween),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}
