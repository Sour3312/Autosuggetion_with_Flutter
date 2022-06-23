// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, camel_case_types, avoid_init_to_null, prefer__ructors, deprecated_member_use, unused_local_variable, non_ant_identifier_names, prefer_interpolation_to_compose_strings, prefer__ructors_in_immutables, prefer__literals_to_create_immutables, prefer__ructors, prefer__literals_to_create_immutables, sort_child_properties_last, non_ant_identifier_names, prefer__ructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

// import 'addser.dart';

class homescr extends StatefulWidget {
  homescr({Key? key}) : super(key: key);

  @override
  State<homescr> createState() => _homescrState();
}

class _homescrState extends State<homescr> {
  @override
  Widget build(BuildContext context) {
    // variable declareation
    List items = [];
    var tup;
    var placeName;
    var placeAddress;
    var alternateName;
    print(placeName);

//function declartion
    Future getApi() async {
      try {
        print(" Api data calling...");

        var response =
            await https.get(Uri.parse('https://api.publicapis.org/entries'));
        var Data = await json.decode(response.body);
        return Data;
        // 'https://atlas.mappls.com/api/places/search/json?query=$e'),

        // Send authorization headers to the backend.
        // headers: {
        // 'ContentType': "application/json",
        // 'Access-Control-Allow-Origin': "*",
        // 'Access-Control-Allow-Headers': '*',
        // 'Access-Control-Allow-Methods': 'POST,GET,DELETE,PUT,OPTIONS',
        // 'cors': '*',
        // HttpHeaders.authorizationHeader:
        //     "bearer ece63ea6-135d-49cd-9615-a7c3f284732b",
        // });

        // var statuscode = response.statusCode;
        // print(" status code is : $statuscode");

        //all data in map
        // print("Data is:  $Data");
        // print("Data len is:  $Data.length");

        // items = Data["suggestedLocations"];
        // print(" items is :$items");
        // print("Items length is: $items.length");
        // print('asmap:  $items.asMap()');
        // print(items[0]["title"]);

        // print("------------All Suggetions From :$e---------------");

        // //loop for show all api called data(12)
        // for (var i = 1; i < items.length; i++) {
        //   placeName = items[i]["placeName"];
        //   placeAddress = items[i]["placeAddress"];
        //   alternateName = items[i]["alternateName"];
        //   print("$i : $placeName $placeAddress");
        // }

        // Column(
        //   children: [
        //     Text("placeAddress"),
        //   ],
        // );
        // print("End of loop");
        // log('data: qwertyuiop');
        // debugPrint('movieTitle: movieTitle');

        // print("------------All Suggetions Done Here-----------------");

        // print('statuscode: ${response.statusCode}'); jamshedpur
        // print("place add is: ${items[5]["placeAddress"]}");
        // print("place add is: ${items[12]["placeAddress"]}");
        // print(items[0]["POI"]);
        // print(items[0]["eLoc"]);
        // print("place name is: ${items[5]["placeName"]}");
        // print("place name is: ${items[12]["placeName"]}");
        // print(items[0]["alternateName"]);
        // print(response.contentLength);

      } catch (error) {
        // print(error.toString());
      }
      print("Data is called");
    }

    // ================================================================================================

    return MaterialApp(
      home: Material(
        child: Scaffold(
          appBar: AppBar(
              titleSpacing: 0.0,
              // The search area here
              title: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: TextField(
                    onChanged: (text) {
                      getApi();

                      // tup = text;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            tup = '';
                            print("pressed");
                          },
                        ),
                        hintText: 'Search...',
                        border: InputBorder.none),
                  ),
                ),
              )),
          body: FutureBuilder(
              future: getApi(),
              builder: (context, dynamic snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data["entries"].length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            title: snapshot.data["entries"][index]["API"],
                            subtitle: snapshot.data["entries"][index]
                                ["Description"],
                          ),
                        );
                      });

                  // return Center(child: Text("data"));
                  // Column(
                  //   children: [
                  //     Center(
                  //       child: Padding(
                  //         padding: EdgeInsets.only(top: 58),
                  //         child: ElevatedButton(
                  //             onPressed: () {
                  //               getApi(tup);
                  //             },
                  //             child: Column(
                  //               children: [Text("Get API")],
                  //             )),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 50,
                  //     ),
                  //     Column(
                  //       children: [
                  //         // Text("user input is: $tup"),
                  //         SizedBox(
                  //           height: 50,
                  //         ),
                  //         // Text(
                  //         // "All suggested places are $placeName $placeAddress $alternateName",
                  //         // )
                  //       ],
                  //     ),

                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          drawer: Drawer(),
        ),
      ),
    );
    debugShowCheckedModeBanner:
    false;
  }
}
