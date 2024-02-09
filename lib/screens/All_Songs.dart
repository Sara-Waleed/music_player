import 'package:flutter/material.dart';
import 'package:music_player/models/json_data.dart';
import 'package:music_player/screens/Single_songe_page.dart';

class AllSongsPage extends StatelessWidget {
  const AllSongsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:CustomScrollView(
        slivers: [
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
      )

    );
  }
}
