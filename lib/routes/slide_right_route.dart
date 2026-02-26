import 'package:flutter/material.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({required this.page})
      : super(
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration:
    const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );

      final slideTween = Tween<Offset>(
        begin: const Offset(-0.35, 0.0),
        end: Offset.zero,
      );

      return SlideTransition(
        position: curvedAnimation.drive(slideTween),
        child: child,
      );
    },
  );
}

