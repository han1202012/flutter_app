import 'package:flutter/material.dart';

/// 个人设置界面
class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    /// 界面框架
    return Scaffold(
      /// 居中组件
      body: Center(
        child: Text("个人设置页面"),
      ),
    );
  }
}
