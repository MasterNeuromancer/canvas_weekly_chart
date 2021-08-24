import 'package:flutter/material.dart';

class MyCanvas extends CustomPainter {
  var weekData = [];
  // MyCanvas();
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white;
    canvas.drawPaint(paint);
    var center = Offset(size.width / 2, size.height / 2);
    drawFrame(canvas, center);
    drawChart(canvas, center);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double W = 600.0;
  void drawFrame(Canvas canvas, Offset center) {
    var rect = Rect.fromCenter(center: center, width: W, height: W);
    // fill rect
    var bg = Paint()..color = Color(0xfff2f3f0);
    canvas.drawRect(rect, bg);
    // draw border
    var border = Paint()
      ..color = Colors.black45
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;
    canvas.drawRect(rect, border);
  }

  double chartW = 500.0;
  double chartH = 150.0;
  void drawChart(Canvas canvas, Offset center) {
    Rect rect = Rect.fromCenter(center: center, width: chartW, height: chartH);
    Paint chBorder = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    Paint dpPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;
    // draw chart borders
    drawChartBorder(canvas, chBorder, rect);
    // draw data points
    drawDataPoints(canvas, dpPaint, rect);
    // draw chart guides and labels
    drawChartGuides(canvas, chBorder, rect);
  }

  void drawChartBorder(Canvas canvas, Paint chBorder, Rect rect) {
    canvas.drawRect(rect, chBorder);
  }

  void drawChartGuides(Canvas canvas, Paint chBorder, Rect rect) {
    var x = rect.left;
    var colW = chartW / 6.0;
    for (var i = 0; i < 7; i++) {
      var p1 = Offset(x, rect.bottom);
      var p2 = Offset(x, rect.top);
      canvas.drawLine(p1, p2, chBorder);
      x += colW;
    }
  }

  void drawDataPoints(Canvas canvas, Paint dpPaint, Rect rect) {
    var startX = rect.left;
    var startY = rect.bottom;
    var p = Path();
    p.moveTo(startX, startY);
    weekData.forEach((element) {
      // add points to the path
    });

    // close the path
    canvas.drawPath(p, dpPaint);
  }
}
