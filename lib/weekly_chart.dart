import 'dart:ffi';
import 'dart:math';

import 'package:canvas_weekly_chart/my_canvas.dart';
import 'package:flutter/material.dart';

class WeeklyChart extends StatefulWidget {
  final List data;
  WeeklyChart(this.data);
  @override
  _WeeklyChartState createState() => _WeeklyChartState();
}

class _WeeklyChartState extends State<WeeklyChart> {
  var weekData = [];
  double minD = double.maxFinite;
  double maxD = -double.maxFinite;
  double rangeD = 1.0;
  @override
  void initState() {
    super.initState();

    widget.data.take(7).forEach((d) {
      minD = d < minD ? d : minD;
      maxD = d > maxD ? d : maxD;
    });
    rangeD = maxD - minD;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        child: Container(),
        painter: MyCanvas(weekData, minD, maxD, rangeD),
      ),
    );
  }
}
