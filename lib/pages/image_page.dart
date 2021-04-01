import 'package:flutter/material.dart';

/// 图片页面
class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    /// 界面框架
    return Scaffold(
      /// 居中组件
      body: Center(
        child: Text("图片页面"),
      ),
    );
  }
}
