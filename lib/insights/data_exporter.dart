import "package:collection/collection.dart";

import 'package:ofa_v0/insights/insight.dart';
import 'package:ofa_v0/repositories.dart';

class DataExporter extends Insight {
  @override
  String get insightKey => "data-export";

  @override
  calcInsight(DFRepository dataframe, INRepository insightsRepo) {
    var tmp = {};
    var dataset = {};
    var dataByEmittent =
        groupBy(dataframe.getDataframe().rows, (row) => row['site']);
    for (var entry in dataByEmittent.entries) {
      tmp[entry.key] = groupBy(entry.value, (e) => e['event']);
    }
    for (var site in tmp.entries) {
      dataset[site.key] = {};
      for (var eventType in tmp[site.key].entries) {
        dataset[site.key][eventType.key] = eventType.value.length;
      }
    }
    insightsRepo.addInsight(insightKey, dataset);
  }
}
