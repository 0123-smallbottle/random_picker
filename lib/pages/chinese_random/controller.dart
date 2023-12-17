import 'dart:math';
import 'package:random_picker/data/name_list.dart';


String getRandomChineseName() {
  Random random = Random();
  int index = random.nextInt(chineseNameList.length);
  return chineseNameList[index];
}
