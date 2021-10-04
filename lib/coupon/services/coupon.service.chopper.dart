// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$CouponService extends CouponService {
  _$CouponService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CouponService;

  @override
  Future<Response<List<Coupon>>> getCoupons() {
    final $url = '/coupons';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<Coupon>, Coupon>($request);
  }
}
