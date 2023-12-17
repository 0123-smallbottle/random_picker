import 'package:get/get.dart';
import 'package:random_picker/pages/chinese_random/index.dart';
import 'package:random_picker/pages/english_random/index.dart';

class Routes {
  static final getPages = [
    GetPage(
      name: '/chinese_random',
      page: () => const ChineseRandomPage(),
    ),
    GetPage(
      name: '/english_random',
      page: () => const EnglishRandomPage(),
    ),
    //GetPage(
    //  name: '/settings',
    //  page: () => const Settings(),
    //  binding: SettingsBinding(),
    //),
    //GetPage(
    //  name: '/about',
    //  page: () => const About(),
    //  binding: AboutBinding(),
    //),
  ];
}