import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AppIcons {
  // Base helper for standard SVG rendering
  static Widget _svg(String name, {Color? color, double size = 24}) {
    return SvgPicture.asset(
      'assets/icons/$name.svg',
      width: size,
      height: size,
      fit: BoxFit.contain,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  // --- Main Navigation Icons (Bottom Bar & App Bar) ---
  static Widget home({Color? color, double size = 24, bool isFill = false}) => _svg('home-${isFill ? "fill" : "line"}', color: color, size: size);
  static Widget search({Color? color, double size = 24, bool isFill = false}) => _svg('search-2-${isFill ? "fill" : "line"}', color: color, size: size);
  static Widget shining({Color? color, double size = 24, bool isFill = false}) => _svg('shining-${isFill ? "fill" : "line"}', color: color, size: size);
  static Widget chat({Color? color, double size = 24, bool isFill = false}) => _svg('chat-3-${isFill ? "fill" : "line"}', color: color, size: size);
  static Widget user({Color? color, double size = 24, bool isFill = false}) => _svg('user-${isFill ? "fill" : "line"}', color: color, size: size);
  static Widget notification({Color? color, double size = 24, bool isFill = false}) => _svg('notification-3-${isFill ? "fill" : "line"}', color: color, size: size);

  // --- Specialized Action & Social Icons ---
  static Widget heart({Color? color, double size = 24}) => _svg('heart-3-fill', color: color, size: size);
  static Widget send({Color? color, double size = 24}) => _svg('send-ins-fill', color: color, size: size);
  static Widget pencilAi({Color? color, double size = 24}) => _svg('pencil-ai-2-line', color: color, size: size);
  static Widget arrowLeft({Color? color, double size = 24}) => _svg('arrow-drop-left-line', color: color, size: size);
  static Widget eye({Color? color, double size = 24}) => _svg('eye-fill', color: color, size: size);
  static Widget eyeOff({Color? color, double size = 24}) => _svg('eye-off-fill', color: color, size: size);
  static Widget settings({Color? color, double size = 24}) => _svg('settings-line', color: color, size: size);
  static Widget vidicon({Color? color, double size = 24}) => _svg('vidicon-fill', color: color, size: size);
  static Widget smartphone({Color? color, double size = 24}) => _svg('smartphone-line', color: color, size: size);
  static Widget at({Color? color, double size = 24}) => _svg('at-line', color: color, size: size);
  static Widget equal({Color? color, double size = 24}) => _svg('equal-line', color: color, size: size); // fallback for filter/menu

  // --- Color-Preserved Social Logos ---
  // Leave color parameter null if you want the original SVG colors to render.
  static Widget google({Color? color, double size = 24}) => _svg('google-fill', color: color, size: size);
  static Widget apple({Color? color, double size = 24}) => _svg('apple-fill', color: color, size: size);
  static Widget instagram({Color? color, double size = 24}) => _svg('instagram-line', color: color, size: size);
  static Widget line({Color? color, double size = 24}) => _svg('line-line', color: color, size: size);
  static Widget threads({Color? color, double size = 24}) => _svg('threads-fill', color: color, size: size);

  // Helper for dynamic generation
  static Widget fromName(String name, {Color? color, double size = 24, bool isActive = false}) {
    switch (name) {
      case 'home': return home(color: color, size: size, isFill: isActive);
      case 'search': return search(color: color, size: size, isFill: isActive);
      case 'shining': return shining(color: color, size: size, isFill: isActive);
      case 'chat': return chat(color: color, size: size, isFill: isActive);
      case 'user': return user(color: color, size: size, isFill: isActive);
      case 'notification': return notification(color: color, size: size, isFill: isActive);
      case 'settings': return settings(color: color, size: size);
      default: return home(color: color, size: size, isFill: isActive);
    }
  }
}
