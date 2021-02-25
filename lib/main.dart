import 'package:flutter/material.dart';
// import 'package:ofa_v0/views/more_websites.dart';
import 'package:ofa_v0/views/nojson.dart';
// import 'package:ofa_v0/json_parser.dart'
import 'package:ofa_v0/views/loadingjson.dart';
import 'package:ofa_v0/views/dashboard.dart';
import 'package:ofa_v0/views/onboarding.dart';
import 'package:ofa_v0/views/how_to_del.dart';

void main() {
  runApp(MyApp());
}   

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OFA Prototype',
      //TODO: innitial rout should be /dashBoard if JSON was already loaded before
      initialRoute: '/onboarding',
      routes: {
        //TODO: Implement App Loading Screen
        //TODO: Implement Splash Screen
        //TODO: Onboarding
        // '/': (context) => LoadingHome(),
        '/onboarding': (context) => Onboarding(),
        '/dashBoard': (context) => DashBoard(),
        '/noJSON': (context) => NoJSON(),
        '/loadingJSON': (context) => LoadingJSON(),
        '/how_to_del': (context) => HowToDel(),
        // '/more_websites': (context) => MoreWebsites(),
      }
    ); 
  }
}