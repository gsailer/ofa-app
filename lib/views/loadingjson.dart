import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ofa_v0/json_parser.dart';
import 'package:archive/archive.dart' as archive_lib;
import 'package:ofa_v0/pipeline.dart';
import 'package:ofa_v0/repositories.dart';

class LoadingJSON extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

// TODO: Move to a better more sensible spot
class InsightsArguments {
  INRepository insights;
  InsightsArguments(this.insights);
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
        final archive_lib.Archive archive =
            new archive_lib.ZipDecoder().decodeBytes(await zip.readAsBytes());

        var json = await archive
            .findFile("ads_and_businesses/your_off-facebook_activity.json")
            ?.content as List<int>;

        if (json == null) {
          throw new Exception(
              "Could not find activity information in the archive.");
        }
        String contents = utf8.decode(json);

        final jsonEvents = OFAjson.fromJson(jsonDecode(contents));
        DFRepository dataframe = new DFRepository(jsonEvents);
        INRepository insightsData = new INRepository();
        Pipeline pipeline = new Pipeline(insightsData, dataframe);
        pipeline.trigger();

        Navigator.pushReplacementNamed(context, '/dashBoard',
            arguments: pipeline.insightsRepo);
      } else {
        Navigator.of(context).pop();
        _alertDialog(
            "Something went wrong. Are you sure you chose the right archive?");
      }
    } catch (e) {
      // TODO: do actual exception handling and don't pipe through exceptions
      Navigator.of(context).pop();
      _alertDialog("${e.toString()}\nDid you supply the correct archive?");
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
