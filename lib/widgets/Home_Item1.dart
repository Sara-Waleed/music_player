import 'package:flutter/material.dart';
import 'package:music_player/models/json_data.dart';
import 'package:music_player/screens/All_Songs.dart';
import 'package:music_player/screens/Single_songe_page.dart';
import 'package:music_player/widgets/Horizontal_List.dart';

class Home_Item1 extends StatelessWidget {
  const Home_Item1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(height: 60,),
    );
  }
}