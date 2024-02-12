import 'package:flutter/material.dart';
import 'package:music_player/models/json_data.dart';
import 'package:music_player/screens/All_Songs.dart';
import 'package:music_player/screens/Single_songe_page.dart';
import 'package:music_player/widgets/Horizontal_List.dart';

import '../widgets/Home_Item1.dart';
import '../widgets/Home_Item2.dart';
import '../widgets/Home_Item3.dart';
import '../widgets/Home_Item4.dart';
import '../widgets/Home_Item5.dart';
import '../widgets/Home_Item6.dart';
import '../widgets/Home_Item7.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<int, bool> favoriteMap = {}; // Map to store favorite state for each song

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: CustomScrollView(
        slivers: [
          //extra space:
          Home_Item1(),
          //Te
          //searching part
          Home_Item2(),
          Home_Item3(),
          //Text Part1
          Home_Item4(),


          //First List
          Home_Item5(),
          Home_Item6(),
          //Text part 2
          Home_Item7(),

          //second List
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                // Initialize favorite state for each song if not present
                if (!favoriteMap.containsKey(index)) {
                  favoriteMap[index] = false;
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SongDetailsScreen(
                            songName: songsData[index]["songName"],
                            imageUrl: songsData[index]["imageUrl"],
                            singerName: songsData[index]["singerName"],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:Border.all(color: Colors.grey,width: 2),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 8.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  //color: Colors.white,
                                  child: Image.asset("${songsData[index]["imageUrl"]}"),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${songsData[index]["songName"]}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Text("${songsData[index]["singerName"]}"),

                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                favoriteMap[index] = !favoriteMap[index]!; // Toggle the favorite state for this song
                              });
                            },
                            icon: Icon(
                              favoriteMap[index]! ? Icons.favorite : Icons.favorite_border,
                              color: favoriteMap[index]! ? Colors.red : null,
                            ),
                          ),
                        ],
                      ),
                      height: 100,
                    ),
                  ),
                );
              },
              childCount: songsData.length,
            ),
          ),
        ],
      ),
    );
  }
}













