import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ofa_v0/views/insights_cards/insight.dart';
import 'package:ofa_v0/views/loadingjson.dart';

class OverviewInsightCard extends InsightsCard {
  final String insightKey = "overview-insight";
  final InsightsArguments insightsArguments;

  OverviewInsightCard(this.insightsArguments);

  @override
  Widget build(BuildContext context) {
    var data = this.insightsArguments.insights.getInsight(insightKey);
    return Container(
        color: Colors.white,
        child: Center(
          child: Text(data["websites"].toString()),
        ));
  }
}
