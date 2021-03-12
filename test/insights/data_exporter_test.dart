import 'package:ofa_v0/insights/data_exporter.dart';
import 'package:ofa_v0/repositories.dart';
import 'package:test/test.dart';

import '../repository_test.dart';

void main() {
  test("Data export works", () {
    DFRepository repository = new DFRepository(ofaData());
    INRepository insights = new INRepository();
    DataExporter de = new DataExporter();
    de.calcInsight(repository, insights);
    expect(insights.getInsight(de.insightKey), isNotNull);
    expect(
        insights.getInsight(de.insightKey)[
            'Tinder - Dating, Make Friends and Meet New People']['CUSTOM'],
        equals(43));
  });
}
