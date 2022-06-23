// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables, camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:normal_apicall/search.dart';

import 'home.dart';

void main() {
  runApp(callapii());
}

// ignore: camel_case_types
class callapii extends StatefulWidget {
  callapii({Key? key}) : super(key: key);

  @override
  State<callapii> createState() => _callapiiState();
}

class _callapiiState extends State<callapii> {
  @override
  Widget build(BuildContext context) {
    return homescr();
  }
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// 