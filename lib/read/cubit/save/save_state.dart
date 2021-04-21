part of 'save_cubit.dart';

@freezed
abstract class SaveState with _$SaveState {
  const factory SaveState.saved() = Saved;
  const factory SaveState.notSaved() = NotSaved;
}
