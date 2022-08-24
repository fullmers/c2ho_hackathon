import 'dart:math';

import 'package:flutter/material.dart';

class C2HOPainter extends CustomPainter {
  C2HOPainter({
    required this.width,
    required this.height,
    required this.center,
  });

  final double width;
  final double height;
  final Offset center;

  final Paint _paint = Paint();
  Canvas? _canvas;

  @override
  void paint(Canvas canvas, Size size) {
    _paint.strokeWidth = 5;
    _paint.style = PaintingStyle.stroke;
    _paint.color = Colors.green;

    _canvas = canvas;

    Path cPath = Path();
    Offset cStart = center;
    cPath.moveTo(cStart.dx, cStart.dy);

    Rect cRect = Rect.fromCenter(center: center, width: 60, height: 80);

    cPath.addArc(cRect, pi / 5, 3 * pi / 2);
    _canvas?.drawPath(cPath, _paint);

    Path twoPath = Path();
    Offset startPoint2 = Offset(center.dx + 60, center.dy + 40);
    cPath.moveTo(cStart.dx, cStart.dy);

    Rect twoRect = Rect.fromCenter(center: startPoint2, width: 40, height: 40);

    twoPath.addArc(twoRect, 5 * pi / 4, 4 * pi / 3);
    twoPath.relativeLineTo(40, 0);
    _canvas?.drawPath(twoPath, _paint);

    _canvas?.drawLine(Offset(center.dx + 100, center.dy + 40),
        Offset(center.dx + 100, center.dy - 40), _paint);

    _canvas?.drawLine(Offset(center.dx + 150, center.dy + 40),
        Offset(center.dx + 150, center.dy - 40), _paint);

    _canvas?.drawLine(Offset(center.dx + 100, center.dy),
        Offset(center.dx + 150, center.dy), _paint);

    _canvas?.drawCircle(Offset(center.dx + 200, center.dy), 35, _paint);

    /*   Offset endPt = Offset(center.dx, center.dy - 50);
    Offset pt1 = Offset((innerRadius + ctrlPtHeight) * cos(theta - outerWidthDelta),
        (innerRadius + ctrlPtHeight) * sin(theta - outerWidthDelta));
    Offset pt2 = Offset((innerRadius + ctrlPtHeight) * cos(theta + innerWidthSweep + outerWidthDelta),
        (innerRadius + ctrlPtHeight) * sin(theta + innerWidthSweep + outerWidthDelta));
    path.cubicTo(pt1.dx, pt1.dy, pt2.dx, pt2.dy, endPt.dx, endPt.dy);
path.addArc(oval, startAngle, sweepAngle)
     final movingPt = _drawMovingDotOnCircle();

    _drawMovingLines(
      movingPt: movingPt,
    );

  */
  }

  _drawC() {}

  /*
  Offset _drawMovingDotOnCircle() {
    final theta = 2 * pi * progress;
    final Offset movingPt = Offset(
      fixedPts.center.dx + radius * cos(theta),
      fixedPts.center.dy + radius * sin(theta),
    );

    _paint.color = _refDotColor;
    _canvas?.drawCircle(movingPt, dotRadius, _paint);
    return movingPt;
  }

  void _drawMovingLines({
    required Offset movingPt,
  }) {
    // draw the reference fixed dots on the side
    _paint.color = _refDotColor;
    _canvas?.drawCircle(fixedPts.leftFixedPt, dotRadius, _paint);
    _canvas?.drawCircle(fixedPts.rtFixedPt, dotRadius, _paint);

    // draw the lines from the triangle pts to the moving dot
    _paint.strokeWidth = 2.5;
    final chord1Color = Colors.blue;
    _paint.color = chord1Color;
    _canvas?.drawLine(fixedPts.refTrianglePt1, movingPt, _paint);

    final chord2Color = Colors.red;
    _paint.color = chord2Color;
    _canvas?.drawLine(fixedPts.refTrianglePt2, movingPt, _paint);

    final chord3Color = Colors.yellow;
    _paint.color = chord3Color;
    _canvas?.drawLine(fixedPts.refTrianglePt3, movingPt, _paint);

    // calculate the length of each line. Doing this in cartesian is inelegant, but its implementation here is way
    // simpler than the alternative.
    final chord1 = (movingPt - fixedPts.refTrianglePt1).distance;
    final chord2 = (movingPt - fixedPts.refTrianglePt2).distance;
    final chord3 = (movingPt - fixedPts.refTrianglePt3).distance;

    if (chord1 > chord2 && chord1 > chord3) {
      _drawSideLines(
        bigChord: chord1,
        bigChordColor: chord1Color,
        littleChord1: chord2,
        littleChord1color: chord2Color,
        littleChord2: chord3,
        littleChord2color: chord3Color,
      );
    }

    if (chord2 > chord1 && chord2 > chord3) {
      _drawSideLines(
        bigChord: chord2,
        bigChordColor: chord2Color,
        littleChord1: chord3,
        littleChord1color: chord3Color,
        littleChord2: chord1,
        littleChord2color: chord1Color,
      );
    }

    if (chord3 > chord1 && chord3 > chord2) {
      _drawSideLines(
        bigChord: chord3,
        bigChordColor: chord3Color,
        littleChord1: chord1,
        littleChord1color: chord1Color,
        littleChord2: chord2,
        littleChord2color: chord2Color,
      );
    }
  }
  */

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
