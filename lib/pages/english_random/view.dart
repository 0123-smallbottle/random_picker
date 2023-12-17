import 'package:flutter/material.dart';
import 'package:random_picker/pages/english_random/controller.dart';

class EnglishRandomPage extends StatefulWidget {
  const EnglishRandomPage({Key? key}) : super(key: key);

  @override
  _EnglishRandomPageView createState() => _EnglishRandomPageView();
}

class _EnglishRandomPageView extends State<EnglishRandomPage> {
  String _text = 'Click the button to pick a name';
  double _size = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Picker (English Names)',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _text,
              textScaleFactor: _size.toDouble(),
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
                      getRandomEnglishName();
                      _text = getRandomEnglishName();
                      _size = 12;
                    });
                  },
                  child: const Text('Pick Name'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 64),
                    minimumSize: const Size(200, 100),
                  ),
                  onPressed: () {
                    setState(() {
                      _text = 'Click the button to pick a name';
                      _size = 5;
                    });
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}