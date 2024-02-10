// song_model.dart

class Song {
  final String imageUrl;
  final String songName;
  final String singerName;
  bool isFavorite;

  Song({
    required this.imageUrl,
    required this.songName,
    required this.singerName,
    this.isFavorite = false, // Default value for isFavorite
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
