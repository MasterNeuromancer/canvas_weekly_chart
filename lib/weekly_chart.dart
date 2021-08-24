import 'package:canvas_weekly_chart/my_canvas.dart';
import 'package:flutter/material.dart';

class WeeklyChart extends StatefulWidget {
  @override
  _WeeklyChartState createState() => _WeeklyChartState();
}

class _WeeklyChartState extends State<WeeklyChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        child: Container(),
        painter: MyCanvas(),
      ),
    );
  }
}
