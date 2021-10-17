import 'package:fundl_app/api/exceptions/api/not_available.exception.dart';
import 'package:fundl_app/api/exceptions/forbidden.exception.dart';
import 'package:fundl_app/api/models/public_file.model.dart';
import 'package:fundl_app/api/services/api.service.dart';
import 'package:fundl_app/common/models/category.model.dart';
import 'package:fundl_app/daily/dtos/daily_available.dto.dart';
import 'package:fundl_app/daily/dtos/daily_discount.dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily.model.g.dart';

final api = ApiService.instance;

@JsonSerializable()
class Daily {
  final String uuid;
  final String name;
  final PublicFile? background, thumbnail;

  Daily(this.uuid, this.name, this.background, this.thumbnail);

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson(Daily instance) => _$DailyToJson(instance);

  static Future<List<Daily>> getDailyList() async {
    final response = await api.client.get('/daily');
    final jsonList = List.from(response.data);
    final dailyList = jsonList.map((json) => Daily.fromJson(json)).toList();
    return dailyList;
  }

  static Future<List<Category>> getDailyCategories(String dailyUuid) async {
    final response = await api.client.get('/daily/$dailyUuid/categories');
    final jsonList = List.from(response.data);
    final categoryList = jsonList.map((json) => Category.fromJson(json)).toList();
    return categoryList;
  }

  static Future<DailyAvailableDto> isAvailable(String dailyUuid) async {
    final response = await api.client.get('/daily/$dailyUuid/available');
    final available = DailyAvailableDto.fromJson(response.data);
    return available;
  }

  static Future<DailyDiscountDto> claimDailyDiscount(String dailyUuid) async {
    try {
      final response = await api.client.post('/daily/$dailyUuid');
      final dailyDiscount = DailyDiscountDto.fromJson(response.data);
      return dailyDiscount;
    } on ForbiddenException {
      throw NotAvailableException('Daily discount is currently not available');
    }
  }
}
