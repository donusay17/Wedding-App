import 'package:flutter/foundation.dart';

class DynamicDarkMode with ChangeNotifier {
  bool _isDarkMode = false;


  get isDarkMode => this._isDarkMode;


  void setDarkMode(){
    this._isDarkMode = true;
    notifyListeners();
  }


  void setLightMode(){
    this._isDarkMode = false;
    notifyListeners();
  }


}