import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecondExample extends StatefulWidget {
  @override
  _SecondExampleState createState() => _SecondExampleState();
}

class _SecondExampleState extends State<SecondExample> {
  String url = "https://source.unsplash.com/random/800x600";

  changeUrl() {
    setState(() {
      url = "https://source.unsplash.com/random/800x600/?" +
          "q=${DateTime.now().millisecondsSinceEpoch}";
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (mounted) {
        changeUrl();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(onTap: changeUrl, child: Image.network(url)),
    );
  }
}
