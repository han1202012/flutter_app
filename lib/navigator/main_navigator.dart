import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/image_page.dart';
import 'package:flutter_app/pages/search_page.dart';
import 'package:flutter_app/pages/setting_page.dart';

/// 应用的主界面组件 , 整个应用的初始根节点
class MainNavigatorWidget extends StatefulWidget {
  @override
  _MainNavigatorWidgetState createState() => _MainNavigatorWidgetState();
}

/// 该类的父类 State 接受一个泛型
/// 泛型类型是 StatefulWidget 类型 TabNavigator
class _MainNavigatorWidgetState extends State<MainNavigatorWidget>
    with SingleTickerProviderStateMixin {
  /// 当前的索引值
  int _currentIndex = 0;

  /// PageView 控制器 , 用于控制 PageView
  var _pageController = PageController(
    /// 初始索引值
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();

    /// 销毁 PageView 控制器
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 根组件
    return Scaffold(
      /// 滑动组件 , 界面的核心元素
      body: PageView(
        /// 控制跳转翻页的控制器
        controller: _pageController,

        /// 页面滑动
        /// 这里设置 PageView 页面滑动也能
        onPageChanged: (index) {
          setState(() {
            // 更新当前的索引值
            _currentIndex = index;
          });
        },

        /// Widget 组件数组 , 设置多个 Widget 组件
        /// 同一时间只显示一个页面组件
        children: [
          HomePage(), // 首页
          ImagePage(), // 图片页
          SearchPage(), // 搜索页
          SettingPage(), // 个人设置页
        ],
      ),

      /// 设置底部导航栏按钮
      bottomNavigationBar: BottomNavigationBar(
        /// 当前选中的导航索引
        currentIndex: _currentIndex,

        /// 底部导航栏的点击方法
        onTap: (index) {
          // 控制 PageView 跳转到指定的页面
          _pageController.jumpToPage(index);

          setState(() {
            // 更新当前的索引值
            _currentIndex = index;
          });
        },

        /// 设置底部的若干点击导航栏点击按钮
        /// 注意该 List<BottomNavigationBarItem> items
        /// 中的按钮顺序 , 要与 PageView 中的页面顺序必须保持一致
        /// 个数个顺序都要保持一致
        items: datas.map((data) {
          return BottomNavigationBarItem(
            /// 默认状态下的图标, 灰色
            icon: Icon(
              data.icon,
              color: Colors.grey,
            ),

            /// 选中状态下的图标, 红色
            activeIcon: Icon(
              data.icon,
              color: Colors.red,
            ),

            /// 根据当前页面是否选中 , 确定
            title: Text(
              data.title,
              style: TextStyle(
                /// 如果是选中状态 , 则设置红色
                /// 如果是非选中状态, 则设置灰色
                  color: _currentIndex == data.index ? Colors.red : Colors.grey),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// 封装导航栏的图标与文本数据
class TabData {
  /// 导航数据构造函数
  const TabData({this.index, this.title, this.icon});
  /// 导航标题
  final String title;
  /// 导航图标
  final IconData icon;
  /// 索引
  final int index;
}

/// 导航栏数据集合
const List<TabData> datas = const <TabData>[
  const TabData(index: 0, title: '首页', icon: Icons.home_outlined),
  const TabData(index: 1, title: '图片', icon: Icons.camera),
  const TabData(index: 2, title: '搜索', icon: Icons.search),
  const TabData(index: 3, title: '设置', icon: Icons.settings),
];
