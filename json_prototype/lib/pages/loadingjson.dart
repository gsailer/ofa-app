import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:json_prototype/OFAjson2.dart';
import '../OFAjson.dart';

class LoadingJSON extends StatefulWidget {
  @override 
  _LoadingScreen createState() => _LoadingScreen();
}

class _LoadingScreen extends State<LoadingJSON> {
  void readJSON() async {

    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();

      if(result != null) {
        File file = File(result.files.single.path);
        print(file);
        String contents = await file.readAsString();
        print(contents);
        final jsonEvents = OFAjson2.fromJson(jsonDecode(contents));
        print(jsonEvents.offFacebookActivity.length);
        Navigator.pushReplacementNamed(context, '/dashBoard', arguments: jsonEvents);

      } else {
          print('error');
          Navigator.pushReplacementNamed(context, '/noJSON');
      }

    } catch (e) {
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
        child: Text('loading',
        style: TextStyle(fontSize: 20),)
      ),
    );
  }
}

