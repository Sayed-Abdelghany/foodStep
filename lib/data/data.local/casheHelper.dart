import 'package:shared_preferences/shared_preferences.dart';
class CasheHelper
{
 static late SharedPreferences  sharedPreferences;
 static init()async
 {
   sharedPreferences = await SharedPreferences.getInstance();
 }
 static putBool(key,value)
 {
   sharedPreferences.setBool(key, value);
 }
 static getKey(key)
 {
 sharedPreferences.get(key)??false;
 }
}