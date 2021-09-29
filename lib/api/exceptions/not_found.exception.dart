import 'dart:io';

class NotFoundException extends HttpException {
  NotFoundException(String message) : super(message);
}
