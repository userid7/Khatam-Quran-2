import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:khatam_quran_2/hive/services/hive_history_repository.dart';
import 'package:khatam_quran_2/hive/services/hive_quran_repository.dart';
import 'package:khatam_quran_2/hive/services/hive_surahlist_repository.dart';
import 'package:khatam_quran_2/read/cubit/save/save_cubit.dart';

part 'read_state.dart';
part 'read_cubit.freezed.dart';

class ReadCubit extends Cubit<ReadState> {
  ReadCubit(this.index, this.saveCubit) : super(ReadState(index)) {
    var initialPage = _hiveHistoryRepository.getLastReadIndex();
    pageController = PageController(initialPage: initialPage);
  }

  SaveCubit saveCubit;

  int index;

  late PageController pageController;

  final HiveHistoryRepository _hiveHistoryRepository = HiveHistoryRepository();
  final HiveQuranRepository _hiveQuranRepository = HiveQuranRepository();
  final HiveSurahListRepository _hiveSurahListRepository =
      HiveSurahListRepository();

  // Future<ReadState?> indexToAyah(int index) async {
  //   var list = _quranApi.getAllNumOfAyah();
  //   print(list);
  //   print('test');

  //   var currentState = state;

  //   var _numOfSurah = currentState.data.numOfSurah;
  //   var _numOfAyah = currentState.data.numOfAyah;
  //   if (index > _lastIndex) {
  //     _numOfAyah++;
  //     if (_numOfAyah > currentState.data.totalAyah) {
  //       _numOfSurah++;
  //       _numOfAyah = 1;
  //     }
  //   } else if (index < _lastIndex) {
  //     _numOfAyah--;
  //     if (_numOfAyah <= 0) {
  //       _numOfSurah--;
  //       _numOfAyah = await _quranApi.getTotalAyah(_numOfSurah);
  //     }
  //   }
  //   _lastIndex = index;
  //   print(_numOfAyah);
  //   print(_numOfSurah);
  //   print('--');

  //   var ayahData = await updateCurrentAyah(_numOfAyah, _numOfSurah);
  //   emit(ReadState(index));
  //   return ReadState(index);
  // }

  void setIndex(int _index) async {
    if (!await _hiveQuranRepository.hasRead(_index) &&
        saveCubit.state is Saved) {
      await _hiveHistoryRepository.add(_index);
    }
    return emit(ReadState(_index));
  }

  void setIndexExternally(int numOfSurah, int numOfAyah) {
    saveCubit.notSaved();
    var surahIndex = _hiveSurahListRepository.get(numOfSurah)!.index;
    var index = surahIndex + numOfAyah - 1;
    print('animate to $index');
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
    );
    return emit(ReadState(index));
  }

  // Future<QuranModel> updateCurrentAyah(int numOfAyah, int numOfSurah) async {
  //   var ayahData = await _quranApi.getSingleAyah(numOfAyah, numOfSurah);
  //   return ayahData;
  // }
  //
}
