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

  void _alertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          //TODO: give more comprehensive error
          content: Text("Are you sure you have selected the OFA.zip file?"),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: Text("Try again"),
            ),
          ],
        );
      }
    );
  }
  
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
        Navigator.of(context).pop();
        _alertDialog();
        
      }
    } catch (e) {
      //TODO: Give user info his json file was
      Navigator.of(context).pop();
      _alertDialog();
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
