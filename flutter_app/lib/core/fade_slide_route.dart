import 'package:flutter/material.dart';

/// A custom page route that slides up from the bottom with a fade,
/// giving a natural "modal pop-up" feel like most mobile apps.
class FadeSlideRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeSlideRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 280),
          reverseTransitionDuration: const Duration(milliseconds: 220),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Slide from bottom (0.04 = just a tiny lift, not a full slide-up)
            final slideTween = Tween<Offset>(
              begin: const Offset(0, 0.06),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
              reverseCurve: Curves.easeInCubic,
            ));

            // Fade in
            final fadeTween = Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
              ),
            );

            return SlideTransition(
              position: slideTween,
              child: FadeTransition(
                opacity: fadeTween,
                child: child,
              ),
            );
          },
        );
}
