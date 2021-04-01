import 'package:flutter/material.dart';

/// 搜索页面
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    /// 界面框架
    return Scaffold(
      /// 居中组件
      body: Center(
        child: Text("搜索页面"),
      ),
    );
  }
}
