// song_model.dart

class Song {
  final String imageUrl;
  final String songName;
  final String singerName;
  final String? songUrl; // Make songUrl optional
  bool isFavorite;

  Song({
    required this.imageUrl,
    required this.songName,
    required this.singerName,
    this.songUrl, // Make songUrl optional
    this.isFavorite = false, // Default value for isFavorite
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      imageUrl: json['imageUrl'] ?? '',
      songName: json['songName'] ?? '',
      singerName: json['singerName'] ?? '',
      songUrl: json['songUrl'], // Get songUrl from JSON (may be null)
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'songName': songName,
      'singerName': singerName,
      'songUrl': songUrl, // Include songUrl in JSON (may be null)
    };
  }
}
