import 'package:audioplayers/audioplayers.dart';

class QuranAudio {
  final String _url = 'https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/';
  AudioPlayer audioPlayer = AudioPlayer();

  void playAudio(int index) {
    var audio = audioPlayer.play(_url + index.toString());
    print('Audio Player Result');
    print(audio);
  }

  void stopAudio() {
    audioPlayer.stop();
  }
}
