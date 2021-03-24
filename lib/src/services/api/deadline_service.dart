import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sspian/src/models/deadline.dart';

import 'package:sspian/src/models/http_exception.dart';
import 'package:sspian/src/utils/service_utils.dart';

class DeadlineService with ServiceUtils {
  final url = ServiceUtils.baseUrl + '/deadlines';

  Future<List<Deadline>> getDeadlines(Map<String, String> query) async {
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-auth-token': token,
    };

    String queryString = Uri(queryParameters: query).query;
    final uri = Uri.parse(url + '?' + queryString);

    try {
      final response = await http
          .get(
            uri,
            headers: requestHeaders,
          )
          .timeout(
            timeout,
            onTimeout: () => throw HttpException('Server Timed out'),
          );

      final responseData = json.decode(response.body);

      if (responseData['error'] != null || responseData['success'] == false)
        throw HttpException(responseData['error']);

      final data = responseData['data'];
      List<Deadline> deadlines = [];

      for (var ac in data) {
        Deadline an = Deadline.fromJson(ac);
        deadlines.add(an);
      }

      return deadlines;
    } catch (err) {
      throw (err);
    }
  }
}
