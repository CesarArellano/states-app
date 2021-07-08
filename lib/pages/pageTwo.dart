import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_app/bloc/user/user_bloc.dart';
import 'package:states_app/models/user.dart';


class PageTwo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Two'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: Text('Set User', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final newUser = new User(
                  name: 'César',
                  age: 21,
                  professions: [
                    'Fullstack Developer',
                    'Gamer'
                  ]
                );
                userBloc.add(ActivateUser(newUser));
              }
            ),
            SizedBox(height: 10.0),
            MaterialButton(
              child: Text('Change Age', style: TextStyle(color: Colors.white)),
              color: Colors.red,
              onPressed: () => userBloc.add(ChangeAge(22)),
            ),
            SizedBox(height: 10.0),
            MaterialButton(
              child: Text('Add profession', style: TextStyle(color: Colors.white)),
              color: Colors.green,
              onPressed: () => userBloc.add(AddProfession()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}