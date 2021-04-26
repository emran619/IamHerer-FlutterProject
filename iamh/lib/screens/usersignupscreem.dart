import 'package:flutter/material.dart';

class UserSignUpScreen extends StatefulWidget {
  static const routeName = 'usersignupScreen';
  @override
  _UserSignUpScreenState createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            bottom: TabBar(
                indicatorColor: Theme.of(context).accentColor,
                indicatorWeight: 5.0,
                labelColor: Colors.white,
                labelPadding: EdgeInsets.only(top: 10.0),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Step 1"),
                  Tab(text: "Step 2"),
                  Tab(text: "Step 3"),
                ]),
          ),
          body: TabBarView(
            children: [PersonalInfo(), Education(), Experiances()],
          ),
        ),
      ),
    );
  }
}

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final GlobalKey<FormState> _personalformkey = GlobalKey();
  final _passwordController = TextEditingController();
  FocusNode _lastNameFocusNode;
  FocusNode _emailFocusNode;
  FocusNode _passwordFocusNode;
  FocusNode _confirnPasswordFocusNode;
  FocusNode _jobrolefocusnode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Form(
        key: _personalformkey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //////////////////////F Name
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {},
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_lastNameFocusNode);
                },
              ),
              //////////////////////L Name
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {},
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                focusNode: _lastNameFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
              ),
              //////////////////////E Mail
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-Mail',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  // if (value.isEmpty || !value.contains('@')) {
                  //   return 'Invalid email';
                  // }
                },
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                focusNode: _emailFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
              ),
              //////////////////////Password
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  // if (value.isEmpty || value.length < 5) {
                  //   return 'Password is too Short';
                  // }
                },
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                focusNode: _passwordFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context)
                      .requestFocus(_confirnPasswordFocusNode);
                },
              ),
              //////////////////////Confirm Password
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                obscureText: true,
                validator: (value) {
                  // if (value != _passwordController.text) {
                  //   return 'Password Do not Match';
                  // }
                },
                textInputAction: TextInputAction.next,
                focusNode: _confirnPasswordFocusNode,
              ),
              //////////////////////Job Role
              TextFormField(
                  decoration: InputDecoration(
                    labelText: "Job Role",
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    // if (value.isEmpty) {
                    //   return 'Job Role is Request';
                    // }
                  },
                  focusNode: _jobrolefocusnode,
                  onSaved: (value) {}),
            ],
          ),
        ),
      ),
    );
  }
}

class Education extends StatefulWidget {
  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final GlobalKey<FormState> _educationformkey = GlobalKey();
  FocusNode _speFocusNoode;
  FocusNode _startFoucsNode;
  FocusNode _endFocusNode;
  // List<DropdownMenuItem> items = [
  //   DropdownMenuItem(value: '1', child: Text("item 1")),
  //   DropdownMenuItem(child: Text("item 2")),
  //   DropdownMenuItem(child: Text("item 3")),
  //   DropdownMenuItem(child: Text("item 4")),
  //   DropdownMenuItem(child: Text("item 5")),
  // ];

  var _selecteditem = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Form(
        key: _educationformkey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //////////////////////الدراسة
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Collage',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {},
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_speFocusNoode);
                },
              ),
              // DropdownButtonHideUnderline(
              //   child: DropdownButton<String>(
              //     value: _selecteditem,
              //     items: [
              //       DropdownMenuItem( child: Text("item 1")),
              //       DropdownMenuItem(child: Text("item 2")),
              //       DropdownMenuItem(child: Text("item 3")),
              //       DropdownMenuItem(child: Text("item 4")),
              //       DropdownMenuItem(child: Text("item 5")),
              //     ],
              //     onChanged: (val) {
              //       setState(() {
              //         _selecteditem = val;
              //       });
              //     },
              //   ),
              // ),
              //////////////////////التخصص   specialty
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Specialty',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {},
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                focusNode: _speFocusNoode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_startFoucsNode);
                },
              ),
              ////////Start
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {},
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                focusNode: _startFoucsNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_endFocusNode);
                },
              ),
              //////////////////////End
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'End Date',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {},
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                focusNode: _endFocusNode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Experiances extends StatefulWidget {
  @override
  _ExperiancesState createState() => _ExperiancesState();
}

class _ExperiancesState extends State<Experiances> {
  final GlobalKey<FormState> _experiancesformkey = GlobalKey();
  FocusNode _companyNameFocusNode;
  FocusNode _lastUserWorks;
  FocusNode _startFoucsNode;
  FocusNode _endFocusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Form(
        key: _experiancesformkey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //////////////////////specialty
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Your business specialty',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {},
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_companyNameFocusNode);
                },
              ),
              //////////////////////Name Of Company
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Which Company Do You Work With ? ',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {},
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                focusNode: _companyNameFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_lastUserWorks);
                },
              ),
              //////////////////////Last User Works
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Put Your Latest Business',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {},
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                focusNode: _lastUserWorks,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_startFoucsNode);
                },
              ),
              ///////////Start
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {},
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                focusNode: _startFoucsNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_endFocusNode);
                },
              ),
              //////////////////////End
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'End Date',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {},
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                focusNode: _endFocusNode,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                  child: Text("Sign up"),
                  onPressed: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
