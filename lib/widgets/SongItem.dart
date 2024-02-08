import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SongItem extends StatelessWidget {
  const SongItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   Navigator.push(context, MaterialPageRoute(
      //     builder: (context) => SongDetailsScreen(
      //        ,
      //       songName: ,
      //     ),));
      // },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:Border.all(color: Colors.grey,width: 2),
          color: Colors.red,
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
                    color: Colors.white,),
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(""),
                    SizedBox(height: 10,),
                    Text("Sheeren"),

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
    );
  }
}