import 'package:flutter/material.dart';
import 'package:random_picker/pages/chinese_random/controller.dart';

class ChineseRandomPage extends StatefulWidget {
  const ChineseRandomPage({Key? key}) : super(key: key);

  @override
  _ChineseRandomPageView createState() => _ChineseRandomPageView();
}

class _ChineseRandomPageView extends State<ChineseRandomPage> {
  String _text = '點擊按鈕進行抽籤';
  double _size = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '抽籤(中文名字)',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                final inAnimation = Tween<Offset>(
                  begin: const Offset(0.0, -5.0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOutExpo,
                ));
                return SlideTransition(
                  position: inAnimation,
                  child: child,
                );
              },
              child: Text(
                _text,
                key: ValueKey<String>(_text),
                textScaleFactor: _size.toDouble(),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 64),
                    minimumSize: const Size(200, 100),
                  ),
                  onPressed: () {
                    setState(() {
                      getRandomChineseName();
                      _text = getRandomChineseName();
                      _size = 18;
                    });
                  },
                  child: const Text('抽籤'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 64),
                    minimumSize: const Size(200, 100),
                  ),
                  onPressed: () {
                    setState(() {
                      _text = '點擊按鈕進行抽籤';
                      _size = 5;
                    });
                  },
                  child: const Text('重置'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
