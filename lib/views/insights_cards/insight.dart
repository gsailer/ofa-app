import 'package:flutter/material.dart';

abstract class InsightsCard extends StatelessWidget {
  final String insightKey = "base-insight";
  // enables conditional rendering based on
  // the value of the insight according to data quality
  bool _visible = true;
}
