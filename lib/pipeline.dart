import 'package:ofa_v0/insights/insight.dart';
import 'package:ofa_v0/repositories.dart';
import 'package:ofa_v0/transformations/transformation.dart';

class Pipeline {
  List<Transformation> transformations;
  List<Insight> insights;
  INRepository insightsRepo;
  DFRepository dataframeRepo;

  Pipeline(List<Transformation> transformations, List<Insight> insights,
      INRepository insightsData, DFRepository dataframe) {
    this.dataframeRepo = dataframe;
    this.insightsRepo = insightsData;
  }

  trigger() {
    for (Transformation t in transformations) {
      t.calcTransformation(dataframeRepo);
    }

    for (Insight i in insights) {
      i.calcInsight(dataframeRepo, insightsRepo);
    }
  }
}
