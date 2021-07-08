part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final User user;
  ActivateUser(this.user);
}

class ChangeAge extends UserEvent {
  final int age;
  ChangeAge(this.age);
}

class AddProfession extends UserEvent {}

class DeleteUser extends UserEvent {}