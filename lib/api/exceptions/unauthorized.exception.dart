import 'dart:io';

class UnauthorizedException extends HttpException {
  UnauthorizedException(String message) : super(message);
}
