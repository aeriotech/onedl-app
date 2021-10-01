void openUrl(String url) {}

bool isHttp(String url) {
  final uri = Uri.parse(url);
  return uri.scheme == 'http' || uri.scheme == 'https';
}
