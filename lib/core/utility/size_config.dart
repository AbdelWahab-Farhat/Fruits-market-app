

import 'package:flutter/cupertino.dart';

abstract class SizeConfig  {
  static double? viewWidth;
  static double? viewHeight;


  static initSizeConfig(BuildContext context){
    viewWidth = MediaQuery.sizeOf(context).width;
    viewHeight = MediaQuery.sizeOf(context).height;
  }
}