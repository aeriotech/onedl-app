import 'dart:io';

class ConflictException extends HttpException {
  ConflictException(String message) : super(message);
}
