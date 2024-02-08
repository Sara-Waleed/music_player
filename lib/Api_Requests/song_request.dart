// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:music_player/models/song_model.dart';
//
// class GeniusService {
//   static const apiKey = 'YOUR_GENIUS_API_KEY';
//   static const baseUrl = 'https://genius-song-lyrics1.p.rapidapi.com';
//
//   static Future<List<Song>> searchSongs(String query) async {
//     final response = await http.get(
//       Uri.parse('$baseUrl/song/search'),
//       headers: {
//         'X-RapidAPI-Key': apiKey,
//         'X-RapidAPI-Host': 'genius-song-lyrics1.p.rapidapi.com',
//       },
//       queryParameters: {'q': query},
//     );
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final songs = List<Song>.from(data['response']['songs'].map(
//             (songData) => Song.fromJson(songData),
//       ));
//       return songs;
//     } else {
//       throw Exception('Failed to fetch songs. Status code: ${response.statusCode}');
//     }
//   }
// }
