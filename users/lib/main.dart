// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:users/modalinfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  List<api2> postList = [];
  Future<List<api2>> getPostApi() async {
    final res = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/"));

    var data = jsonDecode(res.body.toString());

    if (res.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(api2.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("api calling"),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading..");
                  } else {
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          // return Text(index.toString());
                          return Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("UserId\n" +
                                      postList[index].userId.toString()),
                                  Text("Title\n" +
                                      postList[index].title.toString()),
                                  Text("Body\n" +
                                      postList[index].body.toString()),
                                ],
                              ),
                            )),
                          );
                        });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
