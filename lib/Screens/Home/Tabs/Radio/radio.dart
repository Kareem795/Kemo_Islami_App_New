import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Provider/my_provider.dart';
import 'package:kemo_islami_app_2/Utils/app_assets.dart';
import 'package:provider/provider.dart';

class My_Radio extends StatelessWidget 
{
  const My_Radio({super.key});

  @override
  Widget build(BuildContext context) 
  {
    var pro = Provider.of<MyProvider>(context);
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
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          Expanded
          (
            flex: 20,
            child: Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: 
              [
                InkWell //! previous
                (
                  onTap: () {}, 
                  child: Image.asset
                  (
                    pro.appTheme == ThemeMode.dark
                    ? App_Assets.Radio_previous_dark
                    : App_Assets.Radio_previous
                  )
                ),

                InkWell //! play
                (
                  onTap: () {}, 
                  child: Image.asset
                  (
                    pro.appTheme == ThemeMode.dark
                    ? App_Assets.Radio_play_dark
                    : App_Assets.Radio_play
                  )
                ),

                InkWell //! next
                (
                  onTap: () {}, 
                  child: Image.asset
                  (
                    pro.appTheme == ThemeMode.dark
                    ? App_Assets.Radio_next_dark
                    : App_Assets.Radio_next
                  )
                )
              ],
            ),
          ),
          const SizedBox(height: 65),
        ]
      ),
    );
  }
}