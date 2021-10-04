import 'package:chopper/chopper.dart';

import 'coming_soon.model.dart';

part 'coming_soon.service.chopper.dart';

@ChopperApi(baseUrl: '/user')
abstract class ComingSoonService extends ChopperService {
  @Get()
  Future<Response<List<ComingSoon>>> getComingSoon();
}
