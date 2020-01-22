library network_service;
import 'package:http/http.dart' as http;
import 'package:network_service/network_response.dart';

class NetworkService {

  Future<NetworkResponse> get(String url, { Map<String, String> headers }) async {
    try {
      final response = await http.get(url, headers: headers ?? {});
      print('GET $url -> ${response.statusCode} body: ${response.body}');
      if(response.statusCode < 400 && response.statusCode >= 200) {
        return NetworkResponse(response.body, NetworkResponseType.success, response);
      } else if(response.statusCode == 401 || response.statusCode == 403) {
        return NetworkResponse(response.reasonPhrase, NetworkResponseType.unauthorized, response);
      } else {
        return NetworkResponse(response.reasonPhrase, NetworkResponseType.error, response);
      }
    } catch(e) {
      print('GET $url -> Error: ${e.toString()}');
      return NetworkResponse(e.toString(), NetworkResponseType.offline, null);
    }
  }

  Future<NetworkResponse> post(String url, String body, { Map<String, String> headers, void Function(http.Response) rawResponseHandler }) async {
    try {
      print('POST $url -> headers: $headers body: $body' );
      final response = await http.post(url, body: body, headers: headers ?? {},);
      print('POST $url -> ${response.statusCode} body: ${response.body}');
      if(rawResponseHandler != null) {
        rawResponseHandler(response);
      }
      if(response.statusCode < 400 && response.statusCode >= 200) {
        return NetworkResponse(response.body, NetworkResponseType.success, response);
      } else if(response.statusCode == 401 || response.statusCode == 403) {
        return NetworkResponse(response.body, NetworkResponseType.unauthorized, response);
      } else {
        return NetworkResponse(response.body, NetworkResponseType.error, response);
      }
    } catch(e) {
      print('GET $url -> Error: ${e.toString()}');
      return NetworkResponse(e.toString(), NetworkResponseType.offline, null);
    }
  }

  Future<NetworkResponse> put(String url, String body, { Map<String, String> headers }) async {
    try {
      final response = await http.put(url, body: body, headers: headers ?? {},);
      print('PUT $url -> ${response.statusCode} body: ${response.body}');
      if(response.statusCode < 400 && response.statusCode >= 200) {
        return NetworkResponse(response.body, NetworkResponseType.success, response);
      } else if(response.statusCode == 401 || response.statusCode == 403) {
        return NetworkResponse(response.body, NetworkResponseType.unauthorized, response);
      } else {
        return NetworkResponse(response.body, NetworkResponseType.error, response);
      }
    } catch(e) {
      print('GET $url -> Error: ${e.toString()}');
      return NetworkResponse(e.toString(), NetworkResponseType.offline, null);
    }
  }

  Future<NetworkResponse> delete(String url, { Map<String, String> headers }) async {
    try {
      final response = await http.delete(url, headers: headers ?? {});
      print('DELETE $url -> ${response.statusCode} body: ${response.body}');
      if(response.statusCode < 400 && response.statusCode >= 200) {
        return NetworkResponse(response.body, NetworkResponseType.success, response);
      } else if(response.statusCode == 401 || response.statusCode == 403) {
        return NetworkResponse(response.body, NetworkResponseType.unauthorized, response);
      } else {
        return NetworkResponse(response.body, NetworkResponseType.error, response);
      }
    } catch(e) {
      print('GET $url -> Error: ${e.toString()}');
      return NetworkResponse(e.toString(), NetworkResponseType.offline, null);
    }
  }
}
