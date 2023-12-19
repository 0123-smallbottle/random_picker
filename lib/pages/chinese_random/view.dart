import 'package:flutter/material.dart';
import 'package:random_picker/pages/chinese_random/controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

class ChineseRandomPage extends StatefulWidget {
  const ChineseRandomPage({super.key});

  @override
  _ChineseRandomPageView createState() => _ChineseRandomPageView();
}

class _ChineseRandomPageView extends State<ChineseRandomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 標題
      appBar: AppBar(
        title: const Text(
          '抽籤(中文名字)',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: const Column(
        children: [Result()],
      ),
    );
  }
}

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  // 設置初始文字
  String result = '點擊按鈕進行抽籤';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 文字顯示
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
            child: FittedBox(
              key: ValueKey<String>(result),
              fit: BoxFit.contain,
              child: AutoSizeText(
                result,
                style: GoogleFonts.notoSans(
                    fontSize: 512, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          // 按鈕
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              // 抽籤按鈕
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 48),
                    maximumSize: const Size(200, 100)),
                onPressed: () {
                  setState(() {
                    result = getRandomChineseName();
                  });
                },
                child: const Text('抽籤'),
              ),
              // 重置按鈕
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 48),
                    maximumSize: const Size(200, 100)),
                onPressed: () {
                  setState(() {
                    result = '點擊按鈕進行抽籤';
                  });
                },
                child: const Text('重置'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
