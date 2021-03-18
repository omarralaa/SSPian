import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:sspian/src/app.dart';
import 'package:sspian/src/models/AuthServiceModel.dart';

void main() {
  runApp(App());
  setup();
}

void setup() {
  GetIt.I.registerSingleton<AuthServiceModel>(AuthServiceModel());

}
