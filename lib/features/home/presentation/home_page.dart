import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _openSettings = false;

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/video_demo.mp4',
    )..initialize().then(
        (_) {
          setState(() {});
          _controller.play();
          _controller.setLooping(true);
        },
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          FittedBox(
            fit: BoxFit.cover,
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          Positioned.fill(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.aspectRatio *
                    MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black38,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _openSettings = !_openSettings;
                    });
                  },
                  icon: Icon(
                    _openSettings ? Icons.close : Icons.settings,
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(
              milliseconds: 300,
            ),
            top: 120,
            left: _openSettings ? 0 : -120,
            child: FilledButton(
              style: FilledButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text('Comida'),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(
              milliseconds: 300,
            ),
            top: 120,
            right: _openSettings ? 0 : -120,
            child: FilledButton(
              style: FilledButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text('Horarios'),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(
              milliseconds: 300,
            ),
            top: 240,
            left: _openSettings ? 0 : -120,
            child: FilledButton(
              style: FilledButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text('Preguntas'),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(
              milliseconds: 300,
            ),
            top: 240,
            right: _openSettings ? 0 : -120,
            child: FilledButton(
              style: FilledButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text('Info'),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(
              milliseconds: 300,
            ),
            curve: Curves.linearToEaseOut,
            bottom: _openSettings
                ? -(MediaQuery.of(context).padding.bottom + 120)
                : MediaQuery.of(context).padding.bottom + 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(Icons.mic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
