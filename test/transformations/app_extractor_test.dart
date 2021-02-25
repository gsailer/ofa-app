import 'package:ofa_v0/repositories.dart';
import 'package:ofa_v0/transformations/appExtractor.dart';
import 'package:test/test.dart';

import '../repository_test.dart';

void main() {
  test("App extraction works", () {
    DFRepository repository = new DFRepository(ofaData());
    AppExtractor ae = new AppExtractor();
    ae.calcTransformation(repository);
    RegExp isWebsite = new RegExp(r"\.[a-z]+?");
    for (var row in repository.getDataframe().rows) {
      expect(row["app"], equals(!isWebsite.hasMatch(row["site"])));
    }
  });
}
