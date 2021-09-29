import 'package:fundl_app/api/exceptions/forbidden.exception.dart';

class AgeLimitException extends ForbiddenException {
  AgeLimitException(String message) : super(message);
}
