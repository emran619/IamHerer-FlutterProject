import 'package:flutter/material.dart';
import 'package:iamh/screens/companyauthscreen.dart';
import 'package:iamh/screens/homepagescreen.dart';
import 'package:iamh/screens/userloginscreen.dart';
import 'package:iamh/screens/usersignupscreem.dart';

void main() {
  runApp(MyApp());
}

//#440a67 Primary Color
//#93329e Accent Color
//#b4aee8 color 3 Color.fromRGBO(180, 174, 232, 1),
//#ffe3fe color 4 Color.fromRGBO(255, 227, 254, 1),
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iam Here Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(68, 10, 103, 1),
        accentColor: Color.fromRGBO(147, 50, 158, 1),
      //   textTheme: TextTheme(
      //     headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //     headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      //     bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      //   ),
       ),
       routes: {
         'companyAuthScreen' : (BuildContext context) => CompanyAuthScreen(),
         'usersignupScreen' : (BuildContext context) => UserSignUpScreen(),
         "userloginscreen" :(BuildContext context) => UserLoginScreen(),
       },
      home: HomePageScreen(),
    );
  }
}
