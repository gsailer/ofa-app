import 'package:flutter/material.dart';
import 'package:ofa_v0/json_parser.dart';
// import 'package:ofa_v0/views/more_websites.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ofa_v0/views/insights_cards/OverviewInsightCard.dart';
import 'package:ofa_v0/views/loadingjson.dart';

class DeleteConfirm extends StatefulWidget {
  @override
  _DashBoard createState() => _DashBoard();
}

class _DashBoard extends State<DeleteConfirm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(width: MediaQuery.of(context).size.width * 0.8),
      backgroundColor: Color(0xff212121),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/ofa-back-dark.png'),
              fit: BoxFit.fitHeight),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Image(
                image: AssetImage('assets/icons/settings2x.png'),
                width: 100,
                height: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    "We've Deleted all your\nData from this App",
                    style: TextStyle(
                      //TODO: change font to Russo One
                      fontSize: 30,
                      color: Colors.white,
                      // decorationStyle:
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    "We hope we helped you to learn something new about data security and Facebook policies.",
                    style: TextStyle(
                      //TODO: change font to Russo One
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE93A68),
              ),
              child: Text("Go back"),
            )
          ],
        ),
      ),
    );
  }
}
