import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ofa_v0/views/insights_cards/insight.dart';
import 'package:ofa_v0/views/insights_screens/insight.dart';
import 'package:ofa_v0/views/insights_screens/insight_detail.dart';
import 'package:ofa_v0/views/loadingjson.dart';
import 'package:provider/provider.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class OverviewInsightCard extends InsightsCard {
  final String insightKey = "overview-insight";
  final InsightsArguments insightsArguments;

  OverviewInsightCard(this.insightsArguments);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        this.insightsArguments.insights.getInsight(insightKey);
    List<dynamic> apps = data["apps"];
    List<dynamic> websites = data["websites"];

    return ListView(
      // physics: const AlwaysScrollableScrollPhysics(),
      // shrinkWrap: true,
      children: <Widget>[
        GestureDetector(
            onTap: () => _activateFilter(context),
            child: Center(
                child: Text(
                    '${Provider.of<FilterState>(context).startTime.toString()} - ${Provider.of<FilterState>(context).endTime.toString()}'))),
        _detailElements(apps, context, "Apps"),
        _detailElements(websites, context, "Websites"),
      ],
    );
  }

  void _activateFilter(BuildContext context) async {
    DateTime startTime =
        Provider.of<FilterState>(context, listen: false).startTime;
    DateTime endTime = Provider.of<FilterState>(context, listen: false).endTime;

    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: startTime,
        initialLastDate: endTime,
        firstDate: new DateTime(2004),
        lastDate: new DateTime.now());
    if (picked != null && picked.length == 2) {
      Provider.of<FilterState>(context, listen: false)
          .setTimes(picked[0], picked[1]);
    }
  }

  bool _filterTime(BuildContext context, Map<String, dynamic> element) {
    DateTime startTime = Provider.of<FilterState>(context).startTime;
    DateTime endTime = Provider.of<FilterState>(context).endTime;

    //speed up check with min / max check?
    return List<Map<String, dynamic>>.from(element['events'])
        .map((event) => DateTime.fromMillisecondsSinceEpoch(
            ((event['timestamp'] as int) * 1000)))
        .any((time) => (startTime.isBefore(time) && endTime.isAfter(time)));
  }

  Widget _detailElements(
      List<dynamic> elements, BuildContext context, String type) {
    var tileData = List.from(elements);
    // sort apps by number of events
    tileData.sort((a, b) => (b["count"] as int).compareTo(a["count"] as int));
    tileData = List<Map<String, dynamic>>.from(
        tileData.where((element) => _filterTime(context, element)));

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
              "$type that share your information (${tileData.length})",
              style: TextStyle(color: Colors.white),
            ),
            children: <Widget>[
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: (tileData.length > 0) ? tileData.length : 0,
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  InsightDetail(element: tileData[index]),
                            ),
                          );
                        },
                        leading: Image(
                          image: AssetImage('assets/images/3_todo.png'),
                          width: 44,
                          height: 44,
                        ),
                        title: Text(
                          tileData[index]["name"],
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          tileData[index]["count"].toString() + ' Events',
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
}

class FilterState extends ChangeNotifier {
  DateTime startTime = new DateTime(2004);
  DateTime endTime = new DateTime.now();
  int numberOfEvents;

  FilterState({this.startTime, this.endTime, this.numberOfEvents});

  void setTimes(DateTime start, DateTime end) {
    this.startTime = start;
    this.endTime = end;
    notifyListeners();
  }

  void setNumberOfEvent(int num) {
    this.numberOfEvents = num;
    notifyListeners();
  }

  void incrementNumberOfEvents() {
    this.numberOfEvents++;
    notifyListeners();
  }
}
