import 'package:hive/hive.dart';
import 'package:khatam_quran_2/hive/models/hive_quran_model.dart';
import 'package:khatam_quran_2/read/services/quran_repository.dart';

class HiveQuranRepository {
  final String _boxName = 'Quran';

  Future<void> init() async {
    print('init HiveQuranRepository');
    if (Hive.isBoxOpen(_boxName)) await Hive.box(_boxName).close();

    if (await Hive.boxExists(_boxName)) {
      var _box = await Hive.openBox(_boxName);
      print('Quran Box already exist, open the Box...');
      print('Quran Box contains ${_box.length} datas');
      if (_box.length >= 6235) {
        await _box.close();
        await Hive.openLazyBox<QuranModel>(_boxName);
        return;
      }
      print('Box defect, rebuild...');
      await _box.clear();
      await _box.close();
    }

    var _box = await Hive.openLazyBox<QuranModel>(_boxName);
    print('creating Quran Box...');

    var quranApi = QuranApi();

    var i = 1;

    for (var j = 1; j < 115; j++) {
      var totalAyah = await quranApi.getTotalAyah(j);
      for (var k = 1; k < totalAyah + 1; k++) {
        var data = await quranApi.getSingleAyah(k, j);
        data = data.copyWith(index: i);
        await _box.put(i.toString(), data);
        print(i);
        i++;
      }
    }
    print('${i - 1} datas has added!');

    return;
  }

  Future<QuranModel?> get(int index) {
    var data = Hive.lazyBox<QuranModel>(_boxName).get(index.toString());
    return data;
  }

  Future<bool> hasRead(int index) async {
    var data = await Hive.lazyBox<QuranModel>(_boxName).get(index.toString());
    var hasRead = data?.hasRead ?? true;
    if (!hasRead && data != null)
      await Hive.lazyBox<QuranModel>(_boxName)
          .put(index.toString(), data.copyWith(hasRead: true));
    return hasRead;
  }
}
