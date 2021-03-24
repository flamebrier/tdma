import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class LabPainter3 extends CustomPainter {
  // настройки рисования
  Paint p = Paint()
    ..color = Colors.blue.shade900
    ..strokeWidth = 10
    ..strokeCap = StrokeCap.round;

  Rect rect = Rect.fromLTRB(700, 30, 800, 80);

  List<Offset> points = [
    Offset(100, 50),
    Offset(150, 100),
    Offset(150, 200),
    Offset(50, 200),
    Offset(50, 100)
  ];
  List<Offset> points1 = [
    Offset(300, 200),
    Offset(600, 200),
    Offset(300, 300),
    Offset(600, 300),
    Offset(400, 100),
    Offset(400, 400),
    Offset(500, 100),
    Offset(500, 400)
  ];

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPaint(Paint()..color = Color.fromARGB(80, 102, 204, 255));

    canvas.drawPoints(PointMode.points, points, p);

    for (int i = 0; i < points1.length; i += 2)
      canvas.drawLine(points1[i], points1[i + 1], p);

    p = p..color = Colors.green;

    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(20)), p);

    rect = rect.translate(0, 100);

    canvas.drawOval(rect, p);

    rect = rect.translate(0, 100);

    canvas.drawArc(rect, -pi / 2, -3 * pi / 2, true, p);

    rect = rect.translate(0, 100);

    canvas.drawArc(rect, -pi / 2, -3 * pi / 2, false, p);

    canvas.drawLine(Offset(150, 450), Offset(150, 600), p);

    var tp1 = TextPainter(
        text: TextSpan(text: "text start", style: TextStyle(color: Colors.blue.shade900)), textAlign: TextAlign.start, textDirection: TextDirection.ltr);
    var tp2 = TextPainter(
        text: TextSpan(text: "text center", style: TextStyle(color: Colors.blue.shade900)), textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    var tp3 =
        TextPainter(text: TextSpan(text: "text end", style: TextStyle(color: Colors.blue.shade900)), textAlign: TextAlign.end, textDirection: TextDirection.ltr);

    tp1.layout(minWidth: 150);
    tp2.layout(minWidth: 150);
    tp3.layout(minWidth: 150);

    tp1.paint(canvas, Offset(50, 300));
    tp2.paint(canvas, Offset(50, 320));
    tp3.paint(canvas, Offset(50, 340));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
