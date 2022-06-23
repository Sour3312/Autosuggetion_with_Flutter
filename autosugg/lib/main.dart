// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:autosugg/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AutoSuggn());
}

class AutoSuggn extends StatefulWidget {
  AutoSuggn({Key? key}) : super(key: key);

  @override
  State<AutoSuggn> createState() => _AutoSuggnState();
}

class _AutoSuggnState extends State<AutoSuggn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeClass());
  }
}
