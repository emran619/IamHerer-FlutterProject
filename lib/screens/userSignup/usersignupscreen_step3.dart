import 'package:flutter/material.dart';
import 'package:iamh/models/user.dart';
import 'package:iamh/screens/userprofilescreen.dart';
import 'package:provider/provider.dart';

class JopRole {
  String name;
  int id;
  JopRole(this.id, this.name);
  static List<JopRole> getJopRoles() {
    return <JopRole>[
      JopRole(1, "item 1"),
      JopRole(2, "item 2"),
      JopRole(3, "item 3"),
      JopRole(4, "item 4"),
    ];
  }
}

class ExperiancesScreen extends StatefulWidget {
  static const routeName = 'expscreen';
  @override
  _ExperiancesScreenState createState() => _ExperiancesScreenState();
}

class _ExperiancesScreenState extends State<ExperiancesScreen> {
  FocusNode _companyNameFocusNode;
  FocusNode _lastUserWorks;
  FocusNode _startFoucsNode;
  FocusNode _endFocusNode;

  final GlobalKey<FormState> experiancesformkey = GlobalKey();
  var _editedUser = User(
    id: DateTime.now().toString(),
    firstname: ' ',
    lastname: ' ',
    email: ' ',
    password: ' ',
    jobrole: ' ',
    avatar: null,
    education: null,
    experince: null,
  );

  List<JopRole> _jopRoles = JopRole.getJopRoles();
  List<DropdownMenuItem<JopRole>> _dropDownMenueItems;
  JopRole _selectedJopRole;

  DateTime dateStarting = DateTime.now();
  bool _pickedStarting = false;
  Future _pickStartingDate(BuildContext context) async {
    final DateTime pickedstarting = await showDatePicker(
      context: context,
      initialDate: dateStarting,
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );
    if (pickedstarting != null && pickedstarting != dateStarting) {
      setState(() {
        dateStarting = pickedstarting;
        _pickedStarting = true;
        // print('\n the date : ${date.year}-${date.month}-${date.day}\n');
      });
    }
  }

  DateTime dateEnding = DateTime.now();
  bool _pickedEnding = false;
  Future _pickEndingDate(BuildContext context) async {
    final DateTime pickedEnding = await showDatePicker(
      context: context,
      initialDate: dateEnding,
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );
    if (pickedEnding != null && pickedEnding != dateStarting) {
      setState(() {
        dateEnding = pickedEnding;
        _pickedEnding = true;
        // print('\n the date : ${date.year}-${date.month}-${date.day}\n');
      });
    }
  }

  @override
  void initState() {
    _dropDownMenueItems = _buildDropDownMenuItem(_jopRoles);
    _selectedJopRole = _dropDownMenueItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<JopRole>> _buildDropDownMenuItem(List items) {
    List<DropdownMenuItem<JopRole>> i = [];
    for (JopRole element in items) {
      i.add(DropdownMenuItem(
        value: element,
        child: Center(
          child: Text(element.name),
        ),
      ));
    }
    return i;
  }

  @override
  Widget build(BuildContext context) {
    var _user = Provider.of<User>(context, listen: false);
    void onSaved() {
      if (!experiancesformkey.currentState.validate()) {
        return;
      }
      experiancesformkey.currentState.save();
      Navigator.of(context).pushNamed(UserProfileScreen.routeName);
    }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text("Step - 3"),
          ),
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: experiancesformkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    /////////jop role
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        dropdownColor: Color.fromRGBO(255, 227, 254, 1),
                        value: _selectedJopRole,
                        items: _dropDownMenueItems,
                        onChanged: (val) {
                          setState(() {
                            _selectedJopRole = val;
                            print(_selectedJopRole.id);
                          });
                        },
                      ),
                    ),
                    //////////////////////job title
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Your job title',
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) return "Job Title is Req";
                      },
                      onSaved: (value) {},
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_companyNameFocusNode);
                      },
                    ),
                    //////////////////////Name Of Company
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Which Company Do You Work With ? ',
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) return "Name Of Company is Req";
                      },
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
                        labelText: 'Put Your Latest Project',
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) return "Last User Works is Req";
                      },
                      onSaved: (value) {},
                      textInputAction: TextInputAction.next,
                      focusNode: _lastUserWorks,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_startFoucsNode);
                      },
                    ),
                    //Start
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          _pickStartingDate(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary:
                              Theme.of(context).accentColor.withOpacity(0.3),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        child: _pickedStarting
                            ? Text(
                                'Starting in ${dateStarting.year}-${dateStarting.month}-${dateStarting.day}',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15),
                              )
                            : Text(
                                'Start jop in :',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15),
                              ),
                      ),
                    ),
                    //End
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          _pickEndingDate(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary:
                              Theme.of(context).accentColor.withOpacity(0.3),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        child: _pickedEnding
                            ? Text(
                                'Ending in ${dateEnding.year}-${dateEnding.month}-${dateEnding.day}',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15),
                              )
                            : Text(
                                'Ending jop in :',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15),
                              ),
                      ),
                    ),
                    //
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 4),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor),
                            child: Text("Save & Continue"),
                            onPressed: () {
                              onSaved();
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 4),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor),
                            child: Text("Skip ->"),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(UserProfileScreen.routeName);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
