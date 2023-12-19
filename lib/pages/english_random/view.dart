import 'package:flutter/material.dart';
import 'package:random_picker/pages/english_random/controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

class EnglishRandomPage extends StatefulWidget {
  const EnglishRandomPage({super.key});

  @override
  _EnglishRandomPageView createState() => _EnglishRandomPageView();
}

class _EnglishRandomPageView extends State<EnglishRandomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Title
      appBar: AppBar(
        title: const Text(
          'Random Picker (English Names)',
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
  String result = 'Click the button to pick a name';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 顯示文字
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
              // Pick Name 按鈕
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 48),
                    maximumSize: const Size(400, 100)),
                onPressed: () {
                  setState(() {
                    result = getRandomEnglishName();
                  });
                },
                child: const Text('Pick Name'),
              ),
              // Reset 按鈕
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 48),
                    maximumSize: const Size(200, 100)),
                onPressed: () {
                  setState(() {
                    result = 'Click the button to pick a name';
                  });
                },
                child: const Text('Reset'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
