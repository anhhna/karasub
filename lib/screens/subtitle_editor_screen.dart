import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:multi_split_view/multi_split_view.dart';
import '../widgets/menu_bar.dart';
import '../widgets/subtitle_list.dart';
import '../widgets/video_preview.dart';
import '../widgets/settings_panel.dart';
import '../widgets/timeline.dart';

class SubtitleEditorScreen extends StatefulWidget {
  const SubtitleEditorScreen({super.key});

  @override
  State<SubtitleEditorScreen> createState() => _SubtitleEditorScreenState();
}

class _SubtitleEditorScreenState extends State<SubtitleEditorScreen> {
  late VideoPlayerController _controller;
  double _currentPosition = 0.0;
  bool _isPlaying = false;
  
  late final MultiSplitViewController _verticalController;
  late final MultiSplitViewController _horizontalController;

  @override
  void initState() {
    super.initState();
    
    _horizontalController = MultiSplitViewController(areas: [
      Area(builder: (context, area) => const SubtitleListPanel()),
      Area(builder: (context, area) => VideoPreviewPanel(
        controller: _controller,
        isPlaying: _isPlaying,
      )),
      Area(builder: (context, area) => const SettingsPanel()),
    ]);
    
    _verticalController = MultiSplitViewController(areas: [
      Area(
        builder: (context, area) => MultiSplitView(controller: _horizontalController),
      ),
      Area(
        builder: (context, area) => TimelineWidget(
          controller: _controller,
          currentPosition: _currentPosition,
        ),
      ),
    ]);
    
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    )..initialize().then((_) {
        setState(() {});
        _controller.addListener(() {
          setState(() {
            _currentPosition = _controller.value.position.inMilliseconds.toDouble();
            _isPlaying = _controller.value.isPlaying;
          });
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const EditorMenuBar(),
          Expanded(
            child: MultiSplitView(
              axis: Axis.vertical,
              controller: _verticalController,
            ),
          ),
        ],
      ),
    );
  }
}
