import 'dart:convert';

import 'package:clubmate/apis/api.dart';
import 'package:clubmate/apis/user_api.dart';
import 'package:clubmate/models/activity.dart';

class ActivityAPI {
  ActivityAPI._privateConstructor();
  static final ActivityAPI instance = ActivityAPI._privateConstructor();

  Future<Map<String, dynamic>> create(body) async {
    final url = API.baseURL + '/activity';
    final token = UserAPI.instance.token;
    final response = await API.post(url, body, token);
    if (API.successfulResponses(response.statusCode)) {
      try {
        final data = json.decode(response.body);
        return data;
      } catch (error) {
        print('ActivityAPI - Create - Decode - Error');
        print(error.toString());
      }
    } else {
      print('ActivityAPI - Create - Response');
      print('Status Code: ${response.statusCode}');
      print('Body: ' + response.body);
    }
    return null;
  }

  Future<List<Activity>> all() async {
    final url = API.baseURL + '/activity';
    final response = await API.get(url, '');
    if (API.successfulResponses(response.statusCode)) {
      try {
        final data = json.decode(response.body);
        if ('success' == data['status']) {
          List apiResult = data['data']['result'];
          final result = apiResult.map((e) => Activity.fromJson(e)).toList();
          return result;
        }
      } catch (error) {
        print('ActivityAPI - all - Decode - Error');
        print(error.toString());
      }
    } else {
      print('ActivityAPI - all - Response');
      print('Status Code: ${response.statusCode}');
      print('Body: ' + response.body);
    }
    return null;
  }

  Future<dynamic> me() async {
    final url = API.baseURL + '/activity/me';
    final token = UserAPI.instance.token;
    final response = await API.get(url, token);
    if (API.successfulResponses(response.statusCode)) {
      try {
        final data = json.decode(response.body);
        return data;
      } catch (error) {
        print('ActivityAPI - all - Decode - Error');
        print(error.toString());
      }
    } else {
      print('ActivityAPI - all - Response');
      print('Status Code: ${response.statusCode}');
      print('Body: ' + response.body);
    }
    return null;
  }

  Future<dynamic> listRequest() async {
    final url = API.baseURL + '/activity/me';
    final token = UserAPI.instance.token;
    final response = await API.get(url, token);
    if (API.successfulResponses(response.statusCode)) {
      try {
        final data = json.decode(response.body);
        return data;
      } catch (error) {
        print('ActivityAPI - all - Decode - Error');
        print(error.toString());
      }
    } else {
      print('ActivityAPI - all - Response');
      print('Status Code: ${response.statusCode}');
      print('Body: ' + response.body);
    }
    return null;
  }
}
