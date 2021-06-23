import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_ibm_watson/flutter_ibm_watson.dart';

class IBMService {
  String apiKey = "gfW7x9ZYdZtuaPYDBk2dXYYRp5oyo--gVXwftQzXyaUN";
  String ibmURL =
      "https://api.eu-gb.text-to-speech.watson.cloud.ibm.com/instances/13095ad0-cdaf-4186-8c45-8ae2fbfbe695";

  void textToSpeech(String text) async {
    AudioPlayer audioPlayer = new AudioPlayer();
    IamOptions options =
        await IamOptions(iamApiKey: apiKey, url: ibmURL).build();
    TextToSpeech service = new TextToSpeech(iamOptions: options);
    Uint8List voice = await service.toSpeech(text);
    audioPlayer.playBytes(voice);
  }
}
