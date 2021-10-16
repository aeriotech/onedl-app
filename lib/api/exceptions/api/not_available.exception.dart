import 'package:fundl_app/api/exceptions/forbidden.exception.dart';

class NotAvailableException extends ForbiddenException {
  NotAvailableException(String message) : super(message);
}
