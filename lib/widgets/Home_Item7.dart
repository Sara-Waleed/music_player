import 'package:flutter/material.dart';
import 'package:music_player/models/json_data.dart';
import 'package:music_player/screens/All_Songs.dart';
import 'package:music_player/screens/Single_songe_page.dart';
import 'package:music_player/widgets/Horizontal_List.dart';


class Home_Item7 extends StatelessWidget {
  const Home_Item7({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
    );
  }
}