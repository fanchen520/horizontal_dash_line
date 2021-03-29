import 'package:flutter/material.dart';
import 'package:horizontal_dash_line/horizontal_dash_line.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dash line Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Dash line Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '满屏虚线',
              style: Theme.of(context).textTheme.headline4,
            ),
            HorizontalDashLine(
              strokeWidth: 1,
              dashColor: Colors.red,
              dashSpace: 6,
              dashWidth: 6,
            ),
            Text(
              '非满屏虚线，跟着空间大小',
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: HorizontalDashLine(
                strokeWidth: 3,
                dashColor: Colors.red,
                dashSpace: 5,
                dashWidth: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
