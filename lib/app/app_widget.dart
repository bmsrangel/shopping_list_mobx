import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQueryData.fromWindow(window).size.height;
    print(height);
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          subtitle: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
          title: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal,
          ),
          subhead: TextStyle(
            fontSize: 15.5,
            color: Colors.grey,
          ),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
