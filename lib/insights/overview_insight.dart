import 'package:df/df.dart';
import 'package:ofa_v0/insights/insight.dart';
import 'package:ofa_v0/repositories.dart';

class OverviewInsight extends Insight {
  final String insightKey = "overview-insight";
  calcInsight(DFRepository repository, INRepository insightsRepo) {
    DataFrame df = repository.getDataframe();
    Map data = {"apps": {}, "websites": {}};
    /* {
      name: bla,
      count: 42,
      events: [{timestamp, type}]
    }
    */
    for (var row in df.rows) {
      if (row["app"]) {
        if (data["apps"].containsKey(row["site"])) {
          data["apps"][row["site"]]["count"] += 1;
          data["apps"][row["site"]]["events"]
              .add({"timestamp": row["timestamp"], "type": row["event"]});
        } else {
          data["apps"][row["site"]] = {
            "count": 1,
            "events": [
              {"timestamp": row["timestamp"], "type": row["event"]}
            ]
          };
        }
      } else {
        if (data["websites"].containsKey(row["site"])) {
          data["websites"][row["site"]]["count"] += 1;
          data["websites"][row["site"]]["events"]
              .add({"timestamp": row["timestamp"], "type": row["event"]});
        } else {
          data["websites"][row["site"]] = {
            "count": 1,
            "events": [
              {"timestamp": row["timestamp"], "type": row["event"]}
            ]
          };
        }
      }
    }
    insightsRepo.addInsight(insightKey, data);
  }
}
