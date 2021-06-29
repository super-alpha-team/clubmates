import 'dart:convert';

import 'package:clubmate/apis/api.dart';

class UserAPI {
  UserAPI._privateConstructor();
  static final UserAPI instance = UserAPI._privateConstructor();
  String token = '';

  Future<Map<String, dynamic>> signIn(user) async {
    final response = await API.signIn(user);
    if (API.successfulResponses(response.statusCode)) {
      try {
        final data = json.decode(response.body);
        token = data['data']['token'];
        return data;
      } catch (error) {
        print(error.toString());
      }
    } else {
      print('UserAPI - Sign In - Response');
      print('Status Code: ${response.statusCode}');
      print('Body: ' + response.body);
    }
    return null;
  }

  Future<Map<String, dynamic>> update(user) async {
    final url = API.baseURL + '/user/updateMe';
    final response = await API.patch(url, user, token);
    if (response.statusCode == 200) {
      try {
        final data = json.decode(response.body);
        return data;
      } catch (error) {
        print(error.toString());
      }
    } else {
      print('UserAPI - Sign In - Response');
      print('Status Code: ${response.statusCode}');
      print('Body: ' + response.body);
    }
    return null;
  }

  Future<Map<String, dynamic>> me() async {
    final url = API.baseURL + '/user/me';
    final response = await API.get(url, token);
    if (response.statusCode == 200) {
      try {
        final data = json.decode(response.body);
        return data;
      } catch (error) {
        print(error.toString());
      }
    } else {
      print('UserAPI - Me - Response');
      print('Status Code: ${response.statusCode}');
      print('Body: ' + response.body);
    }
    return null;
  }
}
