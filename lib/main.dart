import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seeker/screens/wrapper.dart';
import 'package:seeker/services/auth.dart';
// import './screens/Mylocation.dart';

import 'models/user.dart';


void main() => runApp(Seeker());

class Seeker extends StatelessWidget {
  const Seeker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
          child: MaterialApp(
        home: SafeArea(child: Wrapper()),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.lightBlue,
            canvasColor: Color.fromRGBO(244, 243, 243,1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                  body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                  body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                  title: TextStyle(
                      fontSize: 24,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold),
                )),
      ),
    );
  }
}

