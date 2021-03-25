import 'package:http/http.dart' as http;

class Github {
  final String userName;
  final String url = 'https://api.github.com/';
  static String clientId = 'CLIENT_ID';
  static String clientSecret = 'CLIENT_SECRET';

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
