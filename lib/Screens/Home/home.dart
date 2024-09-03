import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Screens/Home/Tabs/Ahadeth/ahadeth.dart';
import 'package:kemo_islami_app_2/Screens/Home/Tabs/Quran/quran.dart';
import 'package:kemo_islami_app_2/Screens/Home/Tabs/Radio/radio.dart';
import 'package:kemo_islami_app_2/Screens/Home/Tabs/Sebha/sebha.dart';
import 'package:kemo_islami_app_2/Screens/Home/Tabs/Setting/setting.dart';
import 'package:kemo_islami_app_2/Utils/app_assets.dart';
import 'package:kemo_islami_app_2/Utils/app_colors.dart';

class Home extends StatefulWidget 
{
  static const String route_name = "home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> 
{
  int selected_tab_index = 0;
  List<Widget> tabs = [Quran() , Ahadeth() , My_Radio() , Sebha() , Setting()];
  //! Note: we use List to make move to another tabs more flexible

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      decoration: const BoxDecoration
      (
        image: DecorationImage(image: AssetImage(App_Assets.background))
      ),

      //! if you want to put a color in container and in the container 
      //! BoxDecoration you must put the color in the BoxDecoration
      //! not outside it

      child: Scaffold
      (
        backgroundColor: Colors.transparent,
        appBar: build_Appbar(),

        bottomNavigationBar: build_bottom_Navigation_Bar(),

        body: tabs[selected_tab_index],


      ),
    );
  }

  AppBar build_Appbar() => AppBar
  (
    title: Text("Islami"),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0, 
    //! وظيفة elevathion
    //! انو بيعملك ظل عشان يحسسك ان AppBar
    //! مرفوع لفوق 
    //! و لما خلتوا ب 0 ف انا كدا اخفيت ظل

  );
        
  Theme build_bottom_Navigation_Bar() => Theme
  (
    //! Note: we use Theme to solve the problem of the navigation bar color

    data: ThemeData(canvasColor: App_Colors.primary),
    child: BottomNavigationBar
    (
      currentIndex: selected_tab_index,
      //! Note: we use currentIndex to select tab

      onTap: (index) 
      {
        selected_tab_index = index;
        setState(() {}); 
        //! to update the UI with new selected tab index
      },

      selectedIconTheme: IconThemeData(size: 36),
      selectedItemColor: App_Colors.accent,

      items: const
      [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(App_Assets.icon_Quran)) , label: "Quran"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(App_Assets.icon_Ahdath)) , label: "Ahdath"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(App_Assets.icon_Radio)) , label: "Radio"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(App_Assets.icon_Sebha)) , label: "Sebha")
      ],
    ),
  );
}