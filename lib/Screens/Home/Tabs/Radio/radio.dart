import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Utils/app_assets.dart';
import 'package:kemo_islami_app_2/Utils/app_style.dart';

class My_Radio extends StatelessWidget 
{
  const My_Radio({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Center
    (
      child: Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children: 
        [
          SizedBox(height: 150,),

          Padding
          (
            padding: const EdgeInsets.all(25.0),
            child: Container
            (
              width: double.infinity,
              alignment: Alignment.center,
              child: FittedBox(child: Image.asset(App_Assets.Radio_Tab_Logo))
              //! We use FittedBox to solve the small image problem to create the right size image for the application
            ),
          ),

          const SizedBox(height: 50),

          Text
          (
           "اذان القران الكريم",
            style: App_Style.title.copyWith(fontSize: 30),
          ),

          Expanded
          (
            flex: 20,
            child: Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: 
              [
                // ImageIcon(color: App_Colors.primary,AssetImage(App_Assets.Radio_previous)),
                // ImageIcon(color: App_Colors.primary,AssetImage(App_Assets.Radio_play)),
                // ImageIcon(color: App_Colors.primary,AssetImage(App_Assets.Radio_next)),

                InkWell(onTap: () {}, child: Image.asset(App_Assets.Radio_previous)),
                InkWell(onTap: () {}, child: Image.asset(App_Assets.Radio_play)),
                InkWell(onTap: () {}, child: Image.asset(App_Assets.Radio_next))
              ],
            ),
          ),

          const SizedBox(height: 65),
        ]
      ),
    );
  }
}