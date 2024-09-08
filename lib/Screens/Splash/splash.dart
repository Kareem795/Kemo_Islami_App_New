import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Provider/my_provider.dart';
import 'package:kemo_islami_app_2/Screens/Home/home.dart';
import 'package:kemo_islami_app_2/Utils/app_assets.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget 
{
  static const String route_name = "splash";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> 
{

  void initState()
  {
    super.initState();

    // we use it to make splash screen show for 2 
    //show for 2 seconds and turn to another screen
    Future.delayed
    (
      Duration(seconds: 2) , ()
      {
        Navigator.pushReplacementNamed(context, Home.route_name);
      }
    );
    //----------------------------------------------
  }


  @override
  Widget build(BuildContext context) 
  {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold
    (
      body: Image.asset
      (
        pro.appTheme == ThemeMode.dark
        ? App_Assets.splash_dark
        : App_Assets.splash
      ),
    );
  }
}