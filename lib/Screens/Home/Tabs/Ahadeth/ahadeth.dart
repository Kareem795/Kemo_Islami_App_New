import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kemo_islami_app_2/Model/hadeth.dart';
import 'package:kemo_islami_app_2/Screens/Hadeth_Detils/hadeth_detils.dart';
import 'package:kemo_islami_app_2/Utils/app_assets.dart';
import 'package:kemo_islami_app_2/Utils/app_colors.dart';
import 'package:kemo_islami_app_2/Utils/app_style.dart';
import 'package:kemo_islami_app_2/Utils/contants.dart';

class Ahadeth extends StatefulWidget 
{

  Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> 
{
  List<Hadeth> hadeth_list = [];

  @override
  void initState() 
  {
    super.initState();
    read_ahadeth_file();
  }

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
            child: Image.asset(App_Assets.Ahdath_Tab_Logo)
          )
        ),

        Expanded
        (
          flex: 70,
          child: Stack
          (
            children: 
            [
              Column
              (
                children: 
                [
                  build_divider(),

                  const Text
                  (
                    "Hadiths" ,
                    textAlign: TextAlign.center,
                    style: App_Style.title,
                  ),

                  build_divider(),

                  build_ahadeth_list(),

                ],
              ),
            ]
          ),
        )
      ],
    );
  }

  Future read_ahadeth_file() async 
  {
    String ahadeth_file_contant = await rootBundle.loadString(Contants.hadeth_file_path);
    List<String> ahadeth_as_string = ahadeth_file_contant.split("#\r\n");
    for(int i = 0 ; i < ahadeth_as_string.length ; i++)
    {
      String hadeth = ahadeth_as_string[i];
      List<String> hadeth_lines = hadeth.split("\n");
      String hadeth_name = hadeth_lines[0];
      hadeth_lines.removeAt(0);
      String hadeth_contant = hadeth_lines.join();
      hadeth_list.add(Hadeth(title: hadeth_name.trim(), contant: hadeth_contant));
    }
    setState(() {});
  }

  Expanded build_ahadeth_list() => Expanded
  (
    flex: 70,
    child: hadeth_list.isEmpty ? CircularProgressIndicator(color: App_Colors.primary,) : ListView.builder
    (
      itemCount: hadeth_list.length, 
      itemBuilder: (context , index)
      {
        return InkWell
        (
          onTap: () 
          {
            Navigator.pushNamed
            (
              context, 
              hadeth_Details.route_name, 
              arguments: hadeth_list[index]
            );
          },

          child: Row
          (
            children: 
            [
              Expanded  //! اسماء الاحاديث
              (
                flex: 50,
                child: Text
                (
                  hadeth_list[index].title,
                  textAlign: TextAlign.center,
                  style: App_Style.title,
                )
              ),
            ],
          ),
        );
      }
    ),
  );

  Divider build_divider() => const Divider
  (
    color: App_Colors.primary, 
    thickness: 3 , 
    indent: 10, 
  );
}