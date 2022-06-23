// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last

// ignore_for_file: non_constant_identifier_names

import 'package:first/models/posts.dart';
import 'package:first/services/remote_ser.dart';
import 'package:flutter/material.dart';

class FirstApi extends StatefulWidget {
  FirstApi({Key? key}) : super(key: key);

  @override
  State<FirstApi> createState() => _FirstApiState();
}

class _FirstApiState extends State<FirstApi> {
  List<Posts>? posts;
  var isLoaded = false;

  @override
  void iniState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
    // print("init");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Scaffold(
            appBar: AppBar(
              title: Text("posts"),
            ),
            body: 
            // Visibility(
            //   visible: isLoaded,
               ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Text(posts![index].title),
                    );
                  }),
              // replacement: Center(child: CircularProgressIndicator()),
   )
            ),
      
    );
  }
}
