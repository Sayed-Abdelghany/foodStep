import 'package:flutter/material.dart';
class NoInterNetDialogue extends StatelessWidget {
  bool ?dismiss;
   NoInterNetDialogue({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: const AlertDialog(
      title:  Text('No Internet Connection') ,
      content:  Text('No Internet') ,
    ),

        onWillPop: ()async{return dismiss!?true:false;});
  }
}
