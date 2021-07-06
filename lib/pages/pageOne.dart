import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_app/models/user.dart';

import 'package:states_app/services/user_service.dart';

class PageOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => userService.removeUser(),
          )
        ],
      ),
      body: userService.existUser
        ? UserInfo(userService.user)
        : Center(child: Text('No user info')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chevron_right),
        onPressed: () => Navigator.pushNamed(context, 'pageTwo')
      ),
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
          ...user.professions!.map(
            (profession) => ListTile(title: Text(profession))
          ).toList()
        ],
      )
    );
  }
}