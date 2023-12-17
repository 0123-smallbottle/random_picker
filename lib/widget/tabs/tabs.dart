import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:random_picker/pages/about/view.dart';
import 'package:random_picker/pages/chinese_random/index.dart';
import 'package:random_picker/pages/english_random/index.dart';
import 'package:random_picker/pages/about/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const ChineseRandomPage(),
    const EnglishRandomPage(),
    const AboutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: NavigationBar( 
        animationDuration: const Duration(milliseconds: 500),
        destinations: const [
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.dice),
            label: '中文',
          ),
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.dice),
            label: 'English',
          ),
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.info),
            label: 'about',
          ),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
