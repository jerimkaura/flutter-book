import 'package:http/http.dart' as http;

class SuperHeroRequest {
  final String heroID;
  static String accessToken = '571251857179459';
  final String url = 'https://superheroapi.com/api/$accessToken';

  SuperHeroRequest(this.heroID);

  Future<http.Response> fetchSuperHero() {
    return http.get(url + heroID);
  }
}
