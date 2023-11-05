abstract class Failure {
  String msg;
  Failure({
    required this.msg,
  });
}

class ServerFailure extends Failure {
  ServerFailure({required super.msg});
}
