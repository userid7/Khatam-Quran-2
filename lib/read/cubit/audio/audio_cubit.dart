import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:khatam_quran_2/read/cubit/read/read_cubit.dart';

part 'audio_state.dart';
part 'audio_cubit.freezed.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit(this.readCubit) : super(const AudioState.idle()) {
    subscription = readCubit.stream.listen(
      (readState) {
        if (readState is Data) {
          newAudio(readState.index);
        }
      },
    );
  }

  final String _url = 'https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/';
  AudioPlayer audioPlayer = AudioPlayer();

  ReadCubit readCubit;
  StreamSubscription? subscription;

  int index = 0;

  void newAudio(int _index) {
    print('new audio. index: $_index');
    index = _index;
    audioPlayer.stop();
    emit(const AudioState.idle());
  }

  void playAudio() {
    audioPlayer.play(_url + index.toString());
    audioPlayer.onPlayerCompletion.listen((event) {
      print('ini callbacknya');
      stopAudio();
    });
    audioPlayer.onPlayerError.listen((msg) {
      print('Failed to play audio');
      stopAudio();
    });
    emit(const AudioState.play());
  }

  void stopAudio() {
    audioPlayer.stop();
    emit(const AudioState.idle());
  }
}
