import 'package:c2ho_hackathon/c2ho_painter.dart';
import 'package:flutter/material.dart';

import 'animation_controller_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const C2HOPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class C2HOPage extends StatefulWidget {
  const C2HOPage({
    required this.title,
    Key? key,
  }) : super(key: key);

  /// the text to be shown in the app bar
  final String title;

  @override
  _C2HOPageState createState() => _C2HOPageState();
}

class _C2HOPageState extends State<C2HOPage>
    with SingleTickerProviderStateMixin {
  /// the duration of the animation (that, is the time it takes to go around the given circle once).
  /// Milliseconds.
  final int _periodInMs = 7500;
  static final _animation = Tween<double>();

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: CustomPaint(
          foregroundPainter: C2HOPainter(
            width: _width,
            height: _height,
            center: _center,
            progress: _controller.value,
          ),
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

  void _playOrPause() {
    setState(() {
      if (!_isPlaying) {
        _controller.repeat();
        _isPlaying = true;
        print(_controller.value);
        print('is not Playing');
      } else {
        _controller.stop();
        _isPlaying = false;
        print(_controller.value);
        print('is Playing');
      }
    });
  }

  void _reset() {
    setState(() {
      _controller.reset();
      _isPlaying = false;
    });
  }
}

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
