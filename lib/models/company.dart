
import 'package:flutter/cupertino.dart';

class Company with ChangeNotifier{
  String name;
  String joprole;
  String address;
  String description;
  String tags;
  DateTime dateofestablishment;
  Company({
    this.name,
    this.joprole,
    this.address,
    this.description,
    this.dateofestablishment
  });
  //toJson method
  Map<String, dynamic> tojson() {
    Map<String, dynamic> json = {};
    json['name'] = this.name;
    json['joprole'] = this.joprole;
    json['address'] = this.address;
    json['description'] = this.description;
    json['tags'] = this.tags;
    json['dateofestablishment'] = this.dateofestablishment;
    return json;
  }

  static List<Map<String, dynamic>> tojsonList(List<Company> mylist) {
    List<Map<String, dynamic>> result = [];
    mylist.forEach((e) {
      result.add(e.tojson());
    });
    return result;
  }
  //fromJson method
  static Company fromjson(Map<String,dynamic> json){
    Company company;
    company.name = json['name'];
    company.joprole = json['joprole'];
    company.address = json['address'];
    company.description = json['description'];
    company.tags = json['tags'];
    company.dateofestablishment = json['dateofestablishment'];
    return company;
  }

}