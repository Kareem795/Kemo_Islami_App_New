import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Provider/my_provider.dart';
import 'package:kemo_islami_app_2/Utils/app_colors.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget 
{
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) 
  {
    var pro = Provider.of<MyProvider>(context);
    return Container
    (
      padding: EdgeInsets.all(18.0),
      child: Column
      (
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: 
        [
          GestureDetector
          (
            onTap: () {},
            child: InkWell
            (
              onTap: () 
              {
                context.setLocale(Locale("ar"));
                //! to turn the application into a arabic mode
              },

              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: 
                [
                  Text
                  (
                    "arabic".tr(),
                    style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: App_Colors.primary, fontSize: 24)
                  ),

                  Icon(Icons.done,)

                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          GestureDetector
          (
            onTap: () {},
            child: InkWell
            (
              onTap: () 
              {
                context.setLocale(Locale("en"));
                //! to turn the application into a english mode
              },

              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: 
                [
                  Text
                  (
                    "english".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: App_Colors.primary, fontSize: 24)
                  ),

                  Icon(Icons.done,)

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}