class AppException implements Exception {
  String title, msg;

  AppException({required this.title, required this.msg});

  String toError() {
    return "$title: $msg";
  }
}

class FetchDataException extends AppException{
  FetchDataException({required String errorMsg}) : super(title: "Network Error",msg: errorMsg);
}

class BadRequestException extends AppException{
  BadRequestException({required String errorMsg}) : super(title: "Invalid Request",msg: errorMsg);
}
class UnauthorisedException extends AppException{
  UnauthorisedException({required String errorMsg}) : super(title: "Unauthorised",msg: errorMsg);
}
class InvalidInputException extends AppException{
  InvalidInputException({required String errorMsg}) : super(title: "Invalid Input",msg: errorMsg);
}