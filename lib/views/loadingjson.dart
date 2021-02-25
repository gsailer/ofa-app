import 'dart:convert';
import 'dart:io';
import 'package:df/df.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ofa_v0/json_parser.dart';
import 'package:archive/archive.dart' as Arc;
import 'package:ofa_v0/pipeline.dart';
import 'package:ofa_v0/repositories.dart';

class LoadingJSON extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class DashboardArguments {
  OFAjson data;
  INRepository insights;
  DashboardArguments(this.data, this.insights);
}

class _LoadingScreenState extends State<LoadingJSON> {
  void _alertDialog(String err) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(err),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Try again"),
              ),
            ],
          );
        });
  }

  void readJSON() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['zip'],
          allowMultiple: false);

      if (result != null) {
        File zip = File(result.files.first.path);
        final Arc.Archive archive =
            new Arc.ZipDecoder().decodeBytes(await zip.readAsBytes());

        var json = await archive
            .findFile("your_off-facebook_activity.json")
            .content as List<int>;
        String contents = utf8.decode(json);

        final jsonEvents = OFAjson.fromJson(jsonDecode(contents));
        DFRepository dataframe = new DFRepository(jsonEvents);
        INRepository insightsData = new INRepository();
        Pipeline pipeline = new Pipeline(insightsData, dataframe);
        pipeline.trigger();

        Navigator.pushReplacementNamed(context, '/dashBoard',
            arguments: DashboardArguments(jsonEvents, pipeline.insightsRepo));
      } else {
        Navigator.of(context).pop();
        _alertDialog(
            "Something went wrong. Are you sure you chose the right archive?");
      }
    } catch (e) {
      // TODO: do actual exception handling and don't pipe through exceptions
      Navigator.of(context).pop();
      _alertDialog(e.toString());
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
