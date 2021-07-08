import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_app/bloc/user/user_cubit.dart';
import 'package:states_app/models/user.dart';

class PageOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chevron_right),
        onPressed: () => Navigator.pushNamed(context, 'pageTwo')
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: ( _, state ) {

      switch ( state.runtimeType ) {
        case InitialUser:
          return Center(child: Text('No hay información del usuario'));
        case ActiveUser:
          return UserInfo((state as ActiveUser).user);
        default:
          return Center(child: Text('Unknown state'));
      }
      //   if( state is InitialUser) {
      //     
      //   } else if( state is ActiveUser ){
      //     
      //   } else {
      //     
      //   }
      }
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  UserInfo(this.user);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile( title: Text('Name ${ user.name }')),
          ListTile( title: Text('Age ${ user.age }')),
          SizedBox(height: 20.0),
          Text('Professions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ...user.professions!.map((profession) => ListTile( title: Text(profession))).toList()
        ],
      )
    );
  }
}