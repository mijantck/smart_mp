import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ApiClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? bearerToken = prefs.getString('token');

    headers ??= {};
    headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (bearerToken != null) 'Authorization': 'Bearer $bearerToken',
    });

    var response = await _inner.get(url, headers: headers);

    return response;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // Get the bearer token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? bearerToken = prefs.getString('token');

    // Set the request headers
    request.headers['Content-Type'] = 'application/json';
    request.headers['Accept'] = 'application/json';

    // Add the bearer token to the request headers if available
    if (bearerToken != null) {
      request.headers['Authorization'] = 'Bearer $bearerToken';
    }

    // Send the request using the inner client
    return _inner.send(request);
  }
}





