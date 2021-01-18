import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ofa_v0/json_parser.dart';

class LoadingJSON extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingJSON> {
  void readJSON() async {
  
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path);
        String contents = await file.readAsString();
        final jsonEvents = OFAjson.fromJson(jsonDecode(contents));
        Navigator.pushReplacementNamed(context, '/dashBoard',
            arguments: jsonEvents);
      } else {
        //TODO: Give user info his json file was
        print('error1');
        Navigator.pushReplacementNamed(context, '/noJSON');
      }
    } catch (e) {
        //TODO: Give user info his json file was
      print(e);
      Navigator.pushReplacementNamed(context, '/noJSON');
    }
  }

  @override
  void initState() {
    super.initState();
    readJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'loading',
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
