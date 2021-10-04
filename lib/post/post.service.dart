import 'package:chopper/chopper.dart' hide Post;
import 'package:fundl_app/api/models/post.model.dart';

part 'post.service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostService extends ChopperService {
  static PostService create([ChopperClient? client]) => _$PostService(client);

  @Get()
  Future<Response<List<Post>>> getPosts();
}
