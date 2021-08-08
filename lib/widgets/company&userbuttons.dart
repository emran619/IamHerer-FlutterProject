import 'package:flutter/material.dart';

import '../models/user.dart';
import 'package:iamh/screens/companyauthscreen.dart';
import 'package:iamh/screens/userloginscreen.dart';
//import 'package:provider/provider.dart';

class CompanyAndUserButtons extends StatefulWidget {
  @override
  _CompanyAndUserButtonsState createState() => _CompanyAndUserButtonsState();
}

class _CompanyAndUserButtonsState extends State<CompanyAndUserButtons> {
  @override
  Widget build(BuildContext context) {
    //var _user = Provider.of<User>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(CompanyAuthScreen.routeName),
              child: Container(
                  alignment: Alignment.center,
                  width: 130,
                  height: 50,
                  color: Colors.white,
                  child: Text(
                    "Company",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: InkWell(
              onTap: () {
                //_user.addNewUser();
                Navigator.of(context).pushNamed(UserLoginScreen.routeName);
              },
              child: Container(
                alignment: Alignment.center,
                width: 130,
                height: 50,
                color: Colors.white,
                child: Text(
                  "User",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
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
