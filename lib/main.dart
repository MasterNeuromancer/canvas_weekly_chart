import 'package:flutter/material.dart';

import 'weekly_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Week Chart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeeklyChart(),
    );
  }
}
