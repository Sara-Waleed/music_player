import 'package:flutter/material.dart';
import 'package:music_player/models/json_data.dart';
import 'package:music_player/screens/Single_songe_page.dart';

class CustomSearchBarr extends StatelessWidget {
  final Function(String) onSearch;

  const CustomSearchBarr({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search icon press
              // You can implement search functionality here
            },
          ),
          hintText: 'Search...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onChanged: (value) {
          // Handle changes in the search text
          // You can use the 'value' for search suggestions or filtering
          onSearch(value);
        },
      ),
    );
  }
}