import 'package:df/df.dart';
import 'package:ofa_v0/insights/insight.dart';
import 'package:ofa_v0/repositories.dart';
import "package:collection/collection.dart";

class OverviewInsight extends Insight {
  final String insightKey = "overview-insight";
  calcInsight(DFRepository repository, INRepository insightsRepo) {
    DataFrame df = repository.getDataframe();
    Map<String, List<Map<String, dynamic>>> data = {
      "apps": <Map<String, dynamic>>[],
      "websites": <Map<String, dynamic>>[],
    };
    /* {
      name: bla,
      count: 42,
      events: [{timestamp, type}]
    }
    */

              // cast lists correctly
    List<Map<String, dynamic>> apps = data["apps"];
    List<Map<String, dynamic>> websites = data["websites"];

    for (var row in df.rows) {
      // differentiate apps and websites by marker in df
      if (row["app"]) {
        // check that counts and events are incremented
        if (apps.any((element) => element["name"] == row["site"])) {
          Map<String, dynamic> app =
              apps.firstWhere((element) => element["name"] == row["site"]);
          app["count"] += 1;
          app["events"]
              .add({"timestamp": row["timestamp"], "type": row["event"]});
        } else {
          apps.add({
            "name": row["site"],
            "count": 1,
            "events": [
              {"timestamp": row["timestamp"], "type": row["event"]}
            ]
          });
        }
      } else {
        if (websites.any((element) => element["name"] == row["site"])) {
          Map<String, dynamic> website =
              websites.firstWhere((element) => element["name"] == row["site"]);
          website["count"] += 1;
          website["events"]
              .add({"timestamp": row["timestamp"], "type": row["event"]});
        } else {
          websites.add({
            "name": row["site"],
            "count": 1,
            "events": [
              {"timestamp": row["timestamp"], "type": row["event"]}
            ]
          });
        }
      }
    }

    int counter = 0;
    for (Map<String, dynamic> app in apps) {

      app["events_by_type"] =
        groupBy(app["events"], (event) => event["type"]);

      print("\n");
      print(app["name"]);
      print(app["events_by_type"]);
    }
    

    insightsRepo.addInsight(insightKey, data);
  }
}
