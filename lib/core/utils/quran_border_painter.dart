import 'package:flutter/material.dart';

class QuranBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.green.shade800
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

    final borderPaint =
        Paint()
          ..color = Colors.green.shade800.withValues(alpha: .3)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;

    // Main Border
    final rect = Rect.fromLTWH(10, 10, size.width - 20, size.height - 20);
    canvas.drawRect(rect, paint);

    // Inner Border (Double border effect)
    final innerRect = Rect.fromLTWH(15, 15, size.width - 30, size.height - 30);
    canvas.drawRect(innerRect, borderPaint);

    // Corner Decorations
    _drawCornerDecoration(canvas, Offset(10, 10), paint);
    _drawCornerDecoration(canvas, Offset(size.width - 10, 10), paint);
    _drawCornerDecoration(
      canvas,
      Offset(size.width - 10, size.height - 10),
      paint,
    );
    _drawCornerDecoration(canvas, Offset(10, size.height - 10), paint);

    // Border Markings (like Quran has)
    for (int i = 1; i < 5; i++) {
      double x = size.width * i / 5;
      canvas.drawLine(Offset(x, 10), Offset(x, 20), borderPaint);
      canvas.drawLine(
        Offset(x, size.height - 10),
        Offset(x, size.height - 20),
        borderPaint,
      );
    }
  }

  void _drawCornerDecoration(Canvas canvas, Offset position, Paint paint) {
    // Draw decorative elements at corners
    canvas.drawCircle(position, 8, paint..style = PaintingStyle.stroke);
    canvas.drawCircle(position, 4, paint..style = PaintingStyle.fill);

    // Draw small lines extending from corners
    paint..style = PaintingStyle.stroke;
    canvas.drawLine(
      position.translate(-5, -5),
      position.translate(-15, -15),
      paint,
    );
    canvas.drawLine(
      position.translate(5, -5),
      position.translate(15, -15),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
