import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Provider/my_provider.dart';
import 'package:kemo_islami_app_2/Screens/Home/Tabs/Ahadeth/ahadeth.dart';
import 'package:kemo_islami_app_2/Screens/Home/Tabs/Quran/quran.dart';
import 'package:kemo_islami_app_2/Screens/Home/Tabs/Radio/radio.dart';
import 'package:kemo_islami_app_2/Screens/Home/Tabs/Sebha/sebha.dart';
import 'package:kemo_islami_app_2/Screens/Home/Tabs/Setting/setting.dart';
import 'package:kemo_islami_app_2/Utils/app_assets.dart';
import 'package:kemo_islami_app_2/Utils/app_colors.dart';
import 'package:kemo_islami_app_2/Wedgits/app_scaffold.dart';
import 'package:provider/provider.dart';

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
    var pro = Provider.of<MyProvider>(context);
    return App_Scaffold
    (
      appBar_title: "islami".tr(), 
      //! This application bar title will change to Arabic or English 
      //! depending on the program's language.
      body: tabs[selected_tab_index],
      bottomNavigationBar: build_bottom_Navigation_Bar(),
    );
  }

  BottomNavigationBar build_bottom_Navigation_Bar() => BottomNavigationBar
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

    items:
    [
      BottomNavigationBarItem(icon: ImageIcon(AssetImage(App_Assets.icon_Quran)) , label: "quran".tr()),
      BottomNavigationBarItem(icon: ImageIcon(AssetImage(App_Assets.icon_Ahdath)) , label: "ahdath".tr()),
      BottomNavigationBarItem(icon: ImageIcon(AssetImage(App_Assets.icon_Radio)) , label: "radio".tr()),
      BottomNavigationBarItem(icon: ImageIcon(AssetImage(App_Assets.icon_Sebha)) , label: "sebha".tr()),
      BottomNavigationBarItem(icon: Icon(Icons.settings) , label: "setting".tr()),
    ],
    
  );
}