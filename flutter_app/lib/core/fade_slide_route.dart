import 'package:flutter/material.dart';

/// A custom page route that displays the page instantly without any fade or slide animation,
/// giving a direct pop-up feel like standard bottom nav switching or immediate app transitions.
class FadeSlideRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeSlideRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
}
