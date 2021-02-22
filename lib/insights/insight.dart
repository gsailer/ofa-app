import 'package:ofa_v0/repositories.dart';

abstract class Insight {
  final String insightKey = "base-insight";

  Future<bool> calcInsight(DFRepository dataframe, INRepository insightsRepo);
}
