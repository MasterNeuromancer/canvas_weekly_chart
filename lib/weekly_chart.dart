import 'dart:async';

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
  double percentage = 0.0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    setState(() {
      weekData = widget.data.take(7).toList();
      weekData.forEach((d) {
        minD = d < minD ? d : minD;
        maxD = d > maxD ? d : maxD;
      });
      rangeD = maxD - minD;
    });

    final fps = 50.0;
    final totalAnimDuration = 1.0;
    var percentStep = 1.0 / (totalAnimDuration * fps);
    var frameDuration = (1000 ~/ fps);
    timer = Timer.periodic(Duration(milliseconds: frameDuration), (timer) {
      setState(() {
        percentage += percentStep;
        percentage = percentage > 1.0 ? 1.0 : percentage;
        if (percentage >= 1.0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        child: Container(),
        painter: MyCanvas(weekData, minD, maxD, rangeD, percentage),
      ),
    );
  }
}
