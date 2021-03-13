import 'package:flutter/material.dart';

import 'package:ofa_v0/views/about.dart';
import 'package:ofa_v0/views/licenses.dart';
import 'package:ofa_v0/views/loading_home.dart';
import 'package:ofa_v0/views/nojson.dart';
import 'package:ofa_v0/views/loadingjson.dart';
import 'package:ofa_v0/views/dashboard.dart';
import 'package:ofa_v0/views/onboarding.dart';
import 'package:ofa_v0/views/how_to_del.dart';
import 'package:ofa_v0/views/authors.dart';
import 'package:ofa_v0/views/delete_confirm.dart';
import 'package:ofa_v0/views/privacy_edu.dart';
import 'package:ofa_v0/views/export_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            buttonColor: Color(0xFFE93A68),
            backgroundColor: Color(0xff212121),
            textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))),
        title: 'OFA App',
        initialRoute: '/',
        routes: {
          '/': (context) => LoadingHome(),
          '/onboarding': (context) => Onboarding(),
          '/dashBoard': (context) => DashBoard(),
          '/noJSON': (context) => NoJSON(),
          '/loadingJSON': (context) => LoadingJSON(),
          '/how_to_del': (context) => HowToDel(),
          '/authors': (context) => Authors(),
          '/delete_confirm': (context) => DeleteConfirm(),
          '/licenses': (context) => OssLicensesPage(),
          '/privacy_edu': (context) => PrivacyEdu(),
          '/export_data': (context) => ExportData(),
          '/about': (context) => About(),
        });
  }
}
