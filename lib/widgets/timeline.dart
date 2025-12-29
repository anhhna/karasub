import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../painters/timeline_ruler_painter.dart';

class TimelineWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final double currentPosition;

  const TimelineWidget({
    super.key,
    required this.controller,
    required this.currentPosition,
  });

  @override
  Widget build(BuildContext context) {
    final totalDuration = controller.value.isInitialized
        ? controller.value.duration.inMilliseconds.toDouble()
        : 26000.0;

    return Container(
      height: 100,
      color: const Color(0xFF1E1E1E),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CustomPaint(
                painter: TimelineRulerPainter(
                  currentPosition: currentPosition,
                  totalDuration: totalDuration,
                ),
                child: Container(),
              ),
            ),
          ),
          _buildToolIcons(),
        ],
      ),
    );
  }

  Widget _buildToolIcons() {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          _buildTimelineIcon(Icons.pan_tool_outlined),
          const SizedBox(width: 8),
          _buildTimelineIcon(Icons.brush_outlined),
          const SizedBox(width: 8),
          _buildTimelineIcon(Icons.text_fields),
        ],
      ),
    );
  }

  Widget _buildTimelineIcon(IconData icon) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: icon == Icons.text_fields
            ? const Color(0xFFCCCC00)
            : const Color(0xFF3C3C3C),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(
        icon,
        size: 16,
        color: icon == Icons.text_fields ? Colors.black : Colors.white70,
      ),
    );
  }
}
