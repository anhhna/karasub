import 'package:flutter/material.dart';

class TimelineRulerPainter extends CustomPainter {
  final double currentPosition;
  final double totalDuration;

  TimelineRulerPainter({
    required this.currentPosition,
    required this.totalDuration,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white30
      ..strokeWidth = 1;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    // Draw time markers
    // const secondsPerMark = 1;
    final totalSeconds = (totalDuration / 1000).ceil();
    final pixelsPerSecond = size.width / totalSeconds;

    for (int i = 0; i <= totalSeconds; i++) {
      final x = i * pixelsPerSecond;
      final height = i % 5 == 0 ? 20.0 : 10.0;

      canvas.drawLine(
        Offset(x, size.height - height),
        Offset(x, size.height),
        paint,
      );

      if (i % 5 == 0) {
        final minutes = i ~/ 60;
        final seconds = i % 60;
        final timeText = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

        textPainter.text = TextSpan(
          text: timeText,
          style: const TextStyle(color: Colors.white54, fontSize: 10),
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(x - textPainter.width / 2, size.height - height - 16),
        );
      }
    }

    // Draw playhead
    final playheadX = (currentPosition / totalDuration) * size.width;
    final playheadPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2;

    canvas.drawLine(
      Offset(playheadX, 0),
      Offset(playheadX, size.height),
      playheadPaint,
    );

    // Draw playhead triangle
    final path = Path();
    path.moveTo(playheadX, 0);
    path.lineTo(playheadX - 6, 10);
    path.lineTo(playheadX + 6, 10);
    path.close();

    canvas.drawPath(
      path,
      Paint()..color = Colors.blue,
    );
  }

  @override
  bool shouldRepaint(TimelineRulerPainter oldDelegate) {
    return currentPosition != oldDelegate.currentPosition ||
        totalDuration != oldDelegate.totalDuration;
  }
}
