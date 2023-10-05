import 'package:dio/dio.dart';
import 'package:itrags/Data/Model/AudioModel.dart';

import '../AudioRepoistory/Repoisitory.dart';

class AudioApi extends Audio {
  late final Dio dio;

  AudioApi({required this.dio});

  @override
  Future<QuranAudioModel> getAudio() async {
    try {
      final response =
      await dio.get('https://api.quran.com/api/v4/chapter_recitations/1/1');
      final audioData = response.data['audio_file'];
      return QuranAudioModel.fromJson(audioData);
    } catch (error) {
      // Handle the error gracefully, you can show an error message or log it.
      throw AudioFetchException('Failed to fetch audio');
    }
  }
}

class AudioFetchException implements Exception {
  final String message;

  AudioFetchException(this.message);

  @override
  String toString() {
    return 'AudioFetchException: $message';
  }
}
