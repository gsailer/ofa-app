import 'package:flutter/material.dart';
import 'package:ofa_v0/json_parser.dart';
// import 'package:ofa_v0/views/more_websites.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ofa_v0/views/insights_cards/overview_insights_card.dart';
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
      drawer: Container(
          width: MediaQuery.of(context).size.width * 0.8, child: _drawer()),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/delete_confirm');
        },
        child: Icon(Icons.navigation),
        backgroundColor: Color(0xFFE93A68),
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
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Color(0xff212121),
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top) *
                0.16,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Menu',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),

              // ),
            ),
          ),

          // height: 99999,
          // decoration: BoxDecoration(
          //   color: Color(0xff212121),
          // ),

          Container(
            //TODO auto fill height
            height: MediaQuery.of(context).size.height -
                ((MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.16),
            color: Color(0xff212121),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: Row(
                    children: <Widget>[
                      ImageIcon(
                        AssetImage("assets/icons/delete.png"),
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text(
                        'How to delete your data from Facebook?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/how_to_del');
                  },
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
                      ImageIcon(
                        AssetImage("assets/icons/feedback.png"),
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text(
                        'Feedback',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {
                    //TODO
                    Navigator.pushNamed(context, '/how_to_del');
                  },
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
                      ImageIcon(
                        AssetImage("assets/icons/authors.png"),
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text(
                        'Authors',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {
                    //TODO
                    Navigator.pushNamed(context, '/authors');
                  },
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
                      ImageIcon(
                        AssetImage("assets/icons/licenses.png"),
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text(
                        'Licenses',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {
                    //TODO
                    Navigator.pushNamed(context, '/how_to_del');
                  },
                ),
              ],
            ),
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
