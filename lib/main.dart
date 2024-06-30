import 'package:flutter/material.dart';
import 'package:todo_task/ui/screens/homeScreen/homeScreen.dart';
import 'package:todo_task/ui/screens/SplashScreen/splashScreen.dart';
import 'package:todo_task/ui/utilites/theme/mytheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

