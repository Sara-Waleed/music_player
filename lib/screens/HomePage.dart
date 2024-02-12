import 'package:flutter/material.dart';
import 'package:music_player/models/json_data.dart';
import 'package:music_player/screens/All_Songs.dart';
import 'package:music_player/screens/Single_songe_page.dart';
import 'package:music_player/widgets/CustomSearchBar.dart';
import 'package:music_player/widgets/Horizontal_List.dart';

import 'favoriteSongs.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: CustomScrollView(
        slivers: [
          //extra space:
          SliverToBoxAdapter(
            child: SizedBox(height: 60,),
          ),
          //Te
          //searching part
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 250,

              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,right: 8,left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
               Align(
                   alignment: Alignment.centerLeft,
                   child: Text("Welcom, Sara...",
                     style: TextStyle(
                         color: Colors.white,
                     fontSize: 30,),)),
                   SizedBox(height: 10,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Half of the height
                      child: Image.asset(
                        "assets/HomeImage.jpg",
                        height: 160,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    )

                  ],
                ),
              ),
              //Image.asset("assets/44zG.gif",fit: BoxFit.cover,),
            ),
          ),

         //Text Part1
          SliverToBoxAdapter(
            child:  Padding(
              padding: const EdgeInsets.only(right: 10.0,left: 10,bottom: 10),
              child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text("Recently Played", style: TextStyle(fontSize: 20, color: Colors.white)),
    ),
      GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>AllSongsPage(),));
          },
          child: Text("See All", style: TextStyle(fontSize: 20, color: Colors.grey))),
    ],
    ),
            ),

          ),


          //First List
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Horizontal_List(),
            ),
          ),

          //Text part 2
          SliverToBoxAdapter(
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Song List", style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AllSongsPage(),));
                      },
                      child: Text("See All", style: TextStyle(fontSize: 20, color: Colors.grey))),
                ],
              ),
            ),



          ),

          //second List
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
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
                          IconButton(onPressed: (){},
                              icon: Icon(Icons.favorite_border)),
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






