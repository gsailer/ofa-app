import 'package:flutter/material.dart';
import 'package:json_prototype/pages/nojson.dart';
import 'package:json_prototype/pages/dashboard.dart';
import 'package:json_prototype/pages/loadingjson.dart';

void main() {
  runApp(MyApp());
}   

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OFA Prototype',

      initialRoute: '/noJSON',
      routes: {
        // TODO: Implement App Loading Screen
        // '/': (context) => LoadingHome(),
        '/dashBoard': (context) => DashBoard(),
        '/noJSON': (context) => NoJSON(),
        '/loadingJSON': (context) => LoadingJSON(),
      }
    ); 
  }
}
