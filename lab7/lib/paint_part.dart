import 'dart:ui';

import 'package:flutter/material.dart';

class PaintPart extends StatefulWidget {
  @override
  _PaintPartState createState() => _PaintPartState();
}

class _PaintPartState extends State<PaintPart> {
  final List<Offset> points = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (details) {
        if (mounted)
          setState(() {
            points.add(details.localPosition);
          });
      },
      child: CustomPaint(painter: PaintPainter(points)),
    );
  }
}

class PaintPainter extends CustomPainter {
  final List<Offset> points;

  PaintPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPaint(Paint()..color = Colors.grey.shade900);
    if ((points ?? []).isNotEmpty) {
      canvas.drawPoints(
          PointMode.points,
          points,
          Paint()
            ..color = Colors.amber
            ..strokeWidth = 10
            ..strokeCap = StrokeCap.round
            ..strokeJoin = StrokeJoin.round);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
