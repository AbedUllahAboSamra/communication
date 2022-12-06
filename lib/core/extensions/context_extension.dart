


import 'package:flutter/cupertino.dart';

extension contextExtension on BuildContext{

  bool checkIsLightTheme() {
    return MediaQuery.of(this).platformBrightness ==Brightness.light ;
  }



}