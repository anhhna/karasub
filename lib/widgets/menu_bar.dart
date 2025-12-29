import 'package:flutter/material.dart';

class EditorMenuBar extends StatelessWidget {
  const EditorMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: const Color(0xFF2D2D2D),
      child: Row(
        children: [
          _menuItem('File'),
          _menuItem('Edit'),
          _menuItem('Template'),
          _menuItem('Tool'),
          _menuItem('Window'),
          _menuItem('Help'),
        ],
      ),
    );
  }

  Widget _menuItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Text(
        title,
        style: const TextStyle(fontSize: 12, color: Colors.white70),
      ),
    );
  }
}
