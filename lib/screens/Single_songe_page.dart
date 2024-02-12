import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/models/json_data.dart';
import 'package:music_player/screens/All_Songs.dart';


class SongDetailsScreen extends StatefulWidget {
  final String imageUrl;
  final String songName;
  final String singerName;

  SongDetailsScreen({
    required this.singerName,
    required this.imageUrl,
    required this.songName,
  });

  @override
  State<SongDetailsScreen> createState() => _SongDetailsScreenState();
}

class _SongDetailsScreenState extends State<SongDetailsScreen> {
  late int currentIndex;
  bool isFavorite = false;
  bool isPlaying = false;
  late AudioPlayer _audioPlayer;
  late Map<String, dynamic> currentSongData;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    currentSongData = songsData[currentIndex];
    _audioPlayer = AudioPlayer();
    _audioPlayer.playerStateStream.listen((event) {
      setState(() {
        isPlaying = event.playing;
      });
    });
    // Start playing the audio after currentSongData is initialized
    playAudio();
  }


  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Song Details',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black),
        onPressed: (){
            Navigator.pop(context);
        },
        ),

        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "${currentSongData["imageUrl"]}",
                    fit: BoxFit.fill,
                  ),
                ),
                decoration: BoxDecoration(),
                height: 300,
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 10),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("${currentSongData["songName"]}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            ),
                            SizedBox(height: 10,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("${currentSongData["singerName"] ?? "Unknown"}"),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isFavorite = !isFavorite; // Toggle favorite status
                                });
                              },
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : null, // Change color if favorite
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => AllSongsPage(),));
},
                              icon: Icon(
                                Icons.list// Change color if favorite
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    height: 100,
                    child: Center(
                        child: Builder(
                            builder: (context) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      if (currentIndex > 0) {
                                        setState(() {
                                          currentIndex--;
                                          currentSongData = songsData[currentIndex];
                                          stopAudio(); // Stop the current audio
                                          playAudio(); // Play the new audio
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.skip_previous,
                                    ),
                                    backgroundColor: Colors.grey,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      if (_audioPlayer.playing) {
                                        stopAudio(); // Stop the current audio if playing
                                      } else {
                                        playAudio(); // Start playing the audio if not playing
                                      }
                                    },
                                    child: Icon(
                                      _audioPlayer.playing ? Icons.stop : Icons.play_arrow,
                                    ),
                                    backgroundColor: Colors.grey,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      if (currentIndex < songsData.length - 1) {
                                        setState(() {
                                          currentIndex++;
                                          currentSongData = songsData[currentIndex];
                                          stopAudio(); // Stop the current audio
                                          playAudio(); // Play the new audio
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.skip_next,
                                    ),
                                    backgroundColor: Colors.grey,
                                  ),
                                ],
                              );
                            }
                        )
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 80),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
  }

  Future<void> resumeAudio() async {
    await _audioPlayer.play();
  }

  Future<void> playAudio() async {
    await _audioPlayer.setAsset(currentSongData["assets/1.mp3"]); // Set the new audio source
    await _audioPlayer.play();
  }

  Future<void> stopAudio() async {
    await _audioPlayer.stop();
  }
}
