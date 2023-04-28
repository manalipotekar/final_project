import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future Getdata(url)async{
  http.Response Response=await http.get(url);
  return Response.body;
}






// class TestC extends StatefulWidget {
//   const TestC({super.key});

//   @override
//   State<TestC> createState() => _TestCState();
// }

// class _TestCState extends State<TestC> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//           child: FutureBuilder(
//             future: fetchData(),
//             builder: (context, snapshot) {
//                 print(snapshot.hasData);

//               if (snapshot.hasData) {
//                 print(snapshot.hasData);
//                 return 
//                 Text(snapshot.data != null ? snapshot.data!['name'] ?? 'No data found' : 'Loading...');

//               } else if (snapshot.hasError) {
//                 // print(snapshot.toString());
//                 return Text("${snapshot.error}");
//               }
//               return CircularProgressIndicator();
//             },
//           ),
//         ),
      
//     );
//   }

//   Future<Map<String, dynamic>> fetchData() async {
//     var response = await http.get(Uri.parse('http://127.0.0.1:5000/api/data'));
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
