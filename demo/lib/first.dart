// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var urll = "https://api.publicapis.org/entries";
  // var data;
  getapi() async {
    var rsponse = await get(Uri.parse(urll));
    var data = json.decode(rsponse.body);
    return data;

    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          body: FutureBuilder(
              future: getapi(),
              builder: (context, dynamic snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data['entries'].length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(010),
                        child: ListTile(
                          trailing: Icon(Icons.api),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB76-TWfGJOM6V6_m_cAvduqkxOON8zeJnag&usqp=CAU"),
                          ),
                          // leading: Text(
                          //     "Category:\n ${snapshot.data['entries'][index]['Category']}"),
                          dense: true,
                          isThreeLine: true,
                          tileColor: Colors.greenAccent,
                          title: Text(
                              " ${snapshot.data['entries'][index]['API']}"),
                          subtitle: Text(
                              "${snapshot.data['entries'][index]['Description']}"),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
