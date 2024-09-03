import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Model/sura_details_args.dart';
import 'package:kemo_islami_app_2/Screens/Sura_Detils/sura_detils.dart';
import 'package:kemo_islami_app_2/Utils/app_assets.dart';
import 'package:kemo_islami_app_2/Utils/app_colors.dart';
import 'package:kemo_islami_app_2/Utils/app_style.dart';
import 'package:kemo_islami_app_2/Utils/contants.dart';

class Quran extends StatelessWidget 
{
  const Quran({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Column
    (
      crossAxisAlignment: CrossAxisAlignment.center,
      children: 
      [
        Expanded
        (
          flex: 30 ,
          child: Center
          (
            child: Image.asset(App_Assets.Quran_Tab_Logo)
          )
        ),

        Expanded
        (
          flex: 70,
          child: Stack
          (
            alignment: Alignment.center, 
            //! we use it to make the vertical line in the the center

            children: 
            [
              Column
              (
                children: 
                [
                  build_divider(),

                  const Row
                  (
                    children: 
                    [
                      Expanded
                      (
                        child: Text
                        (
                          "Sura Name" ,
                          textAlign: TextAlign.center,
                          style: App_Style.title,
                        )
                      ),

                      Expanded
                      (
                        child: Text
                        (
                          "Verses" ,
                          textAlign: TextAlign.center,
                          style: App_Style.title,
                        )
                      ),

                    ],

                  ),

                  build_divider(),

                  build_suras_list(),

                ],
              ),

              const VerticalDivider
              (
                thickness: 3 , 
                color: App_Colors.primary , 
                indent: 9,
              ) 
              //! The vertical line to separate the two lists.
              //! NOTE:  we use (indent: 9) to make the vertical line 
              //!        not to cross the line
              //! if you want to try delete (indent: 9)

            ]
          ),
        )

      ],

    );
  }

  Divider build_divider() => const Divider
  (
    color: App_Colors.primary, 
    thickness: 3 , 
    indent: 10, 
  );

  /*
    Container == Divider(color: App_Colors.primary, thickness: 3,),
    (
      width: double.infinity,
      height: 3,
      color: App_Colors.primary,
    ),
        
  */

  Expanded build_suras_list() => Expanded
  (
    flex: 70,
    child: ListView.builder
    (
      itemCount: Contants.suraNames.length, 
      //! take the number of Sura names and Verses to build the list of Sura names

      itemBuilder: (context , index)
      //! build the Sura names list and Verses list
      {
        return InkWell
        (
          onTap: () 
          {
            Navigator.pushNamed
            (
              context, 
              Sura_Detils.route_name,
              arguments: Sura_Details_Args
              (
                sura_name: Contants.suraNames[index],
                file_name: "${index + 1}.txt",
              )
            );
          },
          child: Row
          (
            children: 
            [
              Expanded  //! اسماء صور
              (
                flex: 50,
                child: Text
                (
                  Contants.suraNames[index], //! اسم الصورة
                  textAlign: TextAlign.center,
                  style: App_Style.title,
                )
              ),
          
              Expanded //! عدد الايات في كل صورة
              (
                flex: 50,
                child: 
                Text
                (
                  Contants.versesNumber[index].toString(), //! عدد اليات
                  textAlign: TextAlign.center,
                  style: App_Style.title,
                )
              )
          
            ],
          
          ),
        );
      }
    ),
  );

}