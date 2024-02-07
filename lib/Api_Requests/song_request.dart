import 'dart:convert';
import '../models/song_model.dart';
import 'package:http/http.dart' as http;

Future<GeniusSongDetails> fetchGeniusSongDetails(String id) async {
  final String apiKey = '6ba6c8331amshd6007934dc9324cp13c96cjsneb2c24c8addb';
  final String host = 'genius-song-lyrics1.p.rapidapi.com';
  final String url = 'https://$host/song/details/?id=$id';

  final response = await http.get(Uri.parse(url), headers: {
    'X-RapidAPI-Key': apiKey,
    'X-RapidAPI-Host': host,
  });

  if (response.statusCode == 200) {
    return GeniusSongDetails.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Genius Song Details');
  }
}