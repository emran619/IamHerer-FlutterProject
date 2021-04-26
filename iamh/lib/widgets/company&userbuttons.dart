import 'package:flutter/material.dart';
import 'package:iamh/screens/companyauthscreen.dart';
import 'package:iamh/screens/userloginscreen.dart';
import 'package:iamh/screens/usersignupscreem.dart';

class CompanyAndUserButtons extends StatefulWidget {
  @override
  _CompanyAndUserButtonsState createState() => _CompanyAndUserButtonsState();
}

class _CompanyAndUserButtonsState extends State<CompanyAndUserButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(CompanyAuthScreen.routeName),
              child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 100,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "Company",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(UserLoginScreen.routeName),
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 100,
                color: Theme.of(context).primaryColor,
                child: Text(
                  "User",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
