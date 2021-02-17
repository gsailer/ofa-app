import 'package:flutter/material.dart';
import 'package:ofa_v0/json_parser.dart';
// import 'package:ofa_v0/views/more_websites.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoard createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {
  OFAjson data;
    OFAjson sortedData;
    ListView subtitleCollapsed;
    ListView subtitle ;
    int firstInit = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

   data = ModalRoute.of(context).settings.arguments;
   sortedData = sortData(data);
    return Scaffold(
      backgroundColor: Color(0xff212121),
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
              //TODO get the right amount of websites and apps 
              _appsAndWebsitesCard(),
              _appWebCardWindow("Web-sites that share your information (${data.offFacebookActivity.length})"),
              _appWebCardWindow("Apps that share your information (${data.offFacebookActivity.length})"),
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

  Widget _appWebCardWindow(String title) {
    if(firstInit == 1){
      subtitle = _subtitle(data, sortedData);
      firstInit --;
    }
    //TODO Let the tile take up the whole screen when expanded (user should still be able to scroll to other tiles) and collapse other tiles
    return Theme(
      data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.white, accentColor: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0),
        child: ListTileTheme(
            dense: true, //TODO See if this needs to be here
            contentPadding: EdgeInsets.symmetric(horizontal: 4),
                      child: ExpansionTile(
                    title: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    onExpansionChanged: (state){
                      setState(() {
                        subtitle = state ? null : _subtitle(data, sortedData);  
                      });
                    },
                    subtitle: subtitle,
                    children: <Widget>[
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: (data.offFacebookActivity.length > 2)
                            ? data.offFacebookActivity.length - 2
                            : 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 4
                            ),
                                                      child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                )
                              ),
                              child: ListTile(
                                  leading: Image(
                                    image: AssetImage('assets/images/3_todo.png'),
                                    width: 44,
                                    height: 44,
                                  ),
                                  title: Text(sortedData.offFacebookActivity[index].name,
                                  style: TextStyle(color: Colors.white),),
                                  subtitle: Text(sortedData.offFacebookActivity[index].events.length.toString() +' Events',
                                  style: TextStyle(color: Colors.white),),
                                ),
                            ),
                          );
                          
                        },
                      )
                    ],
                  ),
          ),
        ),
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

ListView _subtitle(data, sortedData){
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: (data.offFacebookActivity.length > 2)
        ? 2
        : data.offFacebookActivity.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 8
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1,
            )
          ),
          child: ListTile(
              leading: Image(
                image: AssetImage('assets/images/3_todo.png'),
                width: 44,
                height: 44,
              ),
              title: Text(sortedData.offFacebookActivity[index].name,
              style: TextStyle(
                color: Colors.white
                )
              ),
              subtitle: Text(sortedData.offFacebookActivity[index].events.length.toString() + ' Events',
                style: TextStyle(color: Colors.white),)
            ),
        ),
      );
    },
  );
}
