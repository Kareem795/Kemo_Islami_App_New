import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Utils/app_assets.dart';
import 'package:kemo_islami_app_2/Utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../Provider/my_provider.dart';

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
    var pro = Provider.of<MyProvider>(context);
    return Stack(
      children: 
      [
        Image.asset(pro.appTheme == ThemeMode.dark
            ? App_Assets.background_dark
            : App_Assets.background),
        Scaffold
        (
          backgroundColor: Colors.transparent,

          body: body,

          appBar: AppBar
          (
            title: Text
            (
              appBar_title??"",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            centerTitle: true,
            backgroundColor: App_Colors.transparent,
            elevation: 0, // to make the elevation not appearing
          ),

          bottomNavigationBar: bottomNavigationBar,

        ),
      ]
    );
  }
}