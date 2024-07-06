import 'package:http/http.dart' as http;

class HttpHelper {
  static late Uri baseUrl;

  static void init() {
    baseUrl = Uri.parse("https://maly-123.000webhostapp.com/");
  }

  static Future<http.Response> getDate({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    Uri uri = baseUrl.replace(path: url, queryParameters: query);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
    };
    return await http.get(uri, headers: headers);
  }

  static Future<http.Response> postDate({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    Uri uri = baseUrl.replace(path: url, queryParameters: query);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return await http.post(uri, headers: headers, body: data);
  }

  static Future<http.Response> putDate({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    Uri uri = baseUrl.replace(path: url, queryParameters: query);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return await http.put(uri, headers: headers, body: data);
  }
}
