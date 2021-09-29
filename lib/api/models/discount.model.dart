import 'package:dio/dio.dart';
import 'package:fundl_app/api/exceptions/api/age_limit.exception.dart';
import 'package:fundl_app/api/exceptions/api/coupon_limit.exception.dart';
import 'package:fundl_app/api/exceptions/forbidden.exception.dart';
import 'package:fundl_app/api/models/coupon.model.dart';
import 'package:fundl_app/api/models/public_file.model.dart';
import 'package:fundl_app/config/api.config.dart';
import 'package:json_annotation/json_annotation.dart';

import 'shop.model.dart';

part 'discount.model.g.dart';

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
    final response = await API.client.get('/discounts/$uuid');
    final discount = Discount.fromJson(response.data);
    return discount;
  }

  static Future<List<Discount>> getDiscounts() async {
    final response = await API.client.get('/discounts');
    final jsonList = List.from(response.data);
    final discounts = jsonList.map((json) => Discount.fromJson(json)).toList();
    return discounts;
  }

  Future<Coupon> generate() async {
    try {
      final response = await API.client.post('/discounts/$uuid/generate');

      final coupon = Coupon.fromJson(response.data);
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
