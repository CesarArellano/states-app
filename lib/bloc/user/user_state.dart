part of 'user_bloc.dart';

class UserState {
  final existUser;
  final User? user;

  UserState({ User? user })
    : this.user = user ?? null,
      existUser = (user != null) ? true : false;
}