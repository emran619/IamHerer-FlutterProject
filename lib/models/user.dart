import 'package:flutter/cupertino.dart';


class User with ChangeNotifier {
  User({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.jobrole,
    this.avatar,
    this.education,
    this.experince,
  });

  String id;
  String firstname;
  String lastname;
  String email;
  String password;
  String jobrole;
  String avatar;
  List<UserEducation> education;
  List<UserExperince> experince;

  List<User> users = [];

  void addUser(User user) {
    final newUser = User(
      firstname: user.firstname,
      lastname: user.lastname,
      email: user.email,
      password: user.password,
      jobrole: user.jobrole,
      avatar: user.avatar,
      education: user.education,
      experince: user.experince,
    );

    users.add(newUser);
    notifyListeners();
  }

  void printUsers() {
    users.forEach((element) {
      print(element.firstname + " - ");
      print(element.lastname + " - ");
      print(element.email + " - ");
      print(element.password + " - ");
      print(element.jobrole);
    });
  }

  Map<String, dynamic> tojson() {
    Map<String, dynamic> json = {};
    json['firstname'] = this.firstname;
    json['lastname'] = this.lastname;
    json['email'] = this.email;
    json['password'] = this.password;
    json['joprole'] = this.jobrole;
    json['avatar'] = this.avatar;
    json['education'] = UserEducation.tojsonList(this.education);
    json['experince'] = UserExperince.tojsonList(this.experince);
    return json;
  }

  User fromjson(Map<String,dynamic> json){
    this.firstname= json['firstname'];
    this.lastname = json['lastname'];
    this.email =  json['email'];
    this.password =  json['password'];
    this.jobrole =  json['joprole'];
    this.avatar = json['avatar'];
    //this.exp = Experice.fromJson(json['exp']) // one exper
    this.education = UserEducation.fromjsonList(json);
    this.experince = UserExperince.fromjsonList(json);
    return this;
    

  }
}

class UserEducation {
  UserEducation({
    this.instituation_name,
    this.qualification_id,
    this.speciality,
    this.startDate,
    this.endDate,
  });
  String instituation_name;
  int qualification_id;
  String speciality;
  String startDate;
  String endDate;
  //toJson method
  Map<String, dynamic> tojson() {
    Map<String, dynamic> json = {};
    json['instituation_name'] = this.instituation_name;
    json['qualification_id'] = this.qualification_id;
    json['speciality'] = this.speciality;
    json['startDate'] = this.startDate;
    json['endDate'] = this.endDate;
    return json;
  }

  static List<Map<String, dynamic>> tojsonList(List<UserEducation> mylist) {
    List<Map<String, dynamic>> json = [];
    mylist.forEach((e) {
      json.add(e.tojson());
    });
    return json;
  }
  //fromJson method
  static UserEducation fromjson(Map<String,dynamic> json){
    UserEducation u;
    u.instituation_name = json['instituation_name'];
    u.qualification_id = json['qualification_id'];
    u.speciality = json['speciality'];
    u.startDate = json['startDate'];
    u.endDate = json['endDate'];
    return u;
  }

  static List<UserEducation> fromjsonList(Map<String,dynamic> json){
    List<UserEducation> result = [];
    Map<String,dynamic> u = {};
    json['education'].forEach((key, value) {
      u[key] =key;
      u[value] = value;
      result.add(UserEducation.fromjson(u));
    });
    return result;
  }
}

class UserExperince {
  UserExperince({
    this.jobTitle,
    this.companyName,
    this.latestProject,
    this.status,
  });
  String jobTitle;
  String companyName;
  String latestProject;
  int status;
  //toJson method
  Map<String, dynamic> tojson() {
    Map<String, dynamic> json = {};
    json['jobTitle'] = this.jobTitle;
    json['companyName'] = this.companyName;
    json['latestProject'] = this.latestProject;
    json['status'] = this.status;
    return json;
  }

  static List<Map<String, dynamic>> tojsonList(List<UserExperince> mylist) {
    List<Map<String, dynamic>> result = [];
    mylist.forEach((e) {
      result.add(e.tojson());
    });
    return result;
  }
  //fromJson method
  static UserExperince fromjson(Map<String,dynamic> json){
    UserExperince u;
    u.jobTitle = json['jobTitle'];
    u.companyName = json['companyName'];
    u.latestProject = json['latestProject'];
    u.status = json['status'];
    return u;
  }

  static List<UserExperince> fromjsonList(Map<String,dynamic> json){
    List<UserExperince> result = [];
    Map<String,dynamic> u = {};
    json['experince'].forEach((key, value) {
      u[key] =key;
      u[value] = value;
      result.add(UserExperince.fromjson(u));
    });
    return result;
  }
}
