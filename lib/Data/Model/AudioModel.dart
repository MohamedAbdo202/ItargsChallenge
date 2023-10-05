class QuranAudioModel {
  final int id;
  final int chapterId;
  final double fileSize;
  final String format;
  final String audioUrl;

  QuranAudioModel({
    required this.id,
    required this.chapterId,
    required this.fileSize,
    required this.format,
    required this.audioUrl,
  });

  factory QuranAudioModel.fromJson(Map<String, dynamic> json) {
    return QuranAudioModel(
      id: json['id'],
      chapterId: json['chapter_id'],
      fileSize: json['file_size'].toDouble(),
      format: json['format'],
      audioUrl: json['audio_url'],
    );
  }
}
