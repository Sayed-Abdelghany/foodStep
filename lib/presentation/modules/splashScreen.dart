import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:breakapp/constants/imagesPathes.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  final Widget ?nextScreen;
  const SplashScreen({Key? key,this.nextScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body:
      AnimatedSplashScreen(
          backgroundColor:Colors.green ,
          duration: 3000,
        nextScreen: nextScreen!,
        splash: LayoutBuilder(
          builder:(context,cons)=> SizedBox(
            height: cons.maxHeight*2.5,
            width: cons.maxWidth*2.5,
            child: Image.asset(logoPath),
          ),
        ),

      ),
    );
  }
}
