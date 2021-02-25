import 'dart:math';

import 'package:ofa_v0/json_parser.dart';
import 'package:ofa_v0/repositories.dart';
import 'package:test/test.dart';
import 'dart:io';
import 'dart:convert';

main() {
  group("DFRepository", () {
    test("init(ofa) creates a df from OFAjson", () {
      DFRepository df = new DFRepository(ofaData());
      expect(df.df.length, greaterThan(1));
    });
    test("is not empty with supplied data", () {
      DFRepository df = new DFRepository(ofaData());
      expect(df.df.subset(0, 10), isNotEmpty);
    });
    test("can add column", () {
      DFRepository df = new DFRepository(ofaData());
      expect(df.getDataframe().columns.length, equals(4));
      List<int> entries = [];
      for (var _ in df.getDataframe().rows) {
        entries.add(42);
      }
      df.addColumn("test", entries);
      expect(df.getDataframe().columns.length, equals(5));
      expect(df.getDataframe().rows.first["test"], equals(42));
    });
  });
  group("INRepository", () {
    test("overriding key not allowed", () {
      INRepository ir = new INRepository();
      final insight = {"value": 42, "sleep": "6"};
      ir.addInsight("test-insight", insight);
      expect(ir.getInsight("test-insight"), equals(insight));
      expect(() => ir.addInsight("test-insight", "foo"), throwsException);
      expect(ir.getInsight("test-insight"), equals(insight));
    });
  });
}

OFAjson ofaData() {
  var file = new File("test/test_resources/ofa_example.json");
  final json = jsonDecode(file.readAsStringSync());
  return OFAjson.fromJson(json);
}
