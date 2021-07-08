import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_app/bloc/user/user_bloc.dart';
import 'package:states_app/pages/pageOne.dart';
import 'package:states_app/pages/pageTwo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => new UserBloc()),
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