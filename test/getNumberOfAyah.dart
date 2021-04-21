import 'dart:convert';

import 'package:flutter/services.dart';

class QuranData {
  final base = 'surah/';

  Future<List<int>> _getAllNumOfAyah() async {
    List<int> list = [];
    for (var i = 1; i < 115; i++) {
      var data = await parseJsonFromAssets(i);

      var dataSurah = data[i.toString()];

      list.add(int.parse(dataSurah['number_of_ayah']));
    }
    return list;
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(int numberOfSurah) async {
    var assetsPath = base + numberOfSurah.toString() + ".json";
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }
}

void main() {
  var listOfNumAyah = QuranData()._getAllNumOfAyah();
  print('get list');
  print(listOfNumAyah);
}
