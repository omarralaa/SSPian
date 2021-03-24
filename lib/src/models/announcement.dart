class Announcement {
  final String _id;
  final String _courseId;
  final String _profileId;
  final String _title;
  final String _body;
  final int _likes;
  final DateTime _dateCreated;

  String get id => _id;
  String get courseId => _courseId;
  String get profileId => _profileId;
  String get title => _title;
  String get body => _body;
  int get likes => _likes;
  DateTime get dateCreated => _dateCreated;

  Announcement.fromJson(Map<String, dynamic> json)
      : _id = json['_id'],
        _courseId = json['_courseId'],
        _profileId = json['_profileId'],
        _title = json['title'],
        _body = json['body'],
        _likes = json['likes'],
        _dateCreated = DateTime.parse(json['createdAt']) ;
}
