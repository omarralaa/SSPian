import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/rendering.dart';

import 'package:sspian/src/app.dart';
import 'package:sspian/src/models/AuthServiceModel.dart';
import 'package:sspian/src/services/api/sspian_api_service.dart';

void main() {
  runApp(App());
  //debugPaintSizeEnabled = true;
  setup();
}

void setup() {
  GetIt.I.registerSingleton<AuthServiceModel>(AuthServiceModel());
  GetIt.I.registerSingleton<SSPApiService>(SSPApiService());
  GetIt.I.get<SSPApiService>().init();
}
