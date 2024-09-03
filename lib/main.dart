import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Screens/Hadeth_Detils/hadeth_detils.dart';
import 'package:kemo_islami_app_2/Screens/Home/home.dart';
import 'package:kemo_islami_app_2/Screens/Splash/splash.dart';
import 'package:kemo_islami_app_2/Screens/Sura_Detils/sura_detils.dart';

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
        Splash.route_name: (_) => const Splash(),
        Home.route_name: (_) => const Home(),
        Sura_Detils.route_name: (_) => const Sura_Detils(),
        hadeth_Details.route_name: (_) => hadeth_Details(),

      },
      initialRoute: Splash.route_name,
    );
  }
}
