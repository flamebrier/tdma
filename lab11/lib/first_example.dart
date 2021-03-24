
import 'package:flutter/material.dart';

class FirstExample extends StatefulWidget {
  @override
  _FirstExampleState createState() => _FirstExampleState();
}

class _FirstExampleState extends State<FirstExample> {
  Text myText = Text("This is a nice photo!");
  Image myImage = Image.network(
      "https://images.pexels.com/photos/1168940/pexels-photo-1168940.jpeg");

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[myText, myImage],
      ),
    );
  }
}