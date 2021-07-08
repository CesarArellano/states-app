part of 'user_bloc.dart';

class UserState {
  final bool existUser;
  final User? user;

  UserState({ User? user })
    : this.user = user ?? null,
      existUser = (user != null) ? true : false;

  UserState copyWith({ User? user }) => UserState(
    user: user ?? this.user
  );

  UserState initialState() => new UserState();
}