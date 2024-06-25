import 'package:flutter/material.dart';

import 'HomeScreen.dart';


class SplashScreen extends StatefulWidget {
  static const String routeName = "Splash screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Image.asset('assets/Splashscreen.jpg'),
    );
  }
}
