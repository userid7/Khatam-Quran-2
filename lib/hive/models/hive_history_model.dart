import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'hive_history_model.g.dart';

@HiveType(typeId: 2)
class HistoryModel extends HiveObject {
  @HiveField(0)
  DateTime dateTime;
  @HiveField(1)
  List<int>? listOfIndex;

  HistoryModel({
    required this.dateTime,
    this.listOfIndex,
  });

  HistoryModel copyWith({
    DateTime? dateTime,
    List<int>? listOfIndex,
  }) {
    return HistoryModel(
      dateTime: dateTime ?? this.dateTime,
      listOfIndex: listOfIndex ?? this.listOfIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime.millisecondsSinceEpoch,
      'listOfIndex': listOfIndex,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      listOfIndex: List<int>.from(map['listOfIndex']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) =>
      HistoryModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'HistoryModel(dateTime: $dateTime, listOfIndex: $listOfIndex)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HistoryModel &&
        other.dateTime == dateTime &&
        listEquals(other.listOfIndex, listOfIndex);
  }

  @override
  int get hashCode => dateTime.hashCode ^ listOfIndex.hashCode;
}
