import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mygithub/Requests/GithubRequest.dart';
import 'package:mygithub/models/User.dart';

class UserProvider with ChangeNotifier {
  User user; //an instance of a user
  String errorMessage; //error message
  bool loading = false; //loading the page

  Future<bool> fetchUser(username) async {
    setLoading(true);
    // fetch user from the input supplied in the form
    await Github(username).fetchUser().then((data) {
      setLoading(false);
      if (data.statusCode == 200) {
        setUser(User.fromJson(json.decode(data.body)));
      } else {
        Map<String, dynamic> result = json.decode(data.body);
        setMessage(result['message']);
      }
    });
    return isUser(); //returns the fetched user
  }

  bool isLoading() {
    return loading; //return true if the app is loading the data
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setUser(value) {
    user = value;
    notifyListeners();
  }

  User getUser() {
    return user; //returns the fetched user
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() {
    return errorMessage;
  }

  bool isUser() {
    return user != null ? true : false; // returns true if user is not null, anf false otherwise
  }
}
