import 'package:flutter/material.dart';
import 'package:iamh/widgets/companyauthcard.dart';


class CompanyAuthScreen extends StatelessWidget {
  static const routeName = 'companyAuthScreen';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: <Widget>[
            Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: CompanyAuthCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}