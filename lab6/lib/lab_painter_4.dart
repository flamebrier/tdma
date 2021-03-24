import 'dart:ui';

import 'package:flutter/material.dart';

class LabPainter4 extends CustomPainter {
  // настройки рисования
  Paint p = Paint()
    ..color = Colors.blue.shade900
    ..strokeWidth = 10
    ..strokeCap = StrokeCap.round;

  Path star = Path();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPaint(Paint()..color = Color.fromARGB(80, 102, 204, 255));

    star.moveTo(300, 100);

    star.relativeLineTo(-25, 50);
    star.relativeLineTo(-50, 0);

    star.relativeLineTo(50, 25);
    star.relativeLineTo(-25, 50);

    star.relativeLineTo(-25, -50);
    star.relativeLineTo(25, 50);

    star.relativeLineTo(50, -35);
    star.relativeLineTo(50, 35);

    star.relativeLineTo(-25, -50);
    star.relativeLineTo(50, -25);

    star.relativeLineTo(-50, 0);

    canvas.drawPath(star, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
