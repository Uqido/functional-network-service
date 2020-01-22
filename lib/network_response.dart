import 'package:http/http.dart';

class NetworkResponse {
  final String body;
  final NetworkResponseType type;
  final Response rawResponse;

  NetworkResponse(this.body, this.type, this.rawResponse);
}

enum NetworkResponseType {
  success, offline, error, unauthorized
}
