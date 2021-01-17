class Profile {
  String _id;
  String _userId;
  String _firstName;
  String _lastName;
  String _department;
  String _sspId;

  String get id => _id;
  String get userId => _userId;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get department => _department;
  String get sspId => _sspId;

  Profile(this._id, this._userId, this._firstName, this._lastName,
      this._department);

  Profile.fromJson(Map<String, dynamic> json) {
    _id = json['_id'];
    _userId = json['_userId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _department = json['department'];
    _sspId = json['sspID'];
  }
}
