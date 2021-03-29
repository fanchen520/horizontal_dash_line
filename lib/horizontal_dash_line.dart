library horizontal_dash_line;

import 'package:flutter/material.dart';

// 自定义虚线组件
class HorizontalDashLine extends StatelessWidget {
  final Color dashColor;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  const HorizontalDashLine({
    Key key,
    this.dashWidth = 5,
    this.dashSpace = 5,
    this.strokeWidth = 2,
    this.dashColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // size：当child为null时，代表默认绘制区域大小，如果有child则忽略此参数，画布尺寸则为child尺寸
      size: Size(MediaQuery.of(context).size.width, 1),
      painter: MyPainter(
          dashWidth: dashWidth,
          dashSpace: dashSpace,
          strokeWidth: strokeWidth,
          dashColor: dashColor),
    );
  }
}

class MyPainter extends CustomPainter {
  final Color dashColor;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  const MyPainter({
    this.dashWidth = 5,
    this.dashSpace = 5,
    this.strokeWidth = 2,
    this.dashColor = Colors.black,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint() // 创建一个画笔并配置其属性
      ..strokeWidth = strokeWidth // 画笔的宽度
      ..isAntiAlias = true // 是否抗锯齿
      ..color = dashColor;

    final double max = size.width; // size获取到宽度
    // const double dashWidth = 5;
    // const double dashSpace = 5;
    double startX = 0;
    final double space = dashWidth + dashSpace;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
