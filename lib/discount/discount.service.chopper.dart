// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$DiscountService extends DiscountService {
  _$DiscountService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DiscountService;

  @override
  Future<Response<List<Discount>>> getDiscounts() {
    final $url = '/discounts';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<Discount>, Discount>($request);
  }

  @override
  Future<Response<Discount>> getDiscount(String uuid) {
    final $url = '/discounts/$uuid';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Discount, Discount>($request);
  }

  @override
  Future<Response<Coupon>> generate(String uuid) {
    final $url = '/discounts/$uuid/generate';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<Coupon, Coupon>($request);
  }
}
