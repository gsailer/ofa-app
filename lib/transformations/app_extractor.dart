import 'package:df/df.dart';
import 'package:ofa_v0/repositories.dart';
import 'package:ofa_v0/transformations/transformation.dart';

/*
  Transfomation to extend the dataset
  on classification of website vs app
*/
class AppExtractor extends Transformation {
  calcTransformation(DFRepository repository) {
    DataFrame df = repository.getDataframe();
    // regex to recognise websites
    RegExp isWebsite = new RegExp(r"\.[a-z]+?");
    List<bool> isApp = [];
    for (var row in df.rows) {
      String name = row["site"];
      if (isWebsite.hasMatch(name)) {
        isApp.add(false);
      } else {
        isApp.add(true);
      }
    }
    repository.addColumn("app", isApp);
  }
}
