import 'package:flutter/material.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, 'main');
    },);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Image.asset("assets/images/81986-movie.gif",height: 200,width: 200,),
      ),
    ));
  }
}
