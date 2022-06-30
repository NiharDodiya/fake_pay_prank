import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

class GooglePayController extends GetxController{
  @override
  void onInit() {
    ///play audio
    AssetsAudioPlayer.newPlayer().open(Audio("assets/audio/sound.mp3"),
      showNotification: true, autoStart: true,);
    super.onInit();
  }
}