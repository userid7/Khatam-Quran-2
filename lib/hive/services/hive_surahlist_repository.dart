import 'package:hive/hive.dart';
import 'package:khatam_quran_2/hive/models/hive_quran_model.dart';
import 'package:khatam_quran_2/read/services/quran_repository.dart';

class HiveSurahListRepository {
  final String _boxName = 'surahs';

  Future<void> init() async {
    print('init HiveSurahListRepository');
    if (Hive.isBoxOpen(_boxName)) await Hive.box(_boxName).close();

    if (await Hive.boxExists(_boxName)) {
      var _box = await Hive.openBox<QuranModel>(_boxName);
      print('SurahList Box already exist, open the Box...');
      print('SurahList Box contains ${_box.length} datas');
      if (_box.length == 114) {
        return;
      }
      print('Box defect, rebuild...');
      await _box.clear();
      await _box.close();
    }

    var _box = await Hive.openBox<QuranModel>(_boxName);
    print('creating Quran Box...');

    var quranApi = QuranApi();

    var i = 1;

    for (var j = 1; j < 115; j++) {
      var totalAyah = await quranApi.getTotalAyah(j);
      for (var k = 1; k < totalAyah + 1; k++) {
        if (k == 1) {
          var data = await quranApi.getSingleAyah(k, j);
          data = data.copyWith(index: i);
          await _box.put(j.toString(), data);
        }
        i++;
      }
      print('...');
    }
    print('${i - 1} datas has added!');

    return;
  }

  QuranModel? get(int index) {
    var data = Hive.box<QuranModel>(_boxName).get(index.toString());
    return data;
  }
}
