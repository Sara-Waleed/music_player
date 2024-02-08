import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/models/json_data.dart';


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
  bool isPlaying = false;
  late AudioPlayer _audioPlayer;
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.playerStateStream.listen((event) {
      setState(() {
        isPlaying = event.playing;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Song Details'),
        backgroundColor: Colors.black,
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
                    "${widget.imageUrl}",
                    fit: BoxFit.fill,
                  ),
                ),
                decoration: BoxDecoration(

                ),
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
                                child: Text("${widget.songName}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child:
                                Text("${widget.singerName ?? "Unknown"}")),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border)),
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

                child:Builder(
                  builder: (context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            if (currentIndex > 0) {
                              setState(() {
                                currentIndex--;
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
                              // If audio is currently playing, stop it
                              stopAudio();
                            } else {
                              // If audio is not playing, start playing
                              playAudio();
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
                  child: Container(height: 80,

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> playAudio() async {
    await _audioPlayer.setAsset('assets/1.mp3');
    await _audioPlayer.play();
  }

  Future<void> stopAudio() async {
    await _audioPlayer.stop();
  }
}
