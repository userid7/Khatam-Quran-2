import 'dart:convert';

import 'package:flutter/services.dart';

class QuranData {
  final base = 'assets/surah/';

  Future<Map<String, dynamic>> parseJsonFromAssets(int numberOfSurah) async {
    var assetsPath = base + numberOfSurah.toString() + '.json';
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }
}
