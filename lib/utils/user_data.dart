import 'package:flutter/foundation.dart';
import 'package:ftokolink/models/user.dart';

class UserData extends ChangeNotifier {
  List<User> userList = [];

  void addUser(String email, String password) {
    final newUser = User(email, password);
    userList.add(newUser);
    notifyListeners();
  }
}
