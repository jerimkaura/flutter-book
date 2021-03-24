import 'package:http/http.dart' as http;

class Github {
  final String userName;
  final String url = 'https://api.github.com/';
  static String clientId = '5e4aa803deb598561d20';
  static String clientSecret = '03c6c486bfd5aae69a31fb1648c5f66c4e5aec70';

  final String query = "?client_id=$clientId&client_secret=$clientSecret";

  Github(this.userName);

  Future<http.Response> fetchUser() {
    return http.get(url + 'users/' + userName);
  }

  Future<http.Response> fetchFollowers() {
    return http.get(url + 'users/' + userName + '/following');
  }

  Future<http.Response> fetchRepos() {
    return http.get(url + 'users/' + userName + '/repos');
  }
}
