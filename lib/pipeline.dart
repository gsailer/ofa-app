import 'package:ofa_v0/insights/data_exporter.dart';
import 'package:ofa_v0/insights/overview_insight.dart';
import 'package:ofa_v0/insights/insight.dart';
import 'package:ofa_v0/repositories.dart';
import 'package:ofa_v0/transformations/app_extractor.dart';
import 'package:ofa_v0/transformations/transformation.dart';

class Pipeline {
  List<Transformation> transformations;
  List<Insight> insights;
  INRepository insightsRepo;
  DFRepository dataframeRepo;

  Pipeline(INRepository insightsData, DFRepository dataframe) {
    this.dataframeRepo = dataframe;
    this.insightsRepo = insightsData;
    // tranformations
    AppExtractor appExtractor = new AppExtractor();

    // insights
    OverviewInsight overviewInsight = new OverviewInsight();
    DataExporter dataExporter = new DataExporter();

    // register new transformations and insights here
    this.transformations = [appExtractor];
    this.insights = [overviewInsight, dataExporter];
  }

  trigger() {
    for (Transformation t in transformations) {
      t.calcTransformation(dataframeRepo);
    }

    for (Insight i in insights) {
      i.calcInsight(dataframeRepo, insightsRepo);
    }
    insightsRepo.persist();
  }
}
