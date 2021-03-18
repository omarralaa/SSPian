class Course {
  final String _id;
  final String _name;
  final String _code;
  final String _type;
  final int _creditHours;
  final String _term;

  String get id => _id;
  String get name => _name;
  String get code => _code;
  int get creditHours => _creditHours;
  String get term => _term;
  String get type => _type;

  Course.fromJson(Map<String, dynamic> json)
      : _id = json['_id'],
        _name = json['name'],
        _code = json['code'],
        _creditHours = json['creditHours'],
        _type = json['type'],
        _term = json['term'];
}
