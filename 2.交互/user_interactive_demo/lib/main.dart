import 'package:flutter/material.dart';

import 'favorite_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
/*

介绍
本文档介绍了如何在Flutter中监听并响应手势（点击、拖动和缩放）。
  Flutter中的手势系统有两个独立的层。
  第一层有原始指针(pointer)事件，它描述了屏幕上指针（例如，触摸，鼠标和触控笔）的位置和移动。 
  第二层有手势，描述由一个或多个指针移动组成的语义动作。

Pointers
  指针(Pointer)代表用户与设备屏幕交互的原始数据。有四种类型的指针事
    PointerDownEvent 指针接触到屏幕的特定位置
    PointerMoveEvent 指针从屏幕上的一个位置移动到另一个位置
    PointerUpEvent 指针停止接触屏幕
    PointerCancelEvent 指针的输入事件不再针对此应用（事件取消）
    在指针按下时，框架对您的应用程序执行_命中测试_，以确定指针与屏幕相接的位置存在哪些widget。 
    指针按下事件（以及该指针的后续事件）然后被分发到由_命中测试_发现的最内部的widget。 
    从那里开始，这些事件会冒泡在widget树中向上冒泡，这些事件会从最内部的widget被分发到到widget根的路径上的所有小部件（译者语：这和web中事件冒泡机制相似）， 没有机制取消或停止冒泡过程(译者语：这和web不同，web中的时间冒泡是可以停止的)。

To listen to pointer events directly from the widgets layer, use a Listener widget. However, generally, consider using gestures (as discussed below) instead. 
要直接从widget层监听指针事件，可以使用Listenerwidget。 但是，通常，请考虑使用手势（如下所述）

手势
  手势表示可以从多个单独的指针事件（甚至可能是多个单独的指针）识别的语义动作（例如，轻敲，拖动和缩放）。 完整的一个手势可以分派多个事件，对应于手势的生命周期（例如，拖动开始，拖动更新和拖动结束）：

Tap
  onTapDown 指针已经在特定位置与屏幕接触
  onTapUp 指针停止在特定位置与屏幕接触
  onTap tap事件触发
  onTapCancel 先前指针触发的onTapDown不会在触发tap事件
双击
  onDoubleTap 用户快速连续两次在同一位置轻敲屏幕.
长按
  onLongPress 指针在相同位置长时间保持与屏幕接触
垂直拖动
  onVerticalDragStart 指针已经与屏幕接触并可能开始垂直移动
  onVerticalDragUpdate 指针与屏幕接触并已沿垂直方向移动.
  onVerticalDragEnd 先前与屏幕接触并垂直移动的指针不再与屏幕接触，并且在停止接触屏幕时以特定速度移动
水平拖动
  onHorizontalDragStart 指针已经接触到屏幕并可能开始水平移动
  onHorizontalDragUpdate 指针与屏幕接触并已沿水平方向移动
  onHorizontalDragEnd 先前与屏幕接触并水平移动的指针不再与屏幕接触，并在停止接触屏幕时以特定速度移动
  要从widget层监听手势，请使用 GestureDetector.

如果您使用的是Material Components，那么大多数widget已经对tap或手势做出了响应。 例如 IconButton和 FlatButton 响应presses（taps），ListView响应滑动事件触发滚动。
如果您不使用这些widget，但想要在点击时上出现“墨水飞溅”效果，可以使用InkWell。

手势消歧
  在屏幕上的指定位置，可能会有多个手势检测器。所有这些手势检测器在指针事件流经过并尝试识别特定手势时监听指针事件流。 GestureDetectorwidget决定是哪种手势。
  当屏幕上给定指针有多个手势识别器时，框架通过让每个识别器加入一个“手势竞争场”来确定用户想要的手势。“手势竞争场”使用以下规则确定哪个手势胜出
    在任何时候，识别者都可以宣布失败并离开“手势竞争场”。如果在“竞争场”中只剩下一个识别器，那么该识别器就是赢家
    在任何时候，识别者都可以宣布胜利，这会导致胜利，并且所有剩下的识别器都会失败

例如，在消除水平和垂直拖动的歧义时，两个识别器在接收到指针向下事件时进入“手势竞争场”。识别器观察指针移动事件。
 如果用户将指针水平移动超过一定数量的逻辑像素，则水平识别器将声明胜利，并且手势将被解释为水平拖拽。 
 类似地，如果用户垂直移动超过一定数量的逻辑像素，垂直识别器将宣布胜利。

当只有水平（或垂直）拖动识别器时，“手势竞争场”是有益的。
在这种情况下，“手势竞争场”将只有一个识别器，并且水平拖动将被立即识别，这意味着水平移动的第一个像素可以被视为拖动，用户不需要等待进一步的手势消歧。




 */
class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 3.Container也是一个widget，允许您自定义其子widget。如果要添加填充，边距，边框或背景色，请使用Container来设置
                // Text一般放在Container中,以便于添加边框
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text('Kandersteg,Switzerland',
                    style: TextStyle(color: Colors.grey[500]))
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL', color),
          buildButtonColumn(Icons.near_me, 'ROUTE', color),
          buildButtonColumn(Icons.share, 'SHARE', color),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text('''
        Lake Oeschinen lies at the foot of the Bluemlisalp in the bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        '''),
    );

      // 2.每个页面有需要使用Scaffold 包裹
    return Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 0.0),
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    'images/lake.jpg',
                    height: 240.0,
                    // width: 600.0,
                    fit: BoxFit.fitWidth,
                  ),
                )
              ],
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      );
  }

  Column buildButtonColumn(IconData icon, String label, Color color) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              )),
        )
      ],
    );
  }
}