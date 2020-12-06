import 'package:flutter/material.dart';
import 'package:json_prototype/OFAjson2.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoard createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {

  OFAjson2 data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Activitys with most events'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: data.offFacebookActivity.length,
          itemBuilder: (context, index){
          
          OFAjson2 sortedData = sortData(data);

          return ListTile(
            title: Text(sortedData.offFacebookActivity[index].name),
            subtitle: Text(sortedData.offFacebookActivity[index].events.length.toString() + ' Events'),
            );
          },
        ),
      )
    );
  }
}

OFAjson2 sortData(OFAjson2 data) {
  data.offFacebookActivity.sort((a, b) => b.events.length.compareTo(a.events.length));
  return data;
}