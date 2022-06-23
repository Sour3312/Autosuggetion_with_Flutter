import 'dart:html';

import 'package:first/models/posts.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Posts>?> getPosts() async {
    var client = http.Client();

    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var res = await client.get(url);
    if (res.statusCode == 200) {
      var json = res.body;
      return postsFromJson(json);
    } else {
      print("not found");
    }
  }
}
