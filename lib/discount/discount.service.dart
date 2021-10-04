import 'package:chopper/chopper.dart';
import 'package:fundl_app/api/models/discount.model.dart';
import 'package:fundl_app/coupon/models/coupon.model.dart';

part 'discount.service.chopper.dart';

@ChopperApi(baseUrl: '/discounts')
abstract class DiscountService extends ChopperService {
  static DiscountService create([ChopperClient? client]) => _$DiscountService(client);

  @Get()
  Future<Response<List<Discount>>> getDiscounts();

  @Get(path: '/{uuid}')
  Future<Response<Discount>> getDiscount(@Path('uuid') String uuid);

  @Post(path: '/{uuid}/generate')
  Future<Response<Coupon>> generate(@Path('uuid') String uuid);
}
