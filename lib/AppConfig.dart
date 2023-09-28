
import 'package:flutter/material.dart';
import 'package:flutter_bi_banker/utils/encryption.dart';
import '../utils/sharedpreference.dart';
enum Flavor {
  abhinandan
}

class AppConfig{
  String appName = "";
  String baseUrl = "";
  MaterialColor primaryColor = Colors.blue;
  Flavor flavor = Flavor.abhinandan;
  Widget toolBar;
  Encryption encryption;
  static AppConfig shared = AppConfig.create(toolBar: Container());

  factory AppConfig.create({
    String appName = "",
    String baseUrl = "",
    MaterialColor primaryColor = Colors.blue,
    Flavor flavor = Flavor.abhinandan,
    Widget? toolBar,
    Encryption? encryption,
  }) {
    return shared = AppConfig(appName, baseUrl, primaryColor, flavor,toolBar!,encryption!);
  }

  AppConfig(this.appName, this.baseUrl, this.primaryColor, this.flavor,this.toolBar,this.encryption);
}