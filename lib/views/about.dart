import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class About extends StatelessWidget {
  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

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
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            kToolbarHeight,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff212121),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "About",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "The OFA app was developed in cooperation with the KIT for usage in reasearch related to privacy awareness. It should better visualise data provided by Facebook through the GDPR information on Off-Facebook activity.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  )),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: FutureBuilder<String>(
                  future: getVersion(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.none) {
                      return Text("Version: dev");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Getting version...');
                    } else {
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');
                      else
                        return Text('Version ${snapshot.data}');
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
