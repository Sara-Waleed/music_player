import 'package:flutter/material.dart';
import 'package:music_player/models/json_data.dart';
import 'package:music_player/screens/Single_songe_page.dart';
import '../widgets/CustomSearchBarr.dart';


class AllSongsPage extends StatefulWidget {
  const AllSongsPage({Key? key}) : super(key: key);

  @override
  _AllSongsPageState createState() => _AllSongsPageState();
}

class _AllSongsPageState extends State<AllSongsPage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredSongs = songsData
        .where((song) => song['songName']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              color: Colors.grey,
            ),
          ),

          SliverAppBar(
            centerTitle: true,
automaticallyImplyLeading: false,
            expandedHeight: 50.0,
            pinned: true,
            backgroundColor: Colors.grey, // Change the background color here
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: CustomSearchBarr(
                onSearch: (query) {
                  setState(() {
                    searchQuery = query;
                  });
                },
              ),
            ),
          ),

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
                            songName: filteredSongs[index]["songName"],
                            imageUrl: filteredSongs[index]["imageUrl"],
                            singerName: filteredSongs[index]["singerName"],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 2),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  //color: Colors.white,
                                  child: Image.asset("${filteredSongs[index]["imageUrl"]}"),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${filteredSongs[index]["songName"]}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Text("${filteredSongs[index]["singerName"]}"),

                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                      height: 100,
                    ),
                  ),
                );
              },
              childCount: filteredSongs.length,
            ),
          ),
        ],
      ),
    );
  }
}

