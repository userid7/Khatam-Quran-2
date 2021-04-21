import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:khatam_quran_2/hive/models/hive_quran_model.dart';

class ReportModel {
  int numberOfDays;
  QuranModel lastRead;
  int averagePerDays;
  int targetPerDays;
  Map<DateTime, int> last5Days;
  DateTime targetDate;

  ReportModel({
    required this.numberOfDays,
    required this.lastRead,
    required this.averagePerDays,
    required this.targetPerDays,
    required this.last5Days,
    required this.targetDate,
  });

  ReportModel copyWith({
    int? numberOfDays,
    QuranModel? lastRead,
    int? averagePerDays,
    int? targetPerDays,
    Map<DateTime, int>? last5Days,
    DateTime? targetDate,
  }) {
    return ReportModel(
      numberOfDays: numberOfDays ?? this.numberOfDays,
      lastRead: lastRead ?? this.lastRead,
      averagePerDays: averagePerDays ?? this.averagePerDays,
      targetPerDays: targetPerDays ?? this.targetPerDays,
      last5Days: last5Days ?? this.last5Days,
      targetDate: targetDate ?? this.targetDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'numberOfDays': numberOfDays,
      'lastRead': lastRead.toMap(),
      'averagePerDays': averagePerDays,
      'targetPerDays': targetPerDays,
      'last5Days': last5Days,
      'targetDate': targetDate.millisecondsSinceEpoch,
    };
  }

  factory ReportModel.fromMap(Map<String, dynamic> map) {
    return ReportModel(
      numberOfDays: map['numberOfDays'],
      lastRead: QuranModel.fromMap(map['lastRead']),
      averagePerDays: map['averagePerDays'],
      targetPerDays: map['targetPerDays'],
      last5Days: Map<DateTime, int>.from(map['last5Days']),
      targetDate: DateTime.fromMillisecondsSinceEpoch(map['targetDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportModel.fromJson(String source) =>
      ReportModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReportModel(numberOfDays: $numberOfDays, lastRead: $lastRead, averagePerDays: $averagePerDays, targetPerDays: $targetPerDays, last5Days: $last5Days, targetDate: $targetDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReportModel &&
        other.numberOfDays == numberOfDays &&
        other.lastRead == lastRead &&
        other.averagePerDays == averagePerDays &&
        other.targetPerDays == targetPerDays &&
        mapEquals(other.last5Days, last5Days) &&
        other.targetDate == targetDate;
  }

  @override
  int get hashCode {
    return numberOfDays.hashCode ^
        lastRead.hashCode ^
        averagePerDays.hashCode ^
        targetPerDays.hashCode ^
        last5Days.hashCode ^
        targetDate.hashCode;
  }
}
