import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:ofa_v0/oss_licenses.dart';

class OssLicensesPage extends StatelessWidget {
  static Future<List<String>> loadLicenses() async {
    // merging non-dart based dependency list using LicenseRegistry.
    final ossKeys = ossLicenses.keys.toList();
    final lm = <String, List<String>>{};
    await for (var l in LicenseRegistry.licenses) {
      for (var p in l.packages) {
        if (!ossKeys.contains(p)) {
          final lp = lm.putIfAbsent(p, () => []);
          lp.addAll(l.paragraphs.map((p) => p.text));
          ossKeys.add(p);
        }
      }
    }
    for (var key in lm.keys) {
      ossLicenses[key] = {'license': lm[key].join('\n')};
    }
    return ossKeys..sort();
  }

  static final _licenses = loadLicenses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      appBar: AppBar(
        title: const Text('Licenses'),
        backgroundColor: Color(0xff212121),
      ),
      body: FutureBuilder<List<String>>(
          future: _licenses,
          builder: (context, snapshot) {
            return ListView.separated(
              padding: const EdgeInsets.all(0),
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final key = snapshot.data[index];
                final licenseJson = ossLicenses[key];
                final version = licenseJson['version'];
                final desc = licenseJson['description'];
                return ListTile(
                    tileColor: Color(0xff212121),
                    title: Text(
                      '$key ${version ?? ''}',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: desc != null
                        ? Text(
                            desc,
                            style: TextStyle(color: Colors.white),
                          )
                        : null,
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MiscOssLicenseSingle(
                            name: key, json: licenseJson))));
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 3,
                color: Colors.white,
                indent: 10,
                endIndent: 10,
              ),
            );
          }),
    );
  }
}

class MiscOssLicenseSingle extends StatelessWidget {
  final String name;
  final Map<String, dynamic> json;

  String get version => json['version'];
  String get description => json['description'];
  String get licenseText => json['license'];
  String get homepage => json['homepage'];

  MiscOssLicenseSingle({this.name, this.json});

  String _bodyText() {
    return licenseText.split('\n').map((line) {
      if (line.startsWith('//')) line = line.substring(2);
      line = line.trim();
      return line;
    }).join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name ${version ?? ''}'),
        backgroundColor: Color(0xff212121),
      ),
      body: Container(
          // color: Theme.of(context).canvasColor,
          color: Color(0xff212121),
          child: ListView(children: <Widget>[
            if (description != null)
              Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                  child: Text(description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontWeight: FontWeight.bold))),
            if (homepage != null)
              Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                  child: InkWell(
                    child: Text(homepage,
                        style: const TextStyle(
                            color: Color(0xFFECB02D),
                            decoration: TextDecoration.underline)),
                    onTap: () => launch(homepage),
                  )),
            if (description != null || homepage != null) const Divider(),
            Padding(
              padding:
                  const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
              child: Text(_bodyText(),
                  style: Theme.of(context).textTheme.bodyText2),
            ),
          ])),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';

// class HowToDel extends StatefulWidget {
//   @override
//   _HowToDelState createState() => _HowToDelState();
// }

// class _HowToDelState extends State<HowToDel> {
//   // double _pageViewHeight = 0.45;

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
                      "How to delete your data from Facebook:",
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
                  child: Image(
                      image: AssetImage(
                    'assets/images/json_tutorial.gif',
                  )),
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
// }
