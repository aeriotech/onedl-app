import 'package:fundl_app/api/services/api.service.dart';
import 'package:fundl_app/coupon/services/coupon.service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coupon.model.g.dart';

final couponService = ApiService.instance.client.getService<CouponService>();

@JsonSerializable()
class Coupon {
  final String discountUuid;
  final String code;
  final DateTime? validTo;
  final DateTime createdAt;

  Coupon({
    required this.discountUuid,
    required this.code,
    required this.validTo,
    required this.createdAt,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);

  Map<String, dynamic> toJson() => _$CouponToJson(this);

  static Future<List<Coupon>> getCoupons() async {
    final response = await couponService.getCoupons();
    final coupons = response.body;
    if (coupons == null) {
      throw Exception('Failed to load coupons');
    }
    return coupons;
  }
}
