import 'package:flutter/material.dart';

/// A lightweight shared transition used by every named route.
class FadeSlideRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeSlideRoute({required this.page, super.settings})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: const Duration(milliseconds: 170),
        reverseTransitionDuration: const Duration(milliseconds: 120),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutQuart,
            reverseCurve: Curves.easeInQuart,
          );
          final scaleAnimation = Tween<double>(
            begin: 0.985,
            end: 1,
          ).animate(curvedAnimation);

          return FadeTransition(
            opacity: curvedAnimation,
            child: ScaleTransition(
              scale: scaleAnimation,
              alignment: Alignment.center,
              child: child,
            ),
          );
        },
      );
}
