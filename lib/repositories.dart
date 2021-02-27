import 'dart:convert';
import 'dart:io';

import 'package:df/df.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ofa_v0/json_parser.dart';

final log = Logger('Repositories');
const String INSIGHTS_STORAGE_NAME = "ofa-insights.json";

/// Dataframe Repository
///
/// A wrapper for the central working dataframe.
/// Insights are generated on the basis of this
/// augmented dataset.
class DFRepository {
  DataFrame df;

  /// Initiates a new Dataframe based on a OFAjson object,
  /// which results from parsing the raw json available
  /// in the FB data archive.
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

  /// Adds a new column to the dataframe
  ///
  /// Column names can not be in the following set:
  ///   site, timestamp, event, event_id
  /// Also columns can not be overwritten once they are added.
  ///
  /// Throws an exception in case the col name is already taken.
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

/// Insights Repository
///
/// allows adding generic json-serializable data,
/// which should be accessible to insights widgets.
class INRepository {
  Map<String, dynamic> store;

  INRepository() {
    store = new Map();
  }

  /// Commit new insight data to the store
  ///
  /// The submitted data in the value has to be
  /// json serializable.
  /// Throws an exception, if the key already exists
  /// in the store.
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

  /// Writes the store into a json file in AppDocument Storage.
  persist() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    String path = "${directory.path}/$INSIGHTS_STORAGE_NAME";
    var file = new File(path);
    await file.writeAsString(jsonEncode(store));
  }

  /// Reads data from a json in AppDocument Storage
  /// and instanciates a new store.
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
