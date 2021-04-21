import 'dart:convert';

import 'package:hive/hive.dart';

part 'hive_quran_model.g.dart';

@HiveType(typeId: 1)
class QuranModel extends HiveObject {
  @HiveField(0)
  int index;
  @HiveField(1)
  String surahName;
  @HiveField(2)
  int numOfSurah;
  @HiveField(3)
  int numOfAyah;
  @HiveField(4)
  String surahTextArab;
  @HiveField(5)
  int totalAyah;
  @HiveField(6)
  bool hasRead;

  QuranModel({
    this.index = 0,
    required this.surahName,
    required this.numOfSurah,
    required this.numOfAyah,
    required this.surahTextArab,
    required this.totalAyah,
    this.hasRead = false,
  });

  QuranModel copyWith({
    int? index,
    String? surahName,
    int? numOfSurah,
    int? numOfAyah,
    String? surahTextArab,
    int? totalAyah,
    bool? hasRead,
  }) {
    return QuranModel(
      index: index ?? this.index,
      surahName: surahName ?? this.surahName,
      numOfSurah: numOfSurah ?? this.numOfSurah,
      numOfAyah: numOfAyah ?? this.numOfAyah,
      surahTextArab: surahTextArab ?? this.surahTextArab,
      totalAyah: totalAyah ?? this.totalAyah,
      hasRead: hasRead ?? this.hasRead,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'surahName': surahName,
      'numOfSurah': numOfSurah,
      'numOfAyah': numOfAyah,
      'surahTextArab': surahTextArab,
      'totalAyah': totalAyah,
      'hasRead': hasRead,
    };
  }

  factory QuranModel.fromMap(Map<String, dynamic> map) {
    return QuranModel(
      index: map['index'],
      surahName: map['surahName'],
      numOfSurah: map['numOfSurah'],
      numOfAyah: map['numOfAyah'],
      surahTextArab: map['surahTextArab'],
      totalAyah: map['totalAyah'],
      hasRead: map['hasRead'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuranModel.fromJson(String source) =>
      QuranModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuranModel(index: $index, surahName: $surahName, numOfSurah: $numOfSurah, numOfAyah: $numOfAyah, surahTextArab: $surahTextArab, totalAyah: $totalAyah, hasRead: $hasRead)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuranModel &&
        other.index == index &&
        other.surahName == surahName &&
        other.numOfSurah == numOfSurah &&
        other.numOfAyah == numOfAyah &&
        other.surahTextArab == surahTextArab &&
        other.totalAyah == totalAyah &&
        other.hasRead == hasRead;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        surahName.hashCode ^
        numOfSurah.hashCode ^
        numOfAyah.hashCode ^
        surahTextArab.hashCode ^
        totalAyah.hashCode ^
        hasRead.hashCode;
  }
}
