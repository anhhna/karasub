import 'package:flutter/material.dart';

class SubtitleListPanel extends StatelessWidget {
  const SubtitleListPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: const Color(0xFF252526),
      child: Column(
        children: [
          _buildTabBar(),
          _buildColumnHeaders(),
          Expanded(
            child: Container(
              color: const Color(0xFF1E1E1E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'Subtitle1',
              style: TextStyle(fontSize: 11, color: Colors.white),
            ),
          ),
          const SizedBox(width: 4),
          IconButton(
            icon: const Icon(Icons.add, size: 16),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildColumnHeaders() {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Center(
              child: Text(
                '\$',
                style: TextStyle(fontSize: 11, color: Colors.white70),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                ),
              ),
              child: const Text(
                'Actor',
                style: TextStyle(fontSize: 11, color: Colors.white70),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                ),
              ),
              child: const Text(
                'Content',
                style: TextStyle(fontSize: 11, color: Colors.white70),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
