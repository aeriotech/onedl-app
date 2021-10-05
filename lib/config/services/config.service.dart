import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fundl_app/config/models/config.model.dart';

const env = String.fromEnvironment('ENV', defaultValue: 'prod');

class ConfigService {
  static ConfigService? _instance;

  final Config config;

  ConfigService(this.config);

  static init() async {
    try {
      final data = await rootBundle.loadString('config/${env.toLowerCase()}.json');
      final jsonData = jsonDecode(data);
      _instance = ConfigService(Config.fromJson(jsonData));
    } catch (e) {
      _instance = ConfigService(Config('https://api.fundl.io'));
    }
  }

  static ConfigService get instance => _instance!;
}
