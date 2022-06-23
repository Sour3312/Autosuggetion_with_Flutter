// ignore_for_file: prefer_const_constructors

import 'package:demo/first.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Home Page Appbar'),
          ),
          body: FirstPage(),
        ),
      ),
    );
  }
}
