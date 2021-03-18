
import 'package:flutter/foundation.dart';

import 'package:sspian/src/models/profile.dart';


class ProfileProvider extends ChangeNotifier {
  Profile _profile;

  Profile get profile => _profile;

  void setProfile(profile) {
    _profile = profile;
  }
}
