import 'package:df/df.dart';

class DFRepository {
  DataFrame df;

  DFRepository(jsonEvents) {
    var rows = new Map();
    df = DataFrame.fromRows(rows);
    // create dataframe from jsonEvents
  }

  getDataframe() {}
  addColumn() {}
}

class INRepository {
  Map store;

  INRepository() {
    store = new Map();
  }

  addInsight(key) {}
  getInsight(key) {}
  persist() {}
  loadFromFS(path) {}
}
