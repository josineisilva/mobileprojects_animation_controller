import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
  with SingleTickerProviderStateMixin<Home> {
  AnimationController _controller;
  int i = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controller.addListener(_update);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Controller"),),
      body:  Center(
        child: Text(
          '$i m/s',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            child: Text('Start'),
            onPressed: () => setState(() {
              if (i==0)
                _controller.forward();
              else
                _controller.reverse();
            }),
          ),
        ],
      ),
    );
  }

  void _update() {
    setState(() {
      i = (_controller.value * 299792458).round();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}