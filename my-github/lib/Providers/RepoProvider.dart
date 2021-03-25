import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mygithub/Requests/GithubRequest.dart';
import 'package:mygithub/models/Repo.dart';

class RepoProvider with ChangeNotifier {
  // Repository class instance
  Repository repository;
  String errorMessage;
  bool loading = false;
  Future<bool> fetchRepos(username) async {
    setLoading(true);
    await Github(username).fetchRepos().then((data) {
      setLoading(false);
      if (data.statusCode == 200) {
        setRepository(Repository.fromJson(json.decode(data.body)));
      } else {
        print(data.body);
        Map<String, dynamic> result = json.decode(data.body);
        setMessage(result['message']);
      }
    });
    return isRepository();
  }

  bool isLoading() {
    return loading;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setRepository(value) {
    repository = value;
    notifyListeners();
  }

  Repository getRepository() {
    return repository;
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() {
    return errorMessage;
  }

  bool isRepository() {
    return repository != null ? true : false;
  }
}
