import 'package:fundl_app/api/models/public_file.model.dart';
import 'package:fundl_app/api/services/api.service.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fundl_app/post/post.service.dart';

part 'post.model.g.dart';

final client = ApiService.instance.client;
final postService = client.getService<PostService>();

@JsonSerializable()
class Post {
  final String url;
  final PublicFile image;

  const Post({
    required this.url,
    required this.image,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  static Future<List<Post>> getPosts() async {
    final response = await postService.getPosts();
    final posts = response.body;
    if (posts == null) {
      throw Exception('Failed to load posts');
    }
    return posts;
  }
}
