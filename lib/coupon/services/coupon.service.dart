import 'package:chopper/chopper.dart';
import 'package:fundl_app/coupon/models/coupon.model.dart';

part 'coupon.service.chopper.dart';

@ChopperApi(baseUrl: '/coupons')
abstract class CouponService extends ChopperService {
  static CouponService create([ChopperClient? client]) => _$CouponService(client);

  @Get()
  Future<Response<List<Coupon>>> getCoupons();
}
