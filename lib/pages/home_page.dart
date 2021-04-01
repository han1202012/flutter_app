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

  @override
  Widget build(BuildContext context) {
    /// 界面框架
    return Scaffold(
      /// 居中组件
      body: Center(
        child: Column(
          children: [
            Container(
              /// 设置 Banner 轮播图 160 像素
              height: 200,
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
          ],
        ),
      ),
    );
  }
}
