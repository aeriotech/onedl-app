// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coming_soon.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ComingSoonService extends ComingSoonService {
  _$ComingSoonService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ComingSoonService;

  @override
  Future<Response<List<ComingSoon>>> getComingSoon() {
    final $url = '/user';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ComingSoon>, ComingSoon>($request);
  }
}
