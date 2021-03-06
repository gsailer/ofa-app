import 'dart:ui';

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
      Colors.green,
      Colors.red,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.pink,
    ];

    List<EventRatio> pieData =
        Map<String, List<dynamic>>.from(widget.element["events_by_type"])
            .keys
            .map((String eventType) => new EventRatio(
                eventType,
                widget.element["events_by_type"][eventType].length,
                Colors.purple))
            .toList();

    for (var i = 0; i < pieData.length; i++) {
      pieData[i].color = eventColor[i];
    }
    _seriesPieData.add(
      charts.Series(
          labelAccessorFn: (EventRatio eventRatio, _) =>
              '${eventRatio.event}: ${eventRatio.count}',
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
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            kToolbarHeight,
        child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Container(
              //TODO: auto adjust height depending on phone size (prevent overflow error on small/big devices"

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
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10.0),
                            //     border: Border.all(color: Colors.white)),
                            child: Row(
                              children: [
                                Expanded(
                                  // alignment: Alignment.topLeft,
                                  child: Text("Event ratio:"),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.help_outline_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _eventExplain();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.0),
            //     border: Border.all(color: Colors.white)),
            child: SizedBox(
                width: MediaQuery.of(context).size.width *0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                child: DonutAutoLabelChart(_seriesPieData)),
          ),
        ]),
      ),
    );
  }

  void _eventExplain() {
    List<Map<String, dynamic>> events;
    widget.element.forEach((key, value) {
      if (key == "events") {
        events = value;
      }
    });

    List<Map<String, dynamic>> definitions = [
      {
        "type": "CUSTOM",
        "description":
            ": this could be all sorts of event. Facebook doesn't provide further information."
      },
      {
        "type": "LEVEL_ACHIEVED",
        "description": ": you achieved some type of level or progress."
      },
      {
        "type": "RESULT_SENT",
        "description":
            ": Facebook doesn't provide further information on this event"
      },
      {
        "type": "ACTIVATE_APP",
        "description": ": shows you when you opened the app or website."
      },
      {"type": "LEAD", "description": ": you completed a sign up."},
      {
        "type": "PAGE_VIEW",
        "description": ": you landed on a page on this website or app."
      },
      {
        "type": "COMPLETE_REGISTRATION",
        "description": ": you completed a registration form."
      },
      {
        "type": "AD_REQUEST",
        "description":
            ": Facebook doesn't provide further information on this event"
      },
      {
        "type": "SPENT_CREDITS",
        "description": ": you spent credits in this app or website"
      },
      {
        "type": "TOSIMPRESSION",
        "description":
            ": Facebook doesn't provide further information on this event"
      },
      {"type": "AD_CLICK", "description": ": you clicked on an add."},
      {
        "type": "CONTACT",
        "description":
            ": you initiated contact with the apps or websites business via telephone, SMS, email, chat, etc."
      },
      {
        "type": "PURCHASE",
        "description": ": you made a purchase or completed a checkout flow."
      },
      {
        "type": "SEARCH",
        "description": ": you made a search in the app or website."
      },
      {
        "type": "START_TRIAL",
        "description": ": you started a free trial of a product or service."
      },
      {
        "type": "ADD_PAYMENT_INFO",
        "description": ":  you added payment information during a checkout process."
      },
      {
        "type": "ADD_TO_CART",
        "description": ": you added an item to a shopping cart or basket"
      },
      {
        "type": "ADD_TO_WISHLIST",
        "description": ": you added items to a wishlist."
      },
      {
        "type": "CUSTOMIZE_PRODUCT",
        "description": ": you customized products through a configuration tool or other application your business owns."
      },
      {
        "type": "DONATE",
        "description": ": you donated funds to an organization or cause."
      },
      {
        "type": "FIND_LOCATION",
        "description": ": you searched for the location of the store via a website or app"
      },
      {
        "type": "INITIATE_CHECKOUT",
        "description": ": you started a checkout process."
      },
      {
        "type": "SCHEDULE",
        "description": ": you booked an appointment to visit one of the apps or websites locations."
      },
      {
        "type": "SUBMIT_APPLICATION",
        "description": ": you submitted an application for a product, service or program the app or website offers."
      },
      {
        "type": "SUBSCRIBE",
        "description": ": you started a paid subscription for a product or service the app or website offers."
      },
      {
        "type": "VIEW_CONTENT",
        "description": ":  you visited a web page you care about."
      },
      {
        "type": "START_TRIAL",
        "description": ": you started a free trial of a product or service."
      },
      {
        "type": "START_TRIAL",
        "description": ": you started a free trial of a product or service."
      },


    ];

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  Container(
                    // padding:
                    //     EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                    // margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        // shape: BoxShape.rectangle,
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.white,
                        //       offset: Offset(0, 0),
                        //       blurRadius: 10),
                        // ]
                        ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "What do these events mean?:",
                            style: TextStyle(fontSize: 23),
                          ),
                        ),

                        for (Map<String, dynamic> def in definitions)
                          if (events
                              .any((element) => element["type"] == def["type"]))
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: RichText(
                                text: TextSpan(
                                    text: def["type"].toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFECB02D),
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: def["description"].toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ]),
                              ),
                            ),

                        // if (events
                        //     .any((element) => element["type"] == "RESULT_SENT"))
                        //   Text("RESULT_SENT"),

                        // if (events.any((element) => element["type"] == "LEAD"))
                        //   Text("LEAD" + ": you completed a sign up."),

                        // if (events
                        //     .any((element) => element["type"] == "PAGE_VIEW"))
                        //   Text("PAGE_VIEW" +
                        //       ": you landed on a page on this website or app."),

                        // if (events.any((element) =>
                        //     element["type"] == "COMPLETE_REGISTRATION"))
                        //   Text("COMPLETE_REGISTRATION" +
                        //       ": you completed a registration form."),

                        // if (events
                        //     .any((element) => element["type"] == "AD_REQUEST"))
                        //   Text("AD_REQUEST")

                        // if (events.any(
                        //     (element) => element["type"] == "SPENT_CREDITS"))
                        //   Text("SPENT_CREDITS" +
                        //       ": you spent credits in this app or website"),

                        // if (events.any(
                        //     (element) => element["type"] == "TOSIMPRESSION"))
                        //   Text("TOSIMPRESSION")

                        // if (events
                        //     .any((element) => element["type"] == "AD_CLICK"))
                        //   Text("AD_CLICK" + ": you clicked on an add."),

                        // if (events
                        //     .any((element) => element["type"] == "CONTACT"))
                        //   Text("CONTACT" +
                        //       ": you initiated contact with the apps or websites business via telephone, SMS, email, chat, etc."),

                        // if (events
                        //     .any((element) => element["type"] == "PURCHASE"))
                        //   Text("PURCHASE" +
                        //       ": you made a purchase or completed a checkout flow."),

                        // if (events
                        //     .any((element) => element["type"] == "SEARCH"))
                        //   Text("SEARCH" +
                        //       ": you made a search in the app or website."),

                        // if (events
                        //     .any((element) => element["type"] == "START_TRIAL"))
                        //   Text("START_TRIAL" +
                        //       ": you started a free trial of a product or service."),

                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).buttonColor,
                                  primary: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Got it",
                                  // style: TextStyle(fontSize: 18),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class EventRatio {
  String event;
  int count;
  Color color;

  EventRatio(this.event, this.count, this.color);
}
