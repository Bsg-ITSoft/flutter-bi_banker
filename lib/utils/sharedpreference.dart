import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UtilSharedPreferences {

  UtilSharedPreferences._();
  static UtilSharedPreferences sp = UtilSharedPreferences._();
  SharedPreferences? _prefs;
  Future<void> initSharedPreferences() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
  }

  String?  getString(String key){
      return _prefs?.getString(key) ?? '';
  }

  setString(String key,String value) {
    _prefs?.setString(key,value);
  }

    getInt(String key){
    return _prefs?.getInt(key) ?? -1;
  }

  setInt(String key,int value){
    _prefs?.setInt(key,value);
  }
}
