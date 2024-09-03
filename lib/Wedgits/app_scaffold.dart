import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Utils/app_assets.dart';
import 'package:kemo_islami_app_2/Utils/app_colors.dart';
import 'package:kemo_islami_app_2/Utils/app_style.dart';

class App_Scaffold extends StatelessWidget 
{

  final Widget? body;
  final String? appBar_title;
  final Widget? bottomNavigationBar;


  const App_Scaffold({super.key , this.body, this.appBar_title, this.bottomNavigationBar});

  // if you did not enter any of the parameters they will get the default

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      decoration: const BoxDecoration
      (
        image: DecorationImage
        (
          image: AssetImage(App_Assets.background)
        )

      ),
      
      child: Scaffold
      (
        backgroundColor: Colors.transparent,

        body: body, 
        
        appBar: AppBar
        (
          title: Text
          (
            appBar_title??"",
            style: App_Style.AppBar_TextStyle,
          ),
          centerTitle: true,
          backgroundColor: App_Colors.transparent,
          elevation: 0, // to make the elevation not appearing
        ),

        bottomNavigationBar: bottomNavigationBar,

      )
    );
  }
}