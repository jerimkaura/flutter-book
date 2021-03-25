import 'dart:convert';

import 'package:SuperHeroes/models/SuperHero.dart';
import 'package:SuperHeroes/services/SuperheroRequest.dart';
import 'package:flutter/cupertino.dart';

class superHeroProvider with ChangeNotifier {
  SuperHero superhero;
  String errorMessage;
  bool loading;
  Future<bool> fetchSuperHero(heroName) async {
    setLoading(true);
    await SuperHeroRequest(heroName).fetchSuperHero().then((data) {
      setLoading(false);
      if (data.statusCode == 200) {
        setHero(SuperHero.fromJson(json.decode(data.body)));
      } else {
        print(data.body);
        Map<String, dynamic> result = json.decode(data.body);
        setMessage(result['message']);
      }
    });
    return isHero();
  }

  void setLoading(bool bool) {}

  void setHero(fromJson) {}

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  bool isHero() {
    return isHero != null ? true : false;
  }
}
