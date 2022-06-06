import 'package:flutter/material.dart';


extension ContextExtension on BuildContext{
  double dynamicHeight(double value) => MediaQuery.of(this).size.height*value;
  double dynamicWidth(double value) => MediaQuery.of(this).size.width*value;
  Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

}