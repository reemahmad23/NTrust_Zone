class Failure {
  final String message;

  Failure(this.message);
}


class ServerFailure extends Failure {
  final int statusCode;
  final String? statusMessage;

  ServerFailure({required this.statusCode, this.statusMessage, })
      : super('خطأ في الخادم: $statusCode - $statusMessage');
}
