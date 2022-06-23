// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(First());
}

class First extends StatefulWidget {
  First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FirstState",
      home: second(),
    );
  }
}

class second extends StatefulWidget {
  second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  getUserData() async {
    var response = await http
        .get(Uri.https("https://jsonplaceholder.typicode.com/", "users"));
    var jsondata = jsonDecode(response.body);
    List<user> users = [];

    for (var u in jsondata) {
      user User = user(u['name'], u['email'], u['username']);
      users.add(User);
    }

    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("user data"),
        ),
        body: Container(
          child: Card(
            child: FutureBuilder(
              future: getUserData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(snapshot.data[i].name),
                          subtitle: Text(snapshot.data[i].username),
                          trailing: Text(snapshot.data[i].email),
                        );
                      });
                  // return Container(
                  //   child: Center(
                  //     child: Text("loaidng..."),
                  //   ),
                  // );
                } else {
                  return Container(
                    child: Center(
                      child: Text("loaidng..."),
                    ),
                  );
                  // return ListView.builder(
                  //   itemCount: snapshot.data.length,
                  //   itemBuilder: (context, i) {
                  //   return ListTile(
                  //     title: Text(snapshot.data[i]?.name),
                  //     subtitle: Text(snapshot.data[i].username),
                  //     trailing: Text(snapshot.data[i].email),
                  //   );
                  // }
                  // );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class user {
  final String name, email, username;

  user(this.name, this.email, this.username);
}
