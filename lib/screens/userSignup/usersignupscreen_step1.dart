import 'package:flutter/material.dart';
import 'package:iamh/models/user.dart';
import 'package:iamh/screens/userSignup/usersignupscreen_step2.dart';

class PersonalInfoScreen extends StatefulWidget {
  static const routeName = 'psscreen';
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _passwordController = TextEditingController();
  FocusNode _lastNameFocusNode;
  FocusNode _emailFocusNode;
  FocusNode _passwordFocusNode;
  FocusNode _confirnPasswordFocusNode;
  FocusNode _jobrolefocusnode;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> personalformkey = GlobalKey();
    var _editedUser = User(
      id: DateTime.now().toString(),
      firstname: ' ',
      lastname: ' ',
      email: ' ',
      password: ' ',
    );

    void onSaved() {
      if (!personalformkey.currentState.validate()) {
        return;
      }
      personalformkey.currentState.save();
      Navigator.of(context).pushNamed(EducationScreen.routeName);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Step - 1"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: personalformkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //F Name
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Firstname is Request';
                      }
                    },
                    onSaved: (value) {
                      _editedUser = User(
                        id: _editedUser.id,
                        firstname: value,
                        lastname: _editedUser.lastname,
                        email: _editedUser.email,
                        password: _editedUser.password,
                      );
                    },
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_lastNameFocusNode);
                    },
                  ),
                  //L Name
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Lastname is Request';
                      }
                    },
                    onSaved: (value) {
                      _editedUser = User(
                        id: _editedUser.id,
                        firstname: _editedUser.firstname,
                        lastname: value,
                        email: _editedUser.email,
                      );
                    },
                    textInputAction: TextInputAction.next,
                    focusNode: _lastNameFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_emailFocusNode);
                    },
                  ),
                  //E Mail
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
                      _editedUser = User(
                        id: _editedUser.id,
                        firstname: _editedUser.firstname,
                        lastname: _editedUser.lastname,
                        email: value,
                        password: _editedUser.password,
                      );
                    },
                    textInputAction: TextInputAction.next,
                    focusNode: _emailFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                  ),
                  //Password
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
                      _editedUser = User(
                        id: _editedUser.id,
                        firstname: _editedUser.firstname,
                        lastname: _editedUser.lastname,
                        email: _editedUser.email,
                        password: value,
                      );
                    },
                    textInputAction: TextInputAction.next,
                    focusNode: _passwordFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_confirnPasswordFocusNode);
                    },
                  ),
                  //Confirm Password
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Password Do not Match';
                      }
                    },
                    textInputAction: TextInputAction.next,
                    focusNode: _confirnPasswordFocusNode,
                  ),
                  //
                  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 20,bottom: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor),
                          child: Text("Save & Continue"),
                          onPressed: () {
                            // onSaved();
                            Navigator.of(context)
                                .pushNamed(EducationScreen.routeName);
                          },
                        ),
                      ),
                    ],
                  ),
                  // Center(
                  //   child: Container(
                  //     child:Image.asset("img/1.jpg"),
                  //      width: 100,
                  // height: 100,
                      
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// void createUser(User user) async {
//   final String apiUrl = " ....";
//   var formData = FormData.fromMap(
//       {'firstname': user.firstname, 'lastname': user.lastname});
//   final response = await Dio().post(apiUrl, data: formData);
//   if (response.statusCode == 201) {
//     final responseString = response.data;
//     print("\n\n\nPOST REQUEST IS:\n" + responseString);
//   }
// }
