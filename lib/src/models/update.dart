abstract class Update {
  final String _id;
  final String _courseId;
  final String _profileId;
  final String _title;

  final String _body;
  final int _likes;
  final DateTime _dateCreated;
  final String _itemType;

  String get id => _id;
  String get courseId => _courseId;
  String get profileId => _profileId;
  String get title => _title;
  String get body => _body;
  String get itemType => _itemType;
  int get likes => _likes;
  DateTime get dateCreated => _dateCreated;

  Update.fromJson(Map<String, dynamic> json)
      : _id = json['_id'],
        _courseId = json['_courseId'],
        _profileId = json['_profileId'],
        _title = json['title'],
        _body = json['body'],
        _likes = json['likes'],
        _itemType = json['itemtype'] ?? 'announcement',
        _dateCreated = DateTime.parse(
          json['createdAt'],
        );
}
