// screens/song_list_screen.dart
import 'package:flutter/material.dart';
import 'package:music_player/models/song_model.dart';
import 'package:music_player/screens/Single_songe_page.dart';


class SongListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Song List')),
      body: FutureBuilder<List<Song>>(
        future: GeniusService.searchSongs('Your Search Query'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No songs found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final song = snapshot.data![index];
                return ListTile(
                  title: Text(song.title),
                  subtitle: Text(song.artist),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SongDetailsScreen(song: song),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
