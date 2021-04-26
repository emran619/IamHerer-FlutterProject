import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }


class CompanyAuthCard extends StatefulWidget {
  const CompanyAuthCard({Key key}) : super(key: key);

  @override
  _CompanyAuthCardState createState() => _CompanyAuthCardState();
}

class _CompanyAuthCardState extends State<CompanyAuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formkey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  bool _isLoading = false;

  Future<void> _submit() async {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
      _controller.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _controller.reverse();
    }
  }

  AnimationController _controller;
  Animation<Offset> _slideAnimation;
  Animation<double> _opacityAnimation;
  final _passwordController = TextEditingController();
  final _jobrolefocusnode = FocusNode();
  final _addressfocusnode = FocusNode();
  final _descriptionfocusnode = FocusNode();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _slideAnimation = Tween<Offset>(begin: Offset(0, -1.5), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _opacityAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 9.0,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          height: _authMode == AuthMode.Signup ? devicesize.height : 280,
          constraints: BoxConstraints(
              minHeight: _authMode == AuthMode.Signup ? 320 : 280),
          width: devicesize.width * 0.75,
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'E-Mail',
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Invalid email';
                      }
                    },
                    onSaved: (value) {
                      _authData['email'] = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'Password is too Short';
                      }
                    },
                    onSaved: (value) {
                      _authData['password'] = value;
                    },
                  ),
                  AnimatedContainer(
                    constraints: BoxConstraints(
                      minHeight: _authMode == AuthMode.Signup ? 60 : 0,
                      maxHeight: _authMode == AuthMode.Signup ? 120 : 0,
                    ),
                    duration: Duration(milliseconds: 300),
                    curve: _authMode == AuthMode.Signup
                        ? Curves.fastLinearToSlowEaseIn
                        : Curves.linear,
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: TextFormField(
                          enabled: _authMode == AuthMode.Signup,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          obscureText: true,
                          validator: _authMode == AuthMode.Signup
                              ? (value) {
                                  if (value != _passwordController.text) {
                                    return 'Password Do not Match';
                                  }
                                }
                              : null,
                        ),
                      ),
                    ),
                  ),
                  //////////////////////Name Of Company
                  AnimatedContainer(
                    constraints: BoxConstraints(
                      minHeight: _authMode == AuthMode.Signup ? 60 : 0,
                      maxHeight: _authMode == AuthMode.Signup ? 120 : 0,
                    ),
                    duration: Duration(milliseconds: 600),
                    curve: _authMode == AuthMode.Signup
                        ? Curves.fastLinearToSlowEaseIn
                        : Curves.linear,
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: TextFormField(
                            enabled: _authMode == AuthMode.Signup,
                            decoration: InputDecoration(
                              labelText: 'Name Of Company',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_jobrolefocusnode);
                            },
                            obscureText: true,
                            validator: (val) {}),
                      ),
                    ),
                  ),
                  /////////////////////////Job Role
                  AnimatedContainer(
                    constraints: BoxConstraints(
                      minHeight: _authMode == AuthMode.Signup ? 60 : 0,
                      maxHeight: _authMode == AuthMode.Signup ? 120 : 0,
                    ),
                    duration: Duration(milliseconds: 900),
                    curve: _authMode == AuthMode.Signup
                        ? Curves.fastLinearToSlowEaseIn
                        : Curves.linear,
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Job Role",
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              // if (value.isEmpty) {
                              //   return 'Job Role is Request';
                              // }
                            },
                            focusNode: _jobrolefocusnode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_addressfocusnode);
                            },
                            onSaved: (value) {}),
                      ),
                    ),
                  ),
                  /////////// Address
                  AnimatedContainer(
                    constraints: BoxConstraints(
                      minHeight: _authMode == AuthMode.Signup ? 60 : 0,
                      maxHeight: _authMode == AuthMode.Signup ? 120 : 0,
                    ),
                    duration: Duration(milliseconds: 1200),
                    curve: _authMode == AuthMode.Signup
                        ? Curves.fastLinearToSlowEaseIn
                        : Curves.linear,
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Address",
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          validator: (String value) {
                            // if (value.isEmpty) {
                            //   return 'Address is Request';
                            // }
                            // if (value.length < 10) {
                            //   return 'Should be at least 10 characters long.';
                            // }
                            // return null;
                          },
                          focusNode: _addressfocusnode,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_descriptionfocusnode);
                          },
                          onSaved: (String value) {},
                        ),
                      ),
                    ),
                  ),
                  /////////// Description
                  AnimatedContainer(
                    constraints: BoxConstraints(
                      minHeight: _authMode == AuthMode.Signup ? 60 : 0,
                      maxHeight: _authMode == AuthMode.Signup ? 120 : 0,
                    ),
                    duration: Duration(milliseconds: 1500),
                    curve: _authMode == AuthMode.Signup
                        ? Curves.fastLinearToSlowEaseIn
                        : Curves.linear,
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Description",
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          validator: (String value) {
                            // if (value.isEmpty) {
                            //   return 'Description is Request';
                            // }
                            // if (value.length < 10) {
                            //   return 'Should be at least 10 characters long.';
                            // }
                            // return null;
                          },
                          focusNode: _descriptionfocusnode,
                          onSaved: (String value) {},
                        ),
                      ),
                    ),
                  ),
                  ///////////////////////
                  SizedBox(
                    height: 20,
                  ),
                  if (_isLoading)
                    CircularProgressIndicator()
                  else
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          _authMode == AuthMode.Login ? 'Login' : 'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: _submit,
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                      child: Text(
                          '${_authMode == AuthMode.Login ? 'Sign Up' : 'Login '} Instead'),
                      onPressed: _switchAuthMode,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
