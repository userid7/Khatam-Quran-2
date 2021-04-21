import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_state.dart';
part 'save_cubit.freezed.dart';

class SaveCubit extends Cubit<SaveState> {
  SaveCubit() : super(SaveState.saved());

  void changeState() {
    state is Saved
        ? emit(const SaveState.notSaved())
        : emit(const SaveState.saved());
  }

  void notSaved() {
    emit(const SaveState.notSaved());
  }

  void saved() {
    emit(const SaveState.saved());
  }
}
