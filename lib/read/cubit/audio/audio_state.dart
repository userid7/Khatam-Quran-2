part of 'audio_cubit.dart';

@freezed
abstract class AudioState with _$AudioState {
  const factory AudioState.play() = Play;
  const factory AudioState.idle() = Idle;
}
