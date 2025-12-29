import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewPanel extends StatelessWidget {
  final VideoPlayerController controller;
  final bool isPlaying;

  const VideoPreviewPanel({
    super.key,
    required this.controller,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
          _buildPlaybackControls(),
        ],
      ),
    );
  }

  Widget _buildPlaybackControls() {
    return Container(
      height: 60,
      color: const Color(0xFF2D2D2D),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: () {
              isPlaying ? controller.pause() : controller.play();
            },
          ),
          const SizedBox(width: 8),
          _buildRecordButton(),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white54),
            onPressed: () {},
          ),
          const Spacer(),
          _buildSpeedControl(),
          const SizedBox(width: 16),
          _buildTimeDisplay(),
        ],
      ),
    );
  }

  Widget _buildRecordButton() {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white54, width: 2),
      ),
      child: Center(
        child: Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildSpeedControl() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF3C3C3C),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        '1.0x',
        style: TextStyle(fontSize: 12, color: Colors.white70),
      ),
    );
  }

  Widget _buildTimeDisplay() {
    return const Text(
      '00:00.00',
      style: TextStyle(fontSize: 12, color: Colors.white70),
    );
  }
}
