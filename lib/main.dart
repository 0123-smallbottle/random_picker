import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:get/get.dart';
import 'package:random_picker/widget/tabs/tabs.dart';
import 'package:random_picker/router/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: ((lightDynamic, darkDynamic) {
        return GetMaterialApp(
          title: 'random picker',
          theme: ThemeData(
              colorScheme: lightDynamic ??
                  ColorScheme.fromSeed(
                      seedColor: Colors.pink),
              useMaterial3: true),
          darkTheme: ThemeData(colorScheme: darkDynamic, useMaterial3: true),
          getPages: Routes.getPages,
          home: const Tabs(),
        );
      }),
    );
  }
}