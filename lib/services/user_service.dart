import 'dart:async';
import 'package:states_app/models/user.dart';

class _UserService {
  User? _user;
  
  StreamController<User> _userStreamController = new StreamController<User>.broadcast();


  User get user => this._user!;

  bool get existUser => (this._user != null) ? true : false;

  Stream<User> get userStream => _userStreamController.stream;

  
  void loadUser(User user) {
    this._user = user;
    this._userStreamController.add(user);
  }

  void changeAge(int age) {
    this._user!.age = age;
    this._userStreamController.add(this.user);
  }

  dispose() { 
    this._userStreamController.close();
  }

}

final userService = new _UserService();