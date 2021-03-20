import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/rendering.dart';

import 'package:sspian/src/app.dart';
import 'package:sspian/src/models/AuthServiceModel.dart';

void main() {
  runApp(App());
  //debugPaintSizeEnabled = true;
  setup();
}

void setup() {
  GetIt.I.registerSingleton<AuthServiceModel>(AuthServiceModel());
}
