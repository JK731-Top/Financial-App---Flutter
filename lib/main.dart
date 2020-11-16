import 'package:finance_charts/testpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'config/config_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Financial Charts",
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: TestPage(),
    );
  }
}