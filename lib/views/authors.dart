import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class Authors extends StatefulWidget {
  @override
  _AuthorsState createState() => _AuthorsState();
}

class _AuthorsState extends State<Authors> {
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
        //TODO auto fill height
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            kToolbarHeight,
        color: Color(0xff212121),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text(
                "Authors:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/images/author_dominik.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Expanded(
                    child: Text(
                        "Dominik Prediger\nDeveloper",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  InkWell(
                    child: Text("Github",
                        style: TextStyle(
                            color: Color(0xFFECB02D),
                            decoration: TextDecoration.underline)),
                    onTap: () => launch("https://github.com/DeadRbbt"),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/images/author_gabriel.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Expanded(
                      child: Text(
                    "Gabriel Sailer\nDeveloper",
                    style: TextStyle(color: Colors.white),
                  )),
                  InkWell(
                    child: Text("Github\n",
                        style: TextStyle(
                            color: Color(0xFFECB02D),
                            decoration: TextDecoration.underline)),
                    onTap: () => launch("https://github.com/sublinus"),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/images/author_polina.png',
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Expanded(
                      child: Text(
                    "Polina Trofimova\nDesigner",
                    style: TextStyle(color: Colors.white),
                  )),
                  InkWell(
                    child: Text("Website",
                        style: TextStyle(
                            color: Color(0xFFECB02D),
                            decoration: TextDecoration.underline)),
                    //TODO Website of designer
                    onTap: () => launch("https://otpolie.com/"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
