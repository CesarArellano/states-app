import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:states_app/models/user.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  
  UserBloc() : super( UserState() );

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is ActivateUser) {
      yield state.copyWith(user: event.user);
    } else if (event is ChangeAge) {
      yield state.copyWith(user: state.user!.copyWith(age: event.age));
    } else if (event is AddProfession) {
      final newProfessions = [ ...state.user!.professions!, 'Profession ${ state.user!.professions!.length + 1 }'];
      yield state.copyWith(user: state.user!.copyWith(professions: newProfessions));
    } else if (event is DeleteUser) {
      yield state.initialState();
    }
  }

}