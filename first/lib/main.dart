// ignore_for_file: avoid_print

import 'package:first/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// void main() {
//   runApp(FirstApi());
// }

import 'dart:io';

void main() {
  print("Enter your name?");
  // Reading name of the Geek
  String? name = stdin.readLineSync();

  // Printing the name
  print("Hello, $name! ");
}
