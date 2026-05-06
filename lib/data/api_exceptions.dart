class AppException implements Exception {
  String title, msg;

  AppException({required this.title, required this.msg});

  @override
  String toString() {
    return "$title: $msg";
  }
}

class NoInternetException extends AppException {
  NoInternetException({required super.msg})
      : super(title: "No Internet");
}

class BadRequestException extends AppException {
  BadRequestException({required super.msg})
      : super(title: "Bad Request");
}

class UnauthorisedException extends AppException {
  UnauthorisedException({required super.msg})
      : super(title: "Unauthorised");
}

class InvalidInputException extends AppException {
  InvalidInputException({required super.msg})
      : super(title: "Invalid Input");
}

class FetchDataException extends AppException {
  FetchDataException({required super.msg})
      : super(title: "Error During Communication");
}

class ServerException extends AppException {
  ServerException({required super.msg})
      : super(title: "Internal Server Error");
}

class NotFoundException extends AppException {
  NotFoundException({required super.msg})
      : super(title: "Resource Not Found");
}