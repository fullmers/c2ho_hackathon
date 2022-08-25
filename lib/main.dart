import 'dart:math';

import 'package:c2ho_hackathon/c2ho_painter.dart';
import 'package:flutter/material.dart';

import 'animation_controller_buttons.dart';
import 'bubble.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: C2HOPage(),
    );
  }
}

class C2HOPage extends StatefulWidget {
  const C2HOPage({
    Key? key,
  }) : super(key: key);

  @override
  _C2HOPageState createState() => _C2HOPageState();
}

class _C2HOPageState extends State<C2HOPage>
    with SingleTickerProviderStateMixin {
  /// the duration of the animation (that, is the time it takes to go around the given circle once).
  /// Milliseconds.
  final int _periodInMs = 7500;
  static final _animation = Tween<double>();
  final List<Bubble> bubbles = [];
  final random = Random();

  late AnimationController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _periodInMs),
    );

    _animation.animate(_controller).addListener(() {
      // without this , the animation runs but is not visible.
      setState(() {});
    });
  }

  late double _width;
  late double _height;
  late Offset _center;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // context is not available in initState, so these calcs must be done here
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    _center = Offset(_width / 2, _height / 2);
    _createBubbles();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomPaint(
          foregroundPainter: C2HOPainter(
              width: _width,
              height: _height,
              center: _center,
              progress: _controller.value,
              bubbles: bubbles,
              totalDuration: _periodInMs),
          child: Container(
            color: Colors.black87,
          ),
        ),
      ),
      floatingActionButton: AnimationControllerButtons(
        isPlaying: _isPlaying,
        onPressPlayPause: _playOrPause,
        onPressReset: _reset,
      ),
    );
  }

  void _createBubbles() {
    bubbles.clear();

    const minRadius = 10;

    const numBubbles = 30;

    for (int i = 0; i < numBubbles; i++) {
      final r = minRadius + random.nextDouble() * 50;
      final center = getRandomCenter();

      Bubble bubble = Bubble(
        center: center,
        r: r,
        color: getRandomColor(),
        startTime: random.nextDouble(),
        duration: 2000,
      );
      bubbles.add(bubble);
    }
  }

  void _playOrPause() {
    setState(() {
      if (!_isPlaying) {
        _controller.repeat();
        _isPlaying = true;
      } else {
        _controller.stop();
        _isPlaying = false;
      }
    });
  }

  void _reset() {
    setState(() {
      _controller.reset();
      _isPlaying = false;
    });
  }

  final List<Color> palette = [
    Colors.red[500]!,
    Colors.redAccent[700]!,
    Colors.green[500]!,
    Colors.lightGreen[300]!,
    Colors.deepPurpleAccent,
    Colors.deepPurple[200]!,
    Colors.blueAccent[200]!,
    Colors.blueAccent[100]!,
    Colors.orangeAccent,
    Colors.orangeAccent[700]!,
  ];
  Color getRandomColor() => palette[random.nextInt(palette.length)];

  Offset getRandomCenter() {
    double dx = random.nextDouble() * _width;
    double dy = random.nextDouble() * _height;
    return Offset(dx, dy);
  }
}
