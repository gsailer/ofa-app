import 'dart:math';

/// Donut chart with labels example. This is a simple pie chart with a hole in
/// the middle.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DonutAutoLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutAutoLabelChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 80,
            startAngle: -pi/2 + 0.05,
            arcRendererDecorators: [new charts.ArcLabelDecorator(
                 insideLabelStyleSpec: new charts.TextStyleSpec(
                   color: charts.MaterialPalette.black,
                   fontSize: 13
                   ),
                 outsideLabelStyleSpec: new charts.TextStyleSpec(
                   color: charts.MaterialPalette.white,
                   fontSize: 12
                   )),
                   ]
                   ));
  }
}