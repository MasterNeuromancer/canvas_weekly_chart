import 'dart:math';

import 'package:flutter/material.dart';

import 'weekly_chart.dart';

Random rng = Random();
void main() {
  var data = [];
  for (var i = 0; i < 100; i++) {
    data.add(rng.nextDouble() * 100);
  }

  runApp(MyApp(data));
}

class MyApp extends StatelessWidget {
  final List data;
  MyApp(this.data);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Week Chart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeeklyChart(data),
    );
  }
}
