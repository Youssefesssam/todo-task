import 'package:flutter/material.dart';
import 'package:todo_task/ui/screens/homeScreen/homeScreen.dart';
import 'package:todo_task/ui/screens/SplashScreen/splashScreen.dart';
import 'package:todo_task/ui/utilites/theme/mytheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        SplashScreen.routeName:(_)=>SplashScreen(),
      },
      theme: MyTheme.lightTheme  ,
    );
  }
}

