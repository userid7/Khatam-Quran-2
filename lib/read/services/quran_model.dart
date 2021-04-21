import 'dart:convert';

class QuranModel {
  String surahName;
  int numOfAyah;
  int numOfSurah;
  String surahTextArab;
  int totalAyah;

  QuranModel({
    required this.surahName,
    required this.numOfAyah,
    required this.numOfSurah,
    required this.surahTextArab,
    required this.totalAyah,
  });

  QuranModel copyWith({
    String? surahName,
    int? numOfAyah,
    int? numOfSurah,
    String? surahTextArab,
    int? totalAyah,
  }) {
    return QuranModel(
      surahName: surahName ?? this.surahName,
      numOfAyah: numOfAyah ?? this.numOfAyah,
      numOfSurah: numOfSurah ?? this.numOfSurah,
      surahTextArab: surahTextArab ?? this.surahTextArab,
      totalAyah: totalAyah ?? this.totalAyah,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'surahName': surahName,
      'numOfAyah': numOfAyah,
      'numOfSurah': numOfSurah,
      'surahTextArab': surahTextArab,
      'totalAyah': totalAyah,
    };
  }

  factory QuranModel.fromMap(Map<String, dynamic> map) {
    return QuranModel(
      surahName: map['surahName'],
      numOfAyah: map['numOfAyah'],
      numOfSurah: map['numOfSurah'],
      surahTextArab: map['surahTextArab'],
      totalAyah: map['totalAyah'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuranModel.fromJson(String source) =>
      QuranModel.fromMap(json.decode(source));

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'QuranModel(surahName: $surahName, numOfAyah: $numOfAyah, numOfSurah: $numOfSurah, surahTextArab: $surahTextArab, totalAyah: $totalAyah)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuranModel &&
        other.surahName == surahName &&
        other.numOfAyah == numOfAyah &&
        other.numOfSurah == numOfSurah &&
        other.surahTextArab == surahTextArab &&
        other.totalAyah == totalAyah;
  }

  @override
  int get hashCode {
    return surahName.hashCode ^
        numOfAyah.hashCode ^
        numOfSurah.hashCode ^
        surahTextArab.hashCode ^
        totalAyah.hashCode;
  }
}
