class DFRepository {
  //Dataframe
  final df = new Map();

  DFRepository(jsonEvents) {
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
