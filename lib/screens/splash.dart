import 'package:flutter/material.dart';
import 'package:music_player/screens/HomePage.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Stack(
      children: [
        Image.asset("assets/splash.gif",fit: BoxFit.cover,height: double.infinity,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(
              child: GestureDetector(
                onTap: (){
    Navigator.push(context,
    MaterialPageRoute(builder:
    (context) => HomePage(),));
    } ,
                child: Container(
                  height: 80,
                 width: 80,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(50),  
               border: Border.all(color: Colors.black),
             color: Colors.grey.withOpacity(0.2)
           ),
                    child: Center(child: Text(" Go",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))),
              ),
            ),


          ],

        ),
      ],
    ),

    );
  }
}
