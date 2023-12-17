import 'dart:math';
import 'package:random_picker/data/name_list.dart';


String getRandomEnglishName() {
  Random random = Random();
  int index = random.nextInt(englishNameList.length);
  return englishNameList[index];
}
