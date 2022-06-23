// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:substring_highlight/substring_highlight.dart';

class HomeClass extends StatefulWidget {
  HomeClass({Key? key}) : super(key: key);

  @override
  State<HomeClass> createState() => _HomeClassState();
}

class _HomeClassState extends State<HomeClass> {
  bool isLoading = false;
  late List<String> autoCompleteData;
  late TextEditingController controller;

  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });

    var urll = "assets/data.json";

    final String stringData = await rootBundle.loadString(urll);
    print(stringData);
    final List<dynamic> json = jsonDecode(stringData);
    print(json);
    final List<String> jsonStringData = json.cast<String>();
    print(jsonStringData);

    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAutoCompleteData();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Auto Suggestion Searchbar in Flutter"),
          ),
          body: isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Autocomplete(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            // return Iterable<String>.empty();
                            return Iterable<String>.empty();
                          } else {
                            return autoCompleteData.where((word) => word
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase()));
                          }
                        },
                        optionsViewBuilder:
                            (context, Function(String) onSeleced, options) {
                          return Material(
                              elevation: 10.0,
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    final option = options.elementAt(index);

                                    return ListTile(
                                      title: SubstringHighlight(
                                        text: option.toString(),
                                        term: controller.text,
                                      ),
                                      // title: Text(option.toString(),),
                                      subtitle: Text("item Searched"),
                                      onTap: () {
                                        onSeleced(option.toString());
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      Divider(),
                                  itemCount: options.length,
                                ),
                              ));
                        },
                        onSelected: (selectedOption) {
                          print(selectedOption);
                        },
                        fieldViewBuilder: (buildContext, controller, focusNode,
                            onEditingComplete) {
                          this.controller = controller;
                          return TextField(
                              controller: controller,
                              focusNode: focusNode,
                              onEditingComplete: onEditingComplete,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: Colors.green)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  hintText: "Search here Sourabh",
                                  prefixIcon: Icon(Icons.search)));
                        },
                      )
                    ],
                  ),
                )),
    );
  }
}
