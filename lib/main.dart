import 'package:flutter/material.dart';
import 'package:fvp/fvp.dart' as fvp;
import 'screens/subtitle_editor_screen.dart';

void main() {
  fvp.registerWith(options: {'platforms': ['windows', 'linux']});
  runApp(const SubtitleEditorApp());
}

class SubtitleEditorApp extends StatelessWidget {
  const SubtitleEditorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KaraSub - Subtitle Editor',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF0078D4),
          surface: const Color(0xFF2D2D2D),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SubtitleEditorScreen(),
    );
  }
}