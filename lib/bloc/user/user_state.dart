part of 'user_cubit.dart';

@immutable
abstract class UserState { }

class InitialUser extends UserState {
  final existUser = false;
}

class ActiveUser extends UserState {
  final existUser = true;
  final User user;

  ActiveUser(this.user);
}