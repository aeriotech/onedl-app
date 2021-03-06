import 'package:fundl_app/api/models/discount.model.dart';
import 'package:fundl_app/api/services/api.service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coupon.model.g.dart';

final api = ApiService.instance;

@JsonSerializable()
class Coupon {
  final String discountUuid;
  final Discount discount;
  final String code;
  final DateTime? validTo;
  final DateTime createdAt;

  Coupon({
    required this.discountUuid,
    required this.code,
    required this.discount,
    required this.validTo,
    required this.createdAt,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);

  Map<String, dynamic> toJson() => _$CouponToJson(this);

  static Future<List<Coupon>> getCoupons() async {
    final response = await api.client.get('/coupons');

    final jsonList = List.from(response.data);
    final coupons = jsonList.map((json) => Coupon.fromJson(json)).toList();

    return coupons;
  }
}
