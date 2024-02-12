import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/models/json_data.dart';
import 'package:music_player/screens/Single_songe_page.dart';
import '../cubit/FavoriteSongsCubit.dart';
import '../widgets/CustomSearchBarr.dart';

class AllSongsPage extends StatefulWidget {
  const AllSongsPage({Key? key}) : super(key: key);

  @override
  _AllSongsPageState createState() => _AllSongsPageState();
}

class _AllSongsPageState extends State<AllSongsPage> {
  late List<Map<String, dynamic>> filteredSongs;

  @override
  void initState() {
    super.initState();
    filteredSongs = List.from(songsData);
  }

  void filterSongs(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredSongs = songsData.where((song) =>
        song['songName'].toLowerCase().contains(query.toLowerCase()) ||
            song['singerName'].toLowerCase().contains(query.toLowerCase())).toList();
      } else {
        filteredSongs = List.from(songsData);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteSongsCubit(),
      child: AllSongsView(
        filterSongs: filterSongs,
        filteredSongs: filteredSongs,
      ),
    );
  }
}

class AllSongsView extends StatelessWidget {
  final Function(String) filterSongs;
  final List<Map<String, dynamic>> filteredSongs;

  const AllSongsView({
    required this.filterSongs,
    required this.filteredSongs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 40,
            ),
          ),
          SliverAppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            expandedHeight: 50.0,
            pinned: true,
            backgroundColor: Colors.indigo,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: CustomSearchBar(
                onSearch: filterSongs,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                Map<String, dynamic> song = filteredSongs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SongDetailsScreen(
                            songName: song["songName"],
                            imageUrl: song["imageUrl"],
                            singerName: song["singerName"],
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
                                  child: Image.asset("${song["imageUrl"]}"),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${song["songName"]}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Text("${song["singerName"]}"),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              // Handle favorite button tap
                            },
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
