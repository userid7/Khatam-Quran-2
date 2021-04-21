import 'package:khatam_quran_2/hive/models/hive_quran_model.dart';
import 'package:khatam_quran_2/read/services/quran_audio_client.dart';
import 'package:khatam_quran_2/read/services/quran_json_client.dart';

class QuranApi {
  final textRepository = QuranData();
  final audioRepository = QuranAudio();

  late List<int> totalAyahOfEverySurah;

  Future<QuranModel> getSingleAyah(int numOfAyah, int numOfSurah) async {
    var data = await textRepository.parseJsonFromAssets(numOfSurah);

    Map dataSurah = data[numOfSurah.toString()];
    Map dataAyah = dataSurah['text'];
    var quranModel = QuranModel(
        surahName: dataSurah['name_latin'],
        numOfAyah: numOfAyah,
        numOfSurah: numOfSurah,
        surahTextArab: dataAyah[numOfAyah.toString()],
        totalAyah: int.parse(dataSurah['number_of_ayah']));

    return quranModel;
  }

  Future<List<QuranModel>> getAllSurah() async {
    var _listOfQuranModel = <QuranModel>[];
    for (var i = 1; i < 115; i++) {
      print('.......');
      var data = await textRepository.parseJsonFromAssets(i);

      var dataSurah = data[i.toString()];
      Map dataAyah = dataSurah['text'];
      print('...');
      var quranModel = QuranModel(
          surahName: dataSurah['name_latin'],
          numOfAyah: 1,
          numOfSurah: 1,
          surahTextArab: dataAyah[1.toString()],
          totalAyah: int.parse(dataSurah['number_of_ayah']));
      print(i);
      _listOfQuranModel.add(quranModel);
      print('___');
    }

    return _listOfQuranModel;
  }

  Future<List<int>> getAllNumOfAyah() async {
    var list = <int>[];
    for (var i = 1; i < 115; i++) {
      var data = await textRepository.parseJsonFromAssets(i);

      var dataSurah = data[i.toString()];

      list.add(int.parse(dataSurah['number_of_ayah']));
    }
    return list;
  }

  Future<int> getTotalAyah(int numOfSurah) async {
    var data = await textRepository.parseJsonFromAssets(numOfSurah);
    return int.parse(data[numOfSurah.toString()]['number_of_ayah']);
  }
}

List numberOfEveryJuz = [
  0,
  148,
  259,
  385,
  516,
  640,
  750,
  899,
  1041,
  1200,
  1327,
  1478,
  1648,
  1802,
  2029,
  2214,
  2483,
  2673,
  2875,
  3214,
  3385,
  3563,
  3732,
  4089,
  4264,
  4510,
  4705,
  5104,
  5241,
  5672,
  6236
];
