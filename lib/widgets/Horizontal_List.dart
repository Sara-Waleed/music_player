import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/json_data.dart';
import 'package:music_player/screens/Single_songe_page.dart';

class Horizontal_List extends StatelessWidget {
  const Horizontal_List({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            songsData.length,
                (index) => GestureDetector(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          child: Image.asset("${songsData[index]["imageUrl"]}"),
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(right: 10),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text("${songsData[index]["songName"]}", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),

          ),
        ),
      ),
    );
  }
}
