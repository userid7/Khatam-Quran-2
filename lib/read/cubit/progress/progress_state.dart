part of 'progress_cubit.dart';

@freezed
abstract class ProgressState with _$ProgressState {
  const factory ProgressState({required int juz, required double progress}) =
      _ProgressState;
}
