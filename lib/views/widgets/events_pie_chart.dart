import 'dart:math';

/// Donut chart with labels example. This is a simple pie chart with a hole in
/// the middle.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:charts_common/common.dart' as common
  show LayoutConfig,
        MarginSpec;

class DonutAutoLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutAutoLabelChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
    layoutConfig: new charts.LayoutConfig(
      leftMarginSpec: common.MarginSpec.fixedPixel(0), 
      topMarginSpec: common.MarginSpec.fixedPixel((MediaQuery.of(context).size.width * 0.03).round()), 
      rightMarginSpec: common.MarginSpec.fixedPixel(0), 
      bottomMarginSpec: common.MarginSpec.fixedPixel(0),
      // (MediaQuery.of(context).size.width * 0.35).round()
    ),
    
    
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(

            strokeWidthPx: 1,
            arcWidth: 20,
            startAngle: -pi / 2 + 0.05,
            // arcRatio: 0.5,
            arcRendererDecorators: [
              new charts.ArcLabelDecorator(

                labelPadding: 1,
                leaderLineStyleSpec: charts.ArcLabelLeaderLineStyleSpec(

                  length: 8,
                  thickness: 1,
                  color: charts.ColorUtil.fromDartColor(Colors.white),
                ),
                  labelPosition: charts.ArcLabelPosition.outside,
                  insideLabelStyleSpec: new charts.TextStyleSpec(
                    lineHeight: 10,
                      color: charts.MaterialPalette.black, fontSize: 13),
                  outsideLabelStyleSpec: new charts.TextStyleSpec(
                    lineHeight: 1,
                      color: charts.MaterialPalette.white, fontSize: 12)),
            ]));
  }
}
