import 'dart:ui';

import 'package:flutter/material.dart';

class Utils {
  static Size size;

  static MaterialColor primaryColorSwatch = MaterialColor(0xFFDC3030, primaryColorMap);

  static Map<int, Color> primaryColorMap = {
    50: Color.fromRGBO(220, 48, 48, .1),
    100: Color.fromRGBO(220, 48, 48, .2),
    200: Color.fromRGBO(220, 48, 48, .3),
    300: Color.fromRGBO(220, 48, 48, .4),
    400: Color.fromRGBO(220, 48, 48, .5),
    500: Color.fromRGBO(220, 48, 48, .6),
    600: Color.fromRGBO(220, 48, 48, .7),
    700: Color.fromRGBO(220, 48, 48, .8),
    800: Color.fromRGBO(220, 48, 48, .9),
    900: Color.fromRGBO(220, 48, 48, 1),
  };
}
