import 'package:flutter/material.dart';
import 'package:states_app/models/user.dart';
import 'package:states_app/services/user_service.dart';


class PageTwo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                final newUser = new User(name: 'César', age: 21);
                userService.loadUser(newUser);
              }
            ),
            SizedBox(height: 10.0),
            MaterialButton(
              child: Text('Change Age', style: TextStyle(color: Colors.white)),
              color: Colors.red,
              onPressed: () {
                userService.changeAge(22);
              }
            ),
            SizedBox(height: 10.0),
            MaterialButton(
              child: Text('Add profession', style: TextStyle(color: Colors.white)),
              color: Colors.green,
              onPressed: () {}
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