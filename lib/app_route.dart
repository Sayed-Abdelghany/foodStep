import 'package:breakapp/constants/screens.dart';
import 'package:breakapp/data/data.local/casheHelper.dart';
import 'package:breakapp/presentation/modules/introductionScreen.dart';
import 'package:breakapp/presentation/modules/signInScreen.dart';
import 'package:breakapp/presentation/modules/splashScreen.dart';
import 'package:flutter/material.dart';
class AppRoute
{
Route ? onGenerateRoute(RouteSettings routeSettings)
{
 switch(routeSettings.name)
 {
   case splashPath:
     return MaterialPageRoute(builder: (_)
     {
       bool onBoard = CasheHelper.getKey('onBoarding');
     if (onBoard )
     {
     return const SplashScreen (nextScreen: SignInScreen(),);
     }
     else
     {
     return SplashScreen(nextScreen: IntroductionScreen(),);
     }
     });
   case introPath:
     return MaterialPageRoute(builder: (_)=>IntroductionScreen());
   case signInPath:
     return MaterialPageRoute(builder: (_)=>const SignInScreen());
 }
 return null;
}
}