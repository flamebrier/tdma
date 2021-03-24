import 'package:flutter/material.dart';
import 'package:lab7/paint_part.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторная 7',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Лабораторная 7'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _downCounter = 0;
  int _upCounter = 0;

  List<String> _pointers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Listener(
          onPointerDown: (details) {
            if (mounted)
              setState(() {
                _downCounter++;
              });
          },
          onPointerUp: (details) {
            if (mounted)
              setState(() {
                _upCounter++;
              });
          },
          onPointerMove: (details) {
            if (mounted)
              setState(() {
                _pointers.add(
                    "index = ${details.pointer}, ID = ${details.embedderId}, X = ${details.localPosition.dx}, Y = ${details.localPosition.dy}");
              });
          },
          child: Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PaintPart())),
                      child: Text("Paint Something")),
                  Text(
                    'down: $_downCounter',
                  ),
                  Text(
                    'up: $_upCounter',
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: _pointers.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Text(_pointers[index]);
                          }))
                ],
              ),
            ),
          )),
    );
  }
}
