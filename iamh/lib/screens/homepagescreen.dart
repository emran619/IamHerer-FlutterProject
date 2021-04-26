import 'package:flutter/material.dart';
import 'package:iamh/widgets/company&userbuttons.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 227, 254, 1),
        appBar: AppBar(),
        body: Center(
          child: CompanyAndUserButtons()
        ),
      ),
    );
  }
}
