// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'age_confirmation.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$AgeConfirmationService extends AgeConfirmationService {
  _$AgeConfirmationService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AgeConfirmationService;

  @override
  Future<Response<dynamic>> confirmEmso(String emso) {
    final $url = '/age-confirmation/age-confirmation/emso/$emso';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
