import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kemo_islami_app_2/Screens/Hadeth_Detils/hadeth_detils.dart';
import 'package:kemo_islami_app_2/Screens/Home/Tabs/Setting/setting.dart';
import 'package:kemo_islami_app_2/Screens/Home/home.dart';
import 'package:kemo_islami_app_2/Screens/Splash/splash.dart';
import 'package:kemo_islami_app_2/Screens/Sura_Detils/sura_detils.dart';
import 'package:provider/provider.dart';

import 'Provider/my_provider.dart';

void main() async 
{
  WidgetsFlutterBinding.ensureInitialized();
  MyProvider appProvider = MyProvider();
  await appProvider.getThemeLang();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  return runApp
  (
    MultiProvider
    (
      providers: 
      [
        ChangeNotifierProvider
        (
          create: (context) => appProvider,
        ),
      ],

      builder: (context, child) 
      {
        var pro = Provider.of<MyProvider>(context);
        return EasyLocalization
        (
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/translations',
          startLocale: Locale("en"),
          saveLocale: true,
          fallbackLocale: Locale("en"),
          child: MyApp()
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      
      routes: 
      {
        Splash.route_name: (_) => const Splash(),
        Home.route_name: (_) => const Home(),
        Sura_Detils.route_name: (_) => const Sura_Detils(),
        hadeth_Details.route_name: (_) => hadeth_Details(),
        Setting.routeNamed:(_) => Setting()

      },
      initialRoute: Splash.route_name,
    );
  }
}
