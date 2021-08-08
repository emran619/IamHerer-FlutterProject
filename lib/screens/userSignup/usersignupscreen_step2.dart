import 'package:flutter/material.dart';
import 'package:iamh/models/user.dart';
import 'package:iamh/screens/userSignup/usersignupscreen_step3.dart';

class InstituationName {
  String name;
  int id;
  InstituationName(this.id, this.name);
  static List<InstituationName> getInstituations() {
    return <InstituationName>[
      InstituationName(1, "جامعة"),
      InstituationName(2, "معهد"),
      InstituationName(3, "مدرسة"),
      InstituationName(4, "شهادة حضور"),
    ];
  }
}

class EducationScreen extends StatefulWidget {
  static const routeName = 'eduscreen';
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  FocusNode _speFocusNoode;
  FocusNode _startFoucsNode;
  FocusNode _endFocusNode;
  final GlobalKey<FormState> educationformkey = GlobalKey();
  List<InstituationName> _instituations = InstituationName.getInstituations();
  List<DropdownMenuItem<InstituationName>> _dropDownMenueItems;
  InstituationName _selectedInstituation;

  List<DropdownMenuItem<InstituationName>> _buildDropDownMenuItem(List items) {
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
    List<DropdownMenuItem<InstituationName>> i = [];
    for (InstituationName element in items) {
      i.add(DropdownMenuItem(
        value: element,
        child: Center(
          child: Text(element.name),
        ),
      ));
    }
    return i;
  }

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
    _dropDownMenueItems = _buildDropDownMenuItem(_instituations);
    _selectedInstituation = _dropDownMenueItems[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var _user = Provider.of<User>(context, listen: false);

    void onSaved() {
      if (!educationformkey.currentState.validate()) {
        return;
      }
      educationformkey.currentState.save();
    }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text("Step - 2"),
          ),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: educationformkey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      //الدراسة
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          dropdownColor: Color.fromRGBO(255, 227, 254, 1),
                          value: _selectedInstituation,
                          items: _dropDownMenueItems,
                          onChanged: (val) {
                            setState(() {
                              _selectedInstituation = val;
                              print(_selectedInstituation.id);
                            });
                          },
                        ),
                      ),
                      //التخصص specialty
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Specialty',
                          labelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value.isEmpty) return "Specialty is Req";
                        },
                        onSaved: (value) {},
                        textInputAction: TextInputAction.next,
                        focusNode: _speFocusNoode,
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
                                  'Start studying in :',
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
                                  'Ending studying in :',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 15),
                                ),
                        ),
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor),
                              child: Text("Save & Continue"),
                              onPressed: () {
                                onSaved();
                                Navigator.of(context)
                                    .pushNamed(ExperiancesScreen.routeName);
                              },
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor),
                              child: Text("Skip ->"),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(ExperiancesScreen.routeName);
                              },
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
