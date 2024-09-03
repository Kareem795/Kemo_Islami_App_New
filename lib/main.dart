import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Screens/Home/home.dart';
import 'package:kemo_islami_app_2/Screens/Splash/splash.dart';

void main() 
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      routes: 
      {
        Splash.route_name: (_) => Splash(),
        Home.route_name: (_) => Home(),
      },
      initialRoute: Splash.route_name,
    );
  }
}
