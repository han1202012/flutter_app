import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 应用主界面
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    "https://img-blog.csdnimg.cn/20210401205234582.png",
    "https://img-blog.csdnimg.cn/20210401205307863.png",
    "https://img-blog.csdnimg.cn/20210401205249606.png"
  ];

  /// 顶层透明度组件的透明度
  double appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    /// 界面框架
    return Scaffold(

      /// 帧布局组件 , 前面的元素在下层 , 后面的元素在上层
      body: Stack(
        children: <Widget>[

          /// 消除顶部空白的组件
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            // 使用 NotificationListener 组件 , 监听列表的滚动
            child: NotificationListener(
              // 监听滚动的方法
              onNotification: (scrollNotification){

                // scrollNotification.depth == 0 指的是深度为 0 的元素
                //    即 ListView 元素滚动时 , 才触发滚动
                if(scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {

                  // 从 scrollNotification 中获取滚动参数
                  print("滚动距离 ${scrollNotification.metrics.pixels}");

                  // 滚动距离在 0 ~ 100 之间时
                  //    透明度组件透明度从 0 ~ 1 变化
                  //    如果滚动距离 >= 100 , 则透明度组件为 1

                  double alpha = scrollNotification.metrics.pixels / 100.0;

                  // 处理小于 0 和 大于 1 极端情况
                  // 如果只处于 0 ~ 1 之间 , 不做处理
                  if (alpha < 0) {
                    alpha = 0;
                  } else if (alpha > 1) {
                    alpha = 1;
                  }

                  // 更新 UI 数据
                  setState(() {
                    appBarAlpha = alpha;
                  });

                }
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    /// 设置 Banner 轮播图 160 像素
                    height: 160,
                    /// 这是 flutter_swiper 插件的轮播图
                    child: Swiper(
                      /// 轮播图数量
                      itemCount: _imageUrls.length,

                      /// 设置轮播图自动播放
                      autoplay: true,

                      /// 轮播条目组件
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          /// 图片 URL 链接
                          _imageUrls[index],
                          /// 缩放方式
                          fit: BoxFit.fill,
                        );
                      },

                      /// 轮播图指示器
                      pagination: SwiperPagination(),

                    ),
                  ),

                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text("标题透明渐变"),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 透明度可变组件
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("标题透明渐变"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
