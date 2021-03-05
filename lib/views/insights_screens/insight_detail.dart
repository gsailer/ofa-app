import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ofa_v0/views/widgets/events_pie_chart.dart';

class InsightDetail extends StatefulWidget {
  final Map<String, dynamic> element;

  InsightDetail({Key key, @required this.element}) : super(key: key);

  _InsightDetailState createState() => _InsightDetailState();
}

class _InsightDetailState extends State<InsightDetail> {
  List<charts.Series<EventRatio, String>> _seriesPieData;
  _generateData() {
    // TODO: better mechanism for colors
    //hier zu jedem event ein festen color damit es einheitlich bleibt zwischen den apps/websites
    List<Color> eventColor = [
      Colors.red,
      Colors.orange,
      Colors.pink,
      Colors.green,
    	Colors.blue
    ];

    List<EventRatio> pieData =
        Map<String, List<dynamic>>.from(widget.element["events_by_type"])
            .keys
            .map((String eventType) => new EventRatio(eventType,
                widget.element["events_by_type"][eventType].length, Colors.purple))
            .toList();

    for (var i = 0; i<pieData.length; i++){
      pieData[i].color = eventColor[i];
    }
    _seriesPieData.add(
      charts.Series(
          data: pieData,
          domainFn: (EventRatio eventRatio, _) => eventRatio.event,
          measureFn: (EventRatio eventRatio, _) => eventRatio.count,
          colorFn: (EventRatio eventRatio, _) =>
              charts.ColorUtil.fromDartColor(eventRatio.color),
          id: "Test"),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = [];
    _generateData();
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
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  kToolbarHeight,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Detailed data:",
                        style: TextStyle(
                          //TODO: change font to Russo One
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(element["name"].toString() + " has tracked " + element["count"].toString() + " of your events "
                  //       ),
                  // ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: widget.element["name"].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFFECB02D),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' has provided ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              TextSpan(
                                text: widget.element["count"].toString(),
                              ),
                              TextSpan(
                                  text: ' of your events',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Container(
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Event ratio:")),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.width * 0.9,
                              child: DonutAutoLabelChart(_seriesPieData)),
                        ],
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
}

class EventRatio {
  String event;
  int count;
  Color color;

  EventRatio(this.event, this.count, this.color);
}
