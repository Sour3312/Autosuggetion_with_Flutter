// // import 'package:flutter/material.dart';

// // ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as https;

// class AddressSearch extends SearchDelegate {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         tooltip: 'Clear',
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       tooltip: 'Back',
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Scaffold();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return FutureBuilder(
//       // We will put the api call here
//        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){return Scaffold()},
//        final response = await https.get(
//             Uri.parse(
//                 'https://atlas.mappls.com/api/places/search/json?query=$e'),

//             // Send authorization headers to the backend.
//             headers: {
//               // 'ContentType': "application/json",
//               'Access-Control-Allow-Origin': "*",
//               'Access-Control-Allow-Headers': '*',
//               'Access-Control-Allow-Methods': 'POST,GET,DELETE,PUT,OPTIONS',
//               'cors': '*',
//               HttpHeaders.authorizationHeader:
//                   "bearer 884a9c2d-0915-41a0-9df2-d85baa9e1276",
//             });
//       future: null,
//       builder: (context, snapshot) => query == ''
//           ? Container(
//               padding: EdgeInsets.all(16.0),
//               child: Text('Enter your address'),
//             )
//           : snapshot.hasData
//               ? ListView.builder(
//                   itemBuilder: (context, index) => ListTile(
//                     // we will display the data returned from our future here
//                     title: Text(snapshot.data[index]),
//                     onTap: () {
//                       close(context, snapshot.data  [index]);
//                     },
//                   ),
//                   // itemCount: snapshot.data.length,
//                 )
//               : Container(child: Text('Loading...')),
//     );
//   }
// }

// // view raw;
