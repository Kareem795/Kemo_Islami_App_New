import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Provider/my_provider.dart';
import 'package:kemo_islami_app_2/Utils/app_assets.dart';
import 'package:kemo_islami_app_2/Utils/app_colors.dart';
import 'package:provider/provider.dart';

class Sebha extends StatefulWidget 
{
  static const String route_named = "Sebha";

  Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> 
{
  int counter = 0;
  List<String> buttonChange = ["سبحان الله", "الله اكبر", "الحمد لله"];
  String text = "سبحان الله"; //! Initial text
  double spin = 0.0;

  void add() //! to update the counter and spin the Sebha body
  {
    setState(() 
    {
      spin += 0.05;
      counter++;
      updateText();
    });
  }

  void updateText() //! to update the text button
  {
    setState(() 
    {
      int index = (counter ~/ 33) % buttonChange.length;
      text = buttonChange[index];
    });
  }

  @override
  Widget build(BuildContext context) 
  {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold
    (
      backgroundColor: Colors.transparent,
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            Expanded
            (
              flex: 60,
              child: Stack
              (
                children: 
                [
                  Container
                  (
                    margin: EdgeInsets.only(left: 50, top: 14),
                    alignment: Alignment.topCenter,
                    child: Image.asset
                    (
                      pro.appTheme == ThemeMode.dark
                      ? App_Assets.Sebha_head_dark
                      : App_Assets.Sebha_head
                    )
                  ),

                  Container
                  (
                    margin: EdgeInsets.only(top: 50),
                    alignment: Alignment.center,
                    child: AnimatedRotation //! we use AnimatedRotation to make Sebha body spin
                    (
                      turns: spin, //! Control the rotation speed
                      duration: const Duration(seconds: 1),
                      child: Image.asset
                      (
                        pro.appTheme == ThemeMode.dark
                        ? App_Assets.Sebha_body_dark
                        : App_Assets.Sebha_body
                      )
                    ),
                  ),
                ]
              ),
            ),

            Container
            (
              child: Text
              (
                "number_of_tasbeehs".tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ),

            SizedBox(height: 40),

            Expanded
            (
              flex: 40,
              child: Column
              (
                children: 
                [
                  Container
                  (
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration
                    (
                      color: pro.appTheme == ThemeMode.dark 
                      ? App_Colors.primaryDark 
                      : App_Colors.primary,
                      borderRadius: BorderRadius.circular(20.0)
                    ),

                    child: Text
                    (
                      "$counter",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),

                  SizedBox(height: 20),

                  ElevatedButton
                  (
                    onPressed: add,
                    style: ElevatedButton.styleFrom
                    (
                      backgroundColor: pro.appTheme == ThemeMode.dark 
                      ? App_Colors.accentDark 
                      : App_Colors.primary,
                      shape: RoundedRectangleBorder
                      (
                        borderRadius: BorderRadius.circular(30.0),
                      )
                    ),

                    child: Text
                    (
                      text,
                      style: TextStyle
                      (
                        color: pro.appTheme == ThemeMode.dark
                        ? Colors.black 
                        : Colors.white,
                        fontSize: 30.0,
                        
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
