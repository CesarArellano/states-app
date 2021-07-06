import 'package:flutter/material.dart';
import 'package:states_app/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;

  User get user => this._user!;
  bool get existUser => ( this._user != null ) ? true : false;

  set user(User user) {
    this._user = user;
    notifyListeners();
  }

  void changeAge(int age) {
    if(existUser) {
      this._user!.age = age;
      notifyListeners();
    } 
  }

  void removeUser() {
    this._user = null;
    notifyListeners();
  }

  void addProfession() {
    if(existUser) {
      this._user!.professions!.add('Profession ${ this._user!.professions!.length +1 }');
      notifyListeners();
    }
  }
}