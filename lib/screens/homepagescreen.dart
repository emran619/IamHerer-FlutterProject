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
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Let's Get Started",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Container(
                  width: 330,
                  height: 330,
                  child: Image.asset("img/gs-01.png"),
                ),
              ),
              Container(
                width: 300,
                height: 140,
                child: Center(
                    child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        "Simple Steps Separate You",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                    SizedBox(height:5,),
                    FittedBox(
                      child: Text(
                        "From Seeing Jobs ,",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ),
                    ),SizedBox(height:5,),
                    FittedBox(
                      child: Text(
                        "Or Gaining New Employees",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ),
                    ),SizedBox(height:5,),
                    FittedBox(
                      child: Text(
                        "If You Are A Company ,",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ),
                    ),SizedBox(height:5,),
                    FittedBox(
                      child: Text(
                        "All Of This Through Our App .",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                  ],
                )),
              ),
              Center(child: CompanyAndUserButtons()),
            ],
          ),
        ),
      ),
    );
  }
}
