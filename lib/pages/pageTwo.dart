import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_app/models/user.dart';

import 'package:states_app/services/user_service.dart';

class PageTwo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // We could add listen in false, but since the AppBar is redrawn, the listen should be true 
    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: userService.existUser
          ? Text('Name: ${ userService.user.name }')
          : Text('Page Two'),
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
                  professions: ['Fullstack Developer', 'Gamer']
                );
                
                userService.user = newUser;
              }
            ),
            SizedBox(height: 10.0),
            MaterialButton(
              child: Text('Change Age', style: TextStyle(color: Colors.white)),
              color: Colors.red,
              onPressed: () =>  userService.changeAge(25),
            ),
            SizedBox(height: 10.0),
            MaterialButton(
              child: Text('Add profession', style: TextStyle(color: Colors.white)),
              color: Colors.green,
              onPressed: () => userService.addProfession()
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