import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  static double width;
  static double height;

  static MaterialColor primaryColorSwatch =
      MaterialColor(0xFFd63925, primaryColorMap);

  static Map<int, Color> primaryColorMap = {
    50: Color.fromRGBO(214, 57, 37, .1),
    100: Color.fromRGBO(214, 57, 37, .2),
    200: Color.fromRGBO(214, 57, 37, .3),
    300: Color.fromRGBO(214, 57, 37, .4),
    400: Color.fromRGBO(214, 57, 37, .5),
    500: Color.fromRGBO(214, 57, 37, .6),
    600: Color.fromRGBO(214, 57, 37, .7),
    700: Color.fromRGBO(214, 57, 37, .8),
    800: Color.fromRGBO(214, 57, 37, .9),
    900: Color.fromRGBO(214, 57, 37, 1),
  };

  static const colorPaletteArray = [
    0xff25a19c,
    0xffe64156,
    0xff536ddb,
    0xff2998e7,
    0xfff8c27c,
    0xff6ecf54,
  ];
}
