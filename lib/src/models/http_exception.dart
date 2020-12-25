class HttpException {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}
