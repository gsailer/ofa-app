import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ofa_v0/repositories.dart';
import 'package:ofa_v0/insights/data_exporter.dart';

class ExportData extends StatefulWidget {
  @override
  _ExportDataState createState() => _ExportDataState();
}

class _ExportDataState extends State<ExportData> {
  // double _pageViewHeight = 0.45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff212121),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
        }),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF212121),
        ),
        child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Container(
              //TODO: auto adjust height depending on phone size (prevent overflow error on small/big devices"
              height: MediaQuery.of(context).size.height * 1.4,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      child: Text(
                        "Want to help us with our research?",
                        style: TextStyle(
                          //TODO: change font to Russo One
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("If you want to contribute the anonymous summary of applications and events to this research, please press the button \"Upload your anonymous data\" below. You can look at the content of this file and see that all data is anonymous and no personal identifiers are included."
                    ),
                  ),
                  TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).buttonColor,
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    INRepository insights = new INRepository();
                    DataExporter de = new DataExporter();
                    print(insights.getInsight(de.insightKey));
                  },
                  child: Text(
                    "Upload your anonymous data",
                  )),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
