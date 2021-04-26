import 'package:flutter/material.dart';
import 'package:iamh/screens/usersignupscreem.dart';

class UserLoginScreen extends StatefulWidget {
  static const routeName = 'userloginscreen';
  @override
  _UserLoginScreenState createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
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
                    child: UserLoginCard(),
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

class UserLoginCard extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final _passwordController = TextEditingController();
  FocusNode _passWordFocusNode;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 9.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 280,
              width: deviceSize.width * 0.75,
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    ////////Email
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'E-Mail',
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        // if (value.isEmpty || !value.contains('@')) {
                        //   return 'Invalid email';
                        // }
                      },
                      onSaved: (value) {
                        // _authData['email'] = value;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_passWordFocusNode);
                      },
                    ),
                    /////Password
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      obscureText: true,
                      focusNode: _passWordFocusNode,
                      controller: _passwordController,
                      validator: (value) {
                        // if (value.isEmpty || value.length < 5) {
                        //   return 'Password is too Short';
                        // }
                      },
                      onSaved: (value) {
                        //_authData['password'] = value;
                      },
                    ),
                    ///////////////////////
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                        child: Text('Login'),
                        onPressed: null
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                        child: Text('Sign Up Instead'),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(UserSignUpScreen.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
