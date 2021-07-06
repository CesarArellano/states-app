import 'package:flutter/material.dart';
import 'package:states_app/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;

  User get user => this._user!;
  bool get existUser => ( this._user != null ) ? true : false;

}