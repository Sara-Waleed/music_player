import 'package:flutter/material.dart';
import 'package:music_player/screens/HomePage.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Stack(
      children: [
        Image.asset("assets/splash.jpg",fit: BoxFit.cover,height: double.infinity,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(child: Text("Getting Started",style: TextStyle(color: Colors.white,fontSize: 30),)),
           SizedBox(height: 20,),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.white,

                  )
                ),
              onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) => HomePage(),));
              },
                  child: Text("Let's Go",style: TextStyle(fontSize: 25),)),
            ),
            SizedBox(height: 80,),

          ],

        ),
      ],
    ),

    );
  }
}
