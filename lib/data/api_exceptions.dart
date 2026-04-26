class AppExceptions implements Exception {
  String exceptionTitle, exceptionMsg;

  AppExceptions({required this.exceptionTitle, required this.exceptionMsg});

  @override
  String toString() {
    // TODO: implement toString
    return "$exceptionTitle : $exceptionMsg";
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException({required super.exceptionMsg})
    : super(exceptionTitle: "No internet connection");
}

class BadRequestException extends AppExceptions {
  BadRequestException({required super.exceptionMsg})
    : super(exceptionTitle: "Bad Request");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException({required super.exceptionMsg})
    : super(exceptionTitle: "Unauthorized");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException({required super.exceptionMsg})
    : super(exceptionTitle: "Invalid Input");
}

class FetchDataException extends AppExceptions {
  FetchDataException({required super.exceptionMsg})
    : super(exceptionTitle: "Error During Communication");
}

class ServerException extends AppExceptions {
  ServerException({required super.exceptionMsg})
      : super(exceptionTitle: "Server Error");
}

