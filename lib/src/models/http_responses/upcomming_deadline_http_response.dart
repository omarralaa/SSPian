import 'package:sspian/src/models/deadline.dart';

class UpcommingDeadlineHttpResponse {
  int total = 0;
  int assignment = 0;
  int quiz = 0;
  int project = 0;

  List<Deadline> deadlines = [];

  UpcommingDeadlineHttpResponse.fromJson(json) {
    total = json['count']['totalCount'];
    assignment = json['count']['assignment'];
    quiz = json['count']['quiz'];
    project = json['count']['project'];

    for (var ac in json['data']['deadlines']) {
      Deadline an = Deadline.fromJson(ac);
      deadlines.add(an);
    }
  }
}
