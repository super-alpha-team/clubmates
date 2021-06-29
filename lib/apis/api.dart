import 'package:http/http.dart' as http;

class API {
  static final baseURL = 'https://clubmates.herokuapp.com/api/v1';

  static Future<http.Response> signIn(user) {
    final uri = Uri.parse(API.baseURL + '/user/sign');
    return http.post(
      uri,
      body: user,
    );
  }

  static Future<http.Response> post(String url, body, String token) {
    final uri = Uri.parse(url);
    return http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token
      },
      body: body,
    );
  }

  static Future<http.Response> get(String url, String token) {
    final uri = Uri.parse(url);
    return http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token
      },
    );
  }

  static Future<http.Response> patch(String url, body, String token) {
    final uri = Uri.parse(url);
    return http.patch(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token
      },
      body: body,
    );
  }

  static bool successfulResponses(int statusCode) {
    return statusCode >= 200 && statusCode < 300;
  }
}
