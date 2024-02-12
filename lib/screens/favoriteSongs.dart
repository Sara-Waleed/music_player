import 'package:flutter/material.dart';
import 'package:music_player/models/json_data.dart'; // Import your data model here

class FavoriteSongsPage extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteSongs;

  const FavoriteSongsPage({Key? key, required this.favoriteSongs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Songs'),
      ),
      body: ListView.builder(
        itemCount: favoriteSongs.length,
        itemBuilder: (context, index) {
          final song = favoriteSongs[index];
          return ListTile(
            leading: Image.asset(song["imageUrl"]),
            title: Text(song["songName"]),
            subtitle: Text(song["singerName"]),
            onTap: () {
              // Navigate to song details page or perform any action
            },
          );
        },
      ),
    );
  }
}
