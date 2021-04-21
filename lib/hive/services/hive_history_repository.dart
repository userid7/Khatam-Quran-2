import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HiveHistoryRepository {
  final String _boxName = 'History';

  var formatter = DateFormat('dd-MM-yyyy');

  Future<void> init() async {
    print('init HiveHistoryRepository');
    if (await Hive.boxExists(_boxName)) {
      print('$_boxName Box already exist, open the Box');
      var _box = await Hive.openBox<List<int>>(_boxName);
      print('$_boxName Box contain ${_box.length} data');
      return;
    }

    print('$_boxName Box not exist, creating $_boxName Box...');

    var _box = await Hive.openBox<List<int>>(_boxName);
    await _box.clear();
    await add(1);

    initTargetDate();

    print('$_boxName box has created!');

    return;
  }

  Future<void> add(int _index) async {
    print('add');
    var _historyBox = Hive.box<List<int>>(_boxName);
    var now = DateTime.now();
    var date = DateTime(now.year, now.month, now.day);
    var dateFormated = formatter.format(date);

    // ignore: omit_local_variable_types
    List<int> listOfTodayHistory = [];

    if (_historyBox.isNotEmpty)
      listOfTodayHistory += _historyBox.get(dateFormated) ?? [];

    listOfTodayHistory.add(_index);

    await _historyBox.put(dateFormated, listOfTodayHistory);

    print('added!');
  }

  List<int> get(String date) {
    var _historyBox = Hive.box<List<int>>(_boxName);
    return _historyBox.get(date) ?? <int>[];
  }

  int getLength() {
    var _historyBox = Hive.box<List<int>>(_boxName);
    return _historyBox.length;
  }

  dynamic getKeyAt(int index) {
    var _historyBox = Hive.box<List<int>>(_boxName);
    return _historyBox.keyAt(index - 1) ?? [];
  }

  List<int> getAt(int index) {
    var _historyBox = Hive.box<List<int>>(_boxName);
    return _historyBox.getAt(index - 1) ?? [];
  }

  int getLastReadIndex() {
    var numberOfDays = getLength();

    var lastIndex = getAt(numberOfDays).last;

    return lastIndex;
  }

  int getTotalRead() {
    var _historyBox = Hive.box<List<int>>(_boxName);
    var _historyMap = _historyBox.toMap();
    var totalRead = 0;
    _historyMap.forEach((key, value) {
      totalRead += value.length;
    });
    return totalRead;
  }

  Map<DateTime, int> getLast7Days() {
    var last7Days = <DateTime, int>{};
    var now = DateTime.now();
    for (var i = 0; i < 7; i++) {
      print(i);
      var date = DateTime(now.year, now.month, now.day - i);
      var dateFormated = formatter.format(date);
      var value = get(dateFormated);
      last7Days[date] = value.length;
    }
    return last7Days;
  }

  void initTargetDate() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('targetDate')) {
      var now = DateTime.now();
      var targetDate = DateTime(now.year, now.month + 1, now.day);

      var targetDateString = formatter.format(targetDate);
      await prefs.setString('targetDate', targetDateString);
    }
  }

  Future<DateTime> getTargetDate() async {
    final prefs = await SharedPreferences.getInstance();
    var targetDateString = prefs.getString('targetDate');

    var targetDate = formatter.parse(targetDateString!);

    return targetDate;
  }

  Future<void> setTargetDate(DateTime targetDate) async {
    var targetDateString = formatter.format(targetDate);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('targetDate', targetDateString);
  }
}
