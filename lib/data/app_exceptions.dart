class AppException implements Exception {
  String? _message = "";
  String? _prefix = "";
  AppException([this._message, this._prefix]);
  String toString() {
    return "$_prefix $_message";
  }
}

class InternetException extends AppException {
  InternetException([String? _message]) : super(_message, "No internet");
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? _message]) : super(_message, "Request Time Out");
}

class ServerException extends AppException {
  ServerException([String? _message])
      : super(_message, "Internal Server Error");
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? _message]) : super(_message, "Invalid Url");
}

class FetchDataException extends AppException {
  FetchDataException([String? _message])
      : super(_message, "Error while fetching data");
}
