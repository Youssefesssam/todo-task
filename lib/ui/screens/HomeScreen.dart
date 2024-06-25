import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
       decoration: BoxDecoration(
         image: DecorationImage(
             image: AssetImage("assets/Splashscreen"),fit: BoxFit.cover
         )
       ),
      ),
    );
  }
}
