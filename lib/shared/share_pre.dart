

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesEditor {
  static SharedPreferences ? sharedPreferences;

  static Future makeInstance() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static Future putString({required String key , required String value}) async {
    await sharedPreferences?.setString(key , value);
  }

  static String? getString({required String key}){
    return sharedPreferences?.getString(key);
  }
  static   Future<bool> ? saveData({
    @required String? key ,
    @required dynamic value
  })async{
    if(value is String){
      return  await sharedPreferences!.setString(key.toString(), value);}

    if(value is int){
      return await sharedPreferences!.setInt(key.toString(), value);}

    if(value is bool){
      return await sharedPreferences!.setBool(key.toString(), value);}
    return await sharedPreferences!.setDouble(key.toString(), value);

  }

}