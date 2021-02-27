import 'dart:convert';
import 'dart:io';

import 'package:df/df.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ofa_v0/json_parser.dart';

final log = Logger('Repositories');
const String INSIGHTS_STORAGE_NAME = "ofa-insights.json";

class DFRepository {
  DataFrame df;

  DFRepository(OFAjson jsonEvents) {
    List<Map<String, dynamic>> rows = [];
    for (OffFacebookActivity activity in jsonEvents.offFacebookActivity) {
      for (Events e in activity.events) {
        Map<String, dynamic> entry = {
          "site": activity.name,
          "timestamp": e.timestamp,
          "event": e.type,
          "event_id": e.id
        };
        rows.add(entry);
      }
    }
    df = DataFrame.fromRows(rows);
  }

  DataFrame getDataframe() {
    return this.df;
  }

  addColumn(String name, List entries) {
    List<Map<String, dynamic>> rows = this.df.rows.toList();
    if (!rows[0].containsKey(name)) {
      for (var i = 0; i < rows.length; i++) {
        rows[i][name] = entries[i];
      }
      DataFrame newDF = DataFrame.fromRows(rows);
      this.df = newDF;
    } else {
      log.severe("Column name $name is already taken.");
      throw new Exception("Column name $name is already taken.");
    }
  }
}

class INRepository {
  Map<String, dynamic> store;

  INRepository() {
    store = new Map();
  }

  addInsight(String key, dynamic value) {
    // prevent overriding of existing insights
    if (!store.containsKey(key)) {
      store[key] = value;
    } else {
      log.severe("Key $key is already taken.");
      throw new Exception("Key $key is already taken.");
    }
  }

  getInsight(key) {
    return store[key];
  }

  persist() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    String path = "${directory.path}/$INSIGHTS_STORAGE_NAME";
    var file = new File(path);
    await file.writeAsString(jsonEncode(store));
  }

  Future<bool> loadFromFS() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    String path = "${directory.path}/$INSIGHTS_STORAGE_NAME";
    var file = new File(path);
    if (file.existsSync()) {
      var json = jsonDecode(await file.readAsString());
      this.store = json;
      return true;
    } else {
      return false;
    }
  }
}
