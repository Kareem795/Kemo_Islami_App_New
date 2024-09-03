import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Provider/my_provider.dart';
import 'package:kemo_islami_app_2/Utils/app_colors.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget 
{
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) 
  {
    var pro = Provider.of<MyProvider>(context);
    return Container
    (
      padding: EdgeInsets.all(18.0),
      color:
          pro.appTheme == ThemeMode.dark ? App_Colors.primaryDark : Colors.white,
      child: Column
      (
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: 
        [
          InkWell
          (
            onTap: () 
            {
              pro.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },

            child: Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: 
              [
                Text
                (
                  "light",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith
                  (
                    fontSize: 24,
                    color: pro.appTheme == ThemeMode.light 
                                            ? App_Colors.primary 
                                            : Colors.white,
                  )
                ),
                pro.appTheme == ThemeMode.dark ? SizedBox() : Icon(Icons.done)
              ],
            ),
          ),

          SizedBox(height: 10,),

          InkWell
          (
            onTap: () 
            {
              pro.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },

            child: Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: 
              [
                Text
                (
                  "Dark",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith
                  (
                    fontSize: 24,
                      color: pro.appTheme == ThemeMode.dark
                                              ? App_Colors.accentDark
                                              : Colors.black,
                  )
                ),

                pro.appTheme == ThemeMode.light
                    ? SizedBox()
                    : Icon(Icons.done,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}