import 'package:dio/dio.dart';
import 'package:fundl_app/api/exceptions/api/age_limit.exception.dart';
import 'package:fundl_app/api/exceptions/api/coupon_limit.exception.dart';
import 'package:fundl_app/api/exceptions/forbidden.exception.dart';
import 'package:fundl_app/api/models/public_file.model.dart';
import 'package:fundl_app/api/services/api.service.dart';
import 'package:fundl_app/coupon/models/coupon.model.dart';
import 'package:fundl_app/discount/discount.service.dart';
import 'package:json_annotation/json_annotation.dart';

import 'shop.model.dart';

part 'discount.model.g.dart';

final client = ApiService.instance.client;
final discountService = client.getService<DiscountService>();

enum CouponType {
  @JsonValue('CODE')
  code,
  @JsonValue('URL')
  url,
}

@JsonSerializable()
class Discount {
  final String uuid;
  final String name;
  final String description;
  final CouponType couponType;
  final PublicFile thumbnail;
  final PublicFile image;
  final Shop? shop;

  Discount({
    required this.uuid,
    required this.name,
    required this.description,
    required this.couponType,
    required this.thumbnail,
    required this.image,
    required this.shop,
  });

  factory Discount.fromJson(Map<String, dynamic> json) => _$DiscountFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountToJson(this);

  static Future<Discount> getDiscount(String uuid) async {
    final response = await discountService.getDiscount(uuid);
    final discount = response.body;
    if (discount == null) {
      throw Exception('Discount not found');
    }
    return discount;
  }

  static Future<List<Discount>> getDiscounts() async {
    final response = await discountService.getDiscounts();
    final discounts = response.body;
    if (discounts == null) {
      throw Exception('Discounts not found');
    }
    return discounts;
  }

  Future<Coupon> generate() async {
    try {
      final response = await discountService.generate(uuid);
      final coupon = response.body;
      if (coupon == null) {
        throw Exception('Coupon not found');
      }
      return coupon;
    } on DioError catch (e) {
      final message = e.response?.data['message'];
      switch (e.response?.statusCode) {
        case 403:
          switch (e.response?.data['error']) {
            case 'age_limit':
              throw AgeLimitException(message);
            case 'coupon_limit':
              throw CouponLimitException(message);
          }
          throw ForbiddenException(message);
      }
      rethrow;
    }
  }
}
