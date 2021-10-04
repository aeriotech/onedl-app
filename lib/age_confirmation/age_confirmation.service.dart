import 'package:chopper/chopper.dart';
import 'package:fundl_app/api/services/api.service.dart';

part 'age_confirmation.service.chopper.dart';

final client = ApiService.instance.client;
final ageConfirmationService = client.getService<AgeConfirmationService>();

@ChopperApi(baseUrl: '/age-confirmation')
abstract class AgeConfirmationService extends ChopperService {
  @Post(path: '/age-confirmation/emso/{emso}')
  Future<Response> confirmEmso(@Path('emso') String emso);

  static Future<void> confirmAge(String emso) async {
    await ageConfirmationService.confirmEmso(emso);
  }
}
