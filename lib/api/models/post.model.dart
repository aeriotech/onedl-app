import 'package:fundl_app/api/models/public_file.model.dart';
import 'package:fundl_app/api/services/api.service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.model.g.dart';

final api = ApiService.instance;

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
    final response = await api.client.get('/posts');

    final jsonList = List.from(response.data);
    final posts = jsonList.map((json) => Post.fromJson(json)).toList();

    return posts;
  }
}
