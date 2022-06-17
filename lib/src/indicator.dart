import 'dart:math';
import 'package:flutter/material.dart';

class Indicator extends CustomPainter {
  final double strokeWidth;
  final double progress;
  final Color backgroundColor;
  final Color color;
  final StrokeCap strokeCap;

  Indicator({
    required this.strokeWidth,
    required this.progress,
    required this.backgroundColor,
    required this.color,
    required this.strokeCap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
        radius: size.height, center: Offset(size.width / 2, size.height));
    drawBackground(canvas, rect);
    drawProgress(canvas, rect);
  }

  void drawBackground(Canvas canvas, Rect rect) {
    final Paint circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..color = backgroundColor;

    canvas.drawArc(rect, pi, pi, false, circlePaint);
  }

  void drawProgress(Canvas canvas, Rect rect) {
    final Paint circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..color = color;

    canvas.drawArc(rect, pi, pi * progress, false, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
