import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:khatam_quran_2/read/cubit/read/read_cubit.dart';

part 'progress_state.dart';
part 'progress_cubit.freezed.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit(this.readCubit)
      : super(const ProgressState(juz: 1, progress: 0.0)) {
    subscription = readCubit.stream.listen(
      (readState) {
        if (readState is Data) {
          updateProgress(readState.index);
        }
      },
    );
  }

  ReadCubit readCubit;
  StreamSubscription? subscription;

  void updateProgress(int index) {
    for (var i = 1; i < 31; i++) {
      if (index < numberOfEveryJuz[i]) {
        var progress = (index - numberOfEveryJuz[i - 1]) /
            (numberOfEveryJuz[i] - numberOfEveryJuz[i - 1]);
        return emit(ProgressState(juz: i, progress: progress));
      }
    }
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
