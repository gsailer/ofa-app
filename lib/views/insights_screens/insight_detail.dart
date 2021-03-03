import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class InsightDetail extends StatelessWidget {

  final Map<String, dynamic> element;

  InsightDetail({Key key, @required this.element}) : super(key: key);

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
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Detailed data:",
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
                    child: Text(element["count"].toString(),
                        ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: 'Delete Data steps:\n\n',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFECB02D),
                            ),
                            children: <TextSpan>[
                              TextSpan(text: '1. '),
                              TextSpan(
                                  text: 'Open ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              TextSpan(
                                  text: 'Account ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              TextSpan(
                                  text: 'tab\n\n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              TextSpan(text: '2. '),
                              TextSpan(
                                  text: 'Click on ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              TextSpan(
                                  text: 'Settings & privacy\n\n',
                                  style: TextStyle(fontSize: 15)),
                              TextSpan(text: '3. '),
                              TextSpan(
                                  text: 'Open ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              TextSpan(
                                  text:
                                      'View or clear your off-Facebook activity\n\n',
                                  style: TextStyle(fontSize: 15)),
                              TextSpan(text: '4. '),
                              TextSpan(
                                  text: 'Click on ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              TextSpan(
                                  text: 'Clear History\n\n',
                                  style: TextStyle(fontSize: 15)),
                              TextSpan(text: '5. '),
                              TextSpan(
                                  text: 'Confirm with ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              TextSpan(
                                  text: 'Clear History',
                                  style: TextStyle(fontSize: 15)),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
