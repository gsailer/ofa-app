import 'package:flutter/material.dart';
import 'package:ofa_v0/json_parser.dart';
// import 'package:ofa_v0/views/more_websites.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoard createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {
  OFAjson data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff212121),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => null,
            //     ));
          },
        ),
      ),
      body: ListView(
        // physics: const AlwaysScrollableScrollPhysics(),
        // shrinkWrap: true,
        children: <Widget>[
          _appWebCardWindow(),
        ],
      ),
    );
  }

  Widget _insightCardWindow() {
    //TODO The window where the insight cards are displayed.
  }

  Widget _insightCard() {
    //TODO This should be the content of the insight cards. When clicking on one of the cards, the corresponding insight screen should be displayed.
  }

  Widget _appWebCardWindow() {
    OFAjson sortedData = sortData(data);
    //TODO The window where the app and website Cards with most shared infos to FB are displayed
    return ExpansionTile(
      title: Text(
        "Web-sites that share your information (${data.offFacebookActivity.length})",
      ),
      subtitle: Container(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: (data.offFacebookActivity.length > 2)
              ? 2
              : data.offFacebookActivity.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(sortedData.offFacebookActivity[index].name),
              subtitle: Text(sortedData.offFacebookActivity[index].events.length
                      .toString() +
                  ' Events'),
            );
          },
        ),
      ),
      children: <Widget>[
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: (data.offFacebookActivity.length > 2)
              ? data.offFacebookActivity.length - 2
              : 0,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(sortedData.offFacebookActivity[index].name),
              subtitle: Text(sortedData.offFacebookActivity[index].events.length
                      .toString() +
                  ' Events'),
            );
          },
        )
      ],
    );
  }

  Widget _appsAndWebsitesCard() {
    return Icon(Icons.ac_unit);
  }
}

OFAjson sortData(OFAjson data) {
  data.offFacebookActivity
      .sort((a, b) => b.events.length.compareTo(a.events.length));
  return data;
}
