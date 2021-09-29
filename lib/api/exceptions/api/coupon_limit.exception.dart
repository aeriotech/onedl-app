import 'package:fundl_app/api/exceptions/forbidden.exception.dart';

class CouponLimitException extends ForbiddenException {
  CouponLimitException(String message) : super(message);
}
