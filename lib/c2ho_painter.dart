import 'dart:math';

import 'package:flutter/material.dart';

class C2HOPainter extends CustomPainter {
  C2HOPainter({
    required this.width,
    required this.height,
    required this.center,
    required this.progress,
  });

  final double width;
  final double height;
  final Offset center;
  final double progress;

  final Paint _paint = Paint();
  Canvas? _canvas;

  @override
  void paint(Canvas canvas, Size size) {
    _paint.strokeWidth = 10;
    _paint.style = PaintingStyle.stroke;
    _paint.strokeCap = StrokeCap.round;
    _paint.color = Colors.green.withOpacity(progress);

    _canvas = canvas;

    Offset startPoint = Offset(center.dx - width / 3, center.dx - height / 3);

    Path cPath = Path();
    Offset cStart = startPoint;
    cPath.moveTo(cStart.dx, cStart.dy);

    Rect cRect = Rect.fromCenter(center: startPoint, width: 60, height: 80);

    cPath.addArc(cRect, pi / 5, 3 * pi / 2);
    _canvas?.drawPath(cPath, _paint);

    Path twoPath = Path();
    Offset startPoint2 = Offset(startPoint.dx + 60, startPoint.dy + 40);
    cPath.moveTo(cStart.dx, cStart.dy);

    Rect twoRect = Rect.fromCenter(center: startPoint2, width: 40, height: 40);

    twoPath.addArc(twoRect, 5 * pi / 4, 4 * pi / 3);
    twoPath.relativeLineTo(40, 0);
    _canvas?.drawPath(twoPath, _paint);

    _canvas?.drawLine(Offset(startPoint.dx + 100, startPoint.dy + 40),
        Offset(startPoint.dx + 100, startPoint.dy - 40), _paint);

    _canvas?.drawLine(Offset(startPoint.dx + 150, startPoint.dy + 40),
        Offset(startPoint.dx + 150, startPoint.dy - 40), _paint);

    _canvas?.drawLine(Offset(startPoint.dx + 100, startPoint.dy),
        Offset(startPoint.dx + 150, startPoint.dy), _paint);

    _canvas?.drawCircle(Offset(startPoint.dx + 200, startPoint.dy), 35, _paint);

    _canvas?.drawCircle(
        Offset(startPoint.dx + 270, startPoint.dy + 80), 27, _paint);

    _canvas?.drawCircle(
        Offset(startPoint.dx + 320, startPoint.dy + 140), 15, _paint);

    //draw Erlenmeyer Flask
    Paint flaskPaint = Paint();
    flaskPaint.strokeWidth = 8;
    flaskPaint.style = PaintingStyle.stroke;
    flaskPaint.strokeCap = StrokeCap.round;
    flaskPaint.color = Colors.blue;
    Offset flaskStart = Offset(startPoint.dx + 350, startPoint.dy + 170);
    double lipLength = 80;
    _canvas?.drawLine(flaskStart,
        Offset(flaskStart.dx + lipLength, flaskStart.dy), flaskPaint);

    double lipMargin = 10;
    double neckHeight = 100;
    _canvas?.drawLine(
        Offset(flaskStart.dx + lipMargin, flaskStart.dy),
        Offset(flaskStart.dx + lipMargin, flaskStart.dy + neckHeight),
        flaskPaint);

    _canvas?.drawLine(
        Offset(flaskStart.dx + lipLength - lipMargin, flaskStart.dy),
        Offset(
            flaskStart.dx + lipLength - lipMargin, flaskStart.dy + neckHeight),
        flaskPaint);

    Path flaskBottomPath = Path();
    Offset flaskBottomStartPt =
        Offset(flaskStart.dx + lipMargin, flaskStart.dy + neckHeight);
    flaskBottomPath.moveTo(flaskBottomStartPt.dx, flaskBottomStartPt.dy);
    flaskBottomPath.lineTo(
        flaskBottomStartPt.dx - 60, flaskBottomStartPt.dy + 120);

    flaskBottomPath.relativeLineTo(180, 0);
    flaskBottomPath.relativeLineTo(-60, -120);

    _canvas?.drawPath(flaskBottomPath, flaskPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
