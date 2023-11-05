abstract class MyException implements Exception {
  final String msg;
  MyException({
    required this.msg,
  });
}

class ServerException extends MyException {
  ServerException({required super.msg});
}
