// song_model.dart

class Song {
  final String imageUrl;
  final String songName;
  final String singerName;

  Song({
    required this.imageUrl,
    required this.songName,
    required this.singerName,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      imageUrl: json['imageUrl'] ?? '',
      songName: json['songName'] ?? '',
      singerName: json['singerName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'songName': songName,
      'singerName': singerName,
    };
  }
}
