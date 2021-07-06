import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:states_app/pages/pageOne.dart';
import 'package:states_app/pages/pageTwo.dart';
import 'package:states_app/services/user_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pageOne',
        routes: {
          'pageOne': ( _ ) => PageOne(),
          'pageTwo': ( _ ) => PageTwo()
        }
      ),
    );
  }
}