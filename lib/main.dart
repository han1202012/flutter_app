import 'package:flutter/material.dart';
import 'package:flutter_app/navigator/main_navigator.dart';

/// 应用主页面
void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainNavigatorWidget(),
    );
  }
}
