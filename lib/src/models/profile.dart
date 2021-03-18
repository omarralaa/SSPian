import 'dart:collection';

class Profile {
  String _id;
  String _userId;
  String _firstName;
  String _lastName;
  String _department;
  String _sspId;
  String _photo;
  HashSet<String> _coursesId;

  String get id => _id;
  String get userId => _userId;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get department => _department;
  String get sspId => _sspId;
  String get photo => _photo;
  HashSet<String> get enrolledCourses => _coursesId;

  bool get hasPhoto {
    return photo != 'no-photo.png';
  }

  String get photoUrl {
    return 'http://10.0.2.2:3000/uploads/$photo';
  }

  Profile(this._id, this._userId, this._firstName, this._lastName,
      this._department);

  Profile.fromJson(Map<String, dynamic> json) {
    _id = json['_id'];
    _userId = json['_userId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _department = json['department'];
    _sspId = json['sspID'];
    _photo = json['photo'];
    _coursesId = convertCoursesIdsToHashset(json['courses']);
  }

  HashSet<String> convertCoursesIdsToHashset(coursesIdsJson) {
    HashSet<String> idSet = HashSet<String>();

    for (var c in coursesIdsJson) {
      idSet.add(c);
    }

    return idSet;
  }

  Map<String, dynamic> toJson() {
    final coursesIds = _coursesId.toList();
    return {
      '_id': _id,
      '_userId': _userId,
      'firstName': firstName,
      'lastName': _lastName,
      'department': _department,
      'sspID': _sspId,
      'photo': _photo,
      'courses': coursesIds
    };
  }
}
