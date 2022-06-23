// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class searchbr extends StatefulWidget {
  searchbr({Key? key}) : super(key: key);

  @override
  State<searchbr> createState() => _searchbrState();
}

class _searchbrState extends State<searchbr> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Scaffold(
            appBar: AppBar(
                // The search area here
                title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      /* Clear the search field */
                      print("pressed");
                    },
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none),
            ),
          ),
        ))),
      ),
    );
  }
}
