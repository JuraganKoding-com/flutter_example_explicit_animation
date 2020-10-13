import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Explicit Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final Tween<double> turnsTween = Tween<double>(begin: 1, end: 3);
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    this._controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  void _startAnimation() {
    if (this._controller.status == AnimationStatus.completed) {
      this._controller.reverse();
    }

    if (this._controller.status == AnimationStatus.dismissed) {
      this._controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RotationTransition(
          child: Image.asset("assets/wheel_wagon.webp"),
          turns: turnsTween.animate(this._controller),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startAnimation,
        tooltip: 'Increment',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
