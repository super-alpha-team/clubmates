import 'dart:convert';
import 'package:clubmate/apis/api.dart';
import 'package:clubmate/apis/user_api.dart';
import 'package:clubmate/models/club.dart';
import 'package:clubmate/models/club_member.dart';

class ClubAPI {
  ClubAPI._privateConstructor();
  static final ClubAPI instance = ClubAPI._privateConstructor();

  Future<Map<String, dynamic>> create(body) async {
    final url = API.baseURL + '/club';
    final token = UserAPI.instance.token;
    final response = await API.post(url, body, token);
    if (API.successfulResponses(response.statusCode)) {
      try {
        final data = json.decode(response.body);
        return data;
      } catch (error) {
        print('ClubAPI - Create - Decode - Error');
        print(error.toString());
      }
    } else {
      print('ClubAPI - Create - Response');
      print('Status Code: ${response.statusCode}');
      print('Body: ' + response.body);
    }
    return null;
  }

  Future<List<Club>> all() async {
    final url = API.baseURL + '/club';
    final response = await API.get(url, '');
    if (API.successfulResponses(response.statusCode)) {
      try {
        final data = json.decode(response.body);
        if ('success' == data['status']) {
          List apiResult = data['data']['result'];
          final result = apiResult.map((e) => Club.fromJson(e)).toList();
          return result;
        }
      } catch (error) {
        print('ClubAPI - all - Decode - Error');
        print(error.toString());
      }
    } else {
      print('ClubAPI - all - Response');
      print('Status Code: ${response.statusCode}');
      print('Body: ' + response.body);
    }
    return null;
  }

  Future<List<ClubMember>> me() async {
    final url = API.baseURL + '/club/me';
    final token = UserAPI.instance.token;
    final response = await API.get(url, token);
    if (API.successfulResponses(response.statusCode)) {
      try {
        final data = json.decode(response.body);
        if ('success' == data['status']) {
          List apiResult = data['data']['result'];
          final result = apiResult.map((e) => ClubMember.fromJson(e)).toList();
          return result;
        }
      } catch (error) {
        print('ClubAPI - me - Decode - Error');
        print(error.toString());
      }
    } else {
      print('ClubAPI - me - Response');
      print('Status Code: ${response.statusCode}');
      print('Body: ' + response.body);
    }
    return null;
  }

  Future<dynamic> meRaw() async {
    final url = API.baseURL + '/club/me';
    final token = UserAPI.instance.token;
    final response = await API.get(url, token);
    if (API.successfulResponses(response.statusCode)) {
      try {
        final data = json.decode(response.body);
        return data;
      } catch (error) {
        print('ClubAPI - all - Decode - Error');
        print(error.toString());
      }
    } else {
      print('ClubAPI - all - Response');
      print('Status Code: ${response.statusCode}');
      print('Body: ' + response.body);
    }
    return null;
  }

  Future<dynamic> listRequest() async {
    final url = API.baseURL + '/club/me';
    final token = UserAPI.instance.token;
    final response = await API.get(url, token);
    if (API.successfulResponses(response.statusCode)) {
      try {
        final data = json.decode(response.body);
        return data;
      } catch (error) {
        print('ClubAPI - all - Decode - Error');
        print(error.toString());
      }
    } else {
      print('ClubAPI - all - Response');
      print('Status Code: ${response.statusCode}');
      print('Body: ' + response.body);
    }
    return null;
  }

  Future<dynamic> update(id, body) async {
    final url = API.baseURL + '/club/$id/';
    final token = UserAPI.instance.token;
    final response = await API.patch(url, body, token);
    if (API.successfulResponses(response.statusCode)) {
      try {
        final data = json.decode(response.body);
        print(data);
        return data;
      } catch (error) {
        print('ClubAPI - all - Decode - Error');
        print(error.toString());
      }
    } else {
      print('ClubAPI - all - Response');
      print('Status Code: ${response.statusCode}');
      print('Body: ' + response.body);
    }
    return null;
  }
}
