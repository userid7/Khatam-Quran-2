import 'package:khatam_quran_2/report/models/report_model.dart';
import 'package:khatam_quran_2/hive/services/hive_history_repository.dart';
import 'package:khatam_quran_2/hive/services/hive_quran_repository.dart';

class ReportRepository {
  final HiveQuranRepository _hiveQuranRepository = HiveQuranRepository();
  final HiveHistoryRepository _hiveHistoryRepository = HiveHistoryRepository();

  Future<ReportModel> getReport() async {
    //Contain of report :
    //-number of days
    //-last read
    //-average/day
    //-target/day
    //-report
    print('calculate report...');

    var numberOfDays = _hiveHistoryRepository.getLength();

    var lastIndex = _hiveHistoryRepository.getAt(numberOfDays).last;

    var lastRead = await _hiveQuranRepository.get(lastIndex);

    var last7Days = _hiveHistoryRepository.getLast7Days();

    print('....');

    var total = 0;
    last7Days.forEach((key, value) {
      total += value;
    });

    var average = (total / numberOfDays).round();

    var currentDate = DateTime.now();
    print('....-');
    var targetDate = await _hiveHistoryRepository.getTargetDate();
    print(targetDate.toString());
    print('.....');
    var daysLeft = targetDate.difference(currentDate).inDays;
    print(daysLeft);
    print('......');
    var totalRead = _hiveHistoryRepository.getTotalRead();

    var target = ((6236 - totalRead) / daysLeft).round();

    var report = ReportModel(
      numberOfDays: numberOfDays,
      lastRead: lastRead!,
      averagePerDays: average,
      targetPerDays: target,
      last5Days: last7Days,
      targetDate: targetDate,
    );

    print(report.toString());

    return report;
  }

  Future<void> setTargetDate(DateTime targetDate) async {
    await _hiveHistoryRepository.setTargetDate(targetDate);
  }
}
