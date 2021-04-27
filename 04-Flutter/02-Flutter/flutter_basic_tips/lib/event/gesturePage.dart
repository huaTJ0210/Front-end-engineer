import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  GesturePage({Key key}) : super(key: key);

  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  //红色container坐标
  double _top = 0.0;
  double _left = 0.0;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('手势'),
        ),
        body: Stack(
          //使用Stack组件去叠加视图，便于直接控制视图坐标
          children: [
            Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                //手势识别
                child: Container(color: Colors.red, width: 50, height: 50),
                //红色子视图
                onTap: () => print("Tap"),
                //点击回调
                onDoubleTap: () => print("Double Tap"),
                //双击回调
                onLongPress: () => print("Long Press"),
                //长按回调
                onPanUpdate: (e) {
                  //拖动回调
                  setState(() {
                    //更新位置
                    _left += e.delta.dx;
                    _top += e.delta.dy;
                  });
                },
              ),
            ),
            Positioned(
              top: 200,
              left: 100,
              child: RawGestureDetector(
                gestures: {
                  //建立多手势识别器与手势识别工厂类的映射关系，从而返回可以响应该手势的recognizer
                  MultipleTapGestureRecognizer:
                      GestureRecognizerFactoryWithHandlers<
                              MultipleTapGestureRecognizer>(
                          () => MultipleTapGestureRecognizer(),
                          (MultipleTapGestureRecognizer instance) {
                    instance.onTap = () => print('parent tapped ');
                  })
                },
                child: Container(
                  color: Colors.pinkAccent,
                  width: 300,
                  height: 300,
                  child: Center(
                    child: GestureDetector(
                      onTap: () => print("Child tapped"),
                      child: Container(
                        color: Colors.yellow,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class MultipleTapGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
