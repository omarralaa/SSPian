
import 'package:flutter/foundation.dart';

import 'package:sspian/src/models/profile.dart' as p;


class Profile extends ChangeNotifier {
  p.Profile _profile;

  p.Profile get profile => _profile;

  void setProfile(profile) {
    _profile = profile;
    //notifyListeners();
  }
}
