// screens/song_details_screen.dart
import 'package:flutter/material.dart';
import 'package:music_player/models/song_model.dart';


class SongDetailsScreen extends StatelessWidget {
  final Song song;

  SongDetailsScreen({required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Song Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Title: ${song.title}'),
            Text('Artist: ${song.artist}'),
            // Add more details here

            // Example Play Button (Replace this with your audio player implementation)
            ElevatedButton(
              onPressed: () {
                // Handle play action
              },
              child: Text('Play'),
            ),
          ],
        ),
      ),
    );
  }
}
