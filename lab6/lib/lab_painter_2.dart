import 'dart:ui';

import 'package:flutter/material.dart';

class LabPainter2 extends CustomPainter {
  // настройки рисования
  final p = Paint()
    ..color = Colors.blue.shade900
    ..strokeWidth = 10
    ..strokeCap = StrokeCap.round;

  Rect rect = Rect.fromLTRB(200, 150, 400, 200);

  @override
  void paint(Canvas canvas, Size size) {
    //фон
    canvas.drawPaint(Paint()..color = Color.fromARGB(80, 102, 204, 255));

    // точка
    canvas.drawPoints(PointMode.points, [Offset(50, 50)], p);

    // линия
    canvas.drawLine(Offset(100, 100), Offset(500, 50), p);

    // круг
    canvas.drawCircle(Offset(100, 200), 50, p);

    // прямоугольник
    canvas.drawRect(rect, p);

    // изменение прямоугольника
    rect = Rect.fromLTRB(250, 300, 350, 500);

    canvas.drawRect(rect, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}