import 'package:flutter/material.dart';
import 'package:music_player/models/json_data.dart';
import 'package:music_player/screens/All_Songs.dart';
import 'package:music_player/screens/Single_songe_page.dart';
import 'package:music_player/widgets/Horizontal_List.dart';

class Home_Item2 extends StatelessWidget {
  const Home_Item2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                    fontSize: 30,
                  ),
                ),
              ),
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
    );
  }
}