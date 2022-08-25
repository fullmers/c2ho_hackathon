import 'dart:ui';

class Bubble {
  Bubble({
    required this.center,
    required this.r,
    required this.color,
    required this.startTime,
    required this.duration,
  });

  final Offset center;
  final double r;
  final Color color;
  final double startTime;
  final double duration;
}
