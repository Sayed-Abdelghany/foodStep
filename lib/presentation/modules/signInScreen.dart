import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('WELCOME',style: TextStyle(fontSize: 40.sp),));
  }
}
