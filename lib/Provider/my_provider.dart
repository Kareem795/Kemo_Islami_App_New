import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier 
{
  ThemeMode appTheme = ThemeMode.light;
  Locale language_Code = const Locale("ar");
  late SharedPreferences shared_Preferences;

  Future<void> getThemeLang() async 
  {
    shared_Preferences = await SharedPreferences.getInstance();
    if (shared_Preferences.getBool("isArabic") ?? false) 
    {
      language_Code = const Locale("ar");
    } 
    else 
    {
      language_Code = const Locale("en");
    }

    if (shared_Preferences.getBool("isDark") ?? false) 
    {
      appTheme = ThemeMode.dark;
    } 
    else 
    {
      appTheme = ThemeMode.light;
    }
  }

  changeTheme(ThemeMode mode) 
  {
    appTheme = mode;
    notifyListeners();
    bool isDark = appTheme == ThemeMode.dark ? true : false;
    _saveTheme(isDark);
  }

  changeLanguage(Locale local) 
  {
    language_Code = local;
    notifyListeners();
    bool isArabic = local == const Locale("ar") ? true : false;
    _saveLang(isArabic);
  }


  void _saveLang(bool isArabic) 
  {
    shared_Preferences.setBool("isArabic", isArabic);
  }

  void _saveTheme(bool isDark) 
  {
    shared_Preferences.setBool("isDark", isDark);
  }

  
}