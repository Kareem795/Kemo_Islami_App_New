import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kemo_islami_app_2/Model/hadeth.dart';
import 'package:kemo_islami_app_2/Utils/app_colors.dart';
import 'package:kemo_islami_app_2/Utils/app_style.dart';
import 'package:kemo_islami_app_2/Wedgits/app_scaffold.dart';


class hadeth_Details extends StatefulWidget 
{
  hadeth_Details({super.key});

  static const String route_name = "hadeth_details";

  @override
  State<hadeth_Details> createState() => _hadeth_DetailsState();
}

class _hadeth_DetailsState extends State<hadeth_Details> 
{
  @override
  Widget build(BuildContext context) 
  {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return App_Scaffold
    (
      appBar_title: hadeth.title,
      body: build_hadeth_contant(hadeth.contant),
    );
  }

  Widget build_hadeth_contant(String contant) => Center
  (
    child: Container
    (
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration
      (
        color: App_Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView
      (
        child: Text
        (
          contant , 
          textAlign: TextAlign.center,
          textDirection:TextDirection.rtl,
          style: App_Style.title.copyWith(fontSize: 16),
        ),
      )
    ),
  );

}