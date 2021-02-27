import 'package:flutter/material.dart';
import 'package:ofa_v0/json_parser.dart';
// import 'package:ofa_v0/views/more_websites.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ofa_v0/views/insights_cards/OverviewInsightCard.dart';
import 'package:ofa_v0/views/loadingjson.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoard createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {
  OFAjson data;
  OFAjson sortedData;
  ListView subtitleCollapsed;
  ListView subtitle;
  GridView cardSubtitle;
  int firstInit = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    DashboardArguments args = ModalRoute.of(context).settings.arguments;
    data = args.data;
    sortedData = sortData(data);
    return Scaffold(
      drawer: Drawer(
        child: _drawer(),
      ),
      backgroundColor: Color(0xff212121),
      appBar: AppBar(
        backgroundColor: Color(0xff212121),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      body: ListView(
        // physics: const AlwaysScrollableScrollPhysics(),
        // shrinkWrap: true,
        children: <Widget>[
          //TODO get the right amount of websites and apps
          _appsAndWebsitesCard(),
          _appWebCardWindow(
              "Web-sites that share your information (${data.offFacebookActivity.length})"),
          _appWebCardWindow(
              "Apps that share your information (${data.offFacebookActivity.length})"),

          OverviewInsightCard(InsightsArguments(args.insights))
        ],
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.18,
            child: DrawerHeader(
              margin: EdgeInsets.all(0),
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Color(0xff212121),
              ),
            ),
          ),

          // height: 99999,
          // decoration: BoxDecoration(
          //   color: Color(0xff212121),
          // ),

     
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 0),
              children: <Widget>[
                  ListTile(
                    tileColor: Color(0xff212121),
                    title: Text('How to delete data from Facebook?'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/how_to_del');
                    },
                  ),
                
                ListTile(
                  tileColor: Color(0xff212121),
                  title: Text('Feedback'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: Text('Authors'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: Text('Licenses'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
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
    if (firstInit == 1) {
      subtitle = _subtitleAppWebWindow(data, sortedData);
      firstInit--;
    }
    //TODO Let the tile take up the whole screen when expanded (user should still be able to scroll to other tiles) and collapse other tiles
    return Theme(
      data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.white, accentColor: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTileTheme(
          dense: true, //TODO See if this needs to be here
          contentPadding: EdgeInsets.symmetric(horizontal: 4),
          child: ExpansionTile(
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            onExpansionChanged: (state) {
              setState(() {
                subtitle =
                    state ? null : _subtitleAppWebWindow(data, sortedData);
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
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          )),
                      child: ListTile(
                        leading: Image(
                          image: AssetImage('assets/images/3_todo.png'),
                          width: 44,
                          height: 44,
                        ),
                        title: Text(
                          sortedData.offFacebookActivity[index].name,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          sortedData.offFacebookActivity[index].events.length
                                  .toString() +
                              ' Events',
                          style: TextStyle(color: Colors.white),
                        ),
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
    var tileWidth = [3, 3, 3, 6, 3, 3, 3, 3, 3, 3, 3, 3];
    var tileHeight = [2, 3, 1, 1, 2, 1, 1, 1, 1, 2, 2, 3];

    return Theme(
      data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.white, accentColor: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTileTheme(
          dense: true, //TODO See if this needs to be here
          contentPadding: EdgeInsets.symmetric(horizontal: 4),
          child: ExpansionTile(
            title: Text(
              "What do we understand from your data",
              style: TextStyle(color: Colors.white),
            ),
            // onExpansionChanged: (state){
            // setState(() {
            //   subtitle = state ? null : _subtitle(data, sortedData);
            // });
            // },
            subtitle: _subtitleInsightCard(tileWidth, tileHeight),
            children: <Widget>[
              StaggeredGridView.countBuilder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 6,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) => new Container(
                  // color: Colors.green,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      )),
                  child: new Center(
                    child: new CircleAvatar(
                      backgroundColor: Colors.white,
                      child: new Text('$index'),
                    ),
                  ),
                ),
                staggeredTileBuilder: (int index) => StaggeredTile.count(
                    tileWidth[index + 4], tileHeight[index + 4]),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

OFAjson sortData(OFAjson data) {
  data.offFacebookActivity
      .sort((a, b) => b.events.length.compareTo(a.events.length));
  return data;
}

ListView _subtitleAppWebWindow(data, sortedData) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: (data.offFacebookActivity.length > 2)
        ? 2
        : data.offFacebookActivity.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: Colors.white,
                width: 1,
              )),
          child: ListTile(
              leading: Image(
                image: AssetImage('assets/images/3_todo.png'),
                width: 44,
                height: 44,
              ),
              title: Text(sortedData.offFacebookActivity[index].name,
                  style: TextStyle(color: Colors.white)),
              subtitle: Text(
                sortedData.offFacebookActivity[index].events.length.toString() +
                    ' Events',
                style: TextStyle(color: Colors.white),
              )),
        ),
      );
    },
  );
}

StaggeredGridView _subtitleInsightCard(tileWidth, tileHeight) {
  return StaggeredGridView.countBuilder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 6,
    itemCount: 4,
    itemBuilder: (BuildContext context, int index) => new Container(
      // color: Colors.green,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Colors.white,
            width: 2,
          )),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ),
    ),
    staggeredTileBuilder: (int index) =>
        StaggeredTile.count(tileWidth[index], tileHeight[index]),
    mainAxisSpacing: 10.0,
    crossAxisSpacing: 10.0,
  );
}
