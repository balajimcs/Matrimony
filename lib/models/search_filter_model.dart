import 'dart:convert';


class SearchDetailedFilterModel {
  SearchDetailedFilterModel({
    required this.id,
    required this.name,
    required this.caste,
    required this.age,
    required this.height,
    required this.city,
    required this.job,
    required this.salary 
  });

  final String id;
  final String name;
  final String caste;
  final int age;
  final int height;
  final String city;
  final String job;
  final String salary;


  factory SearchDetailedFilterModel.fromJson(Map<String, dynamic> json) => SearchDetailedFilterModel(
    id: json["_id"].toString(),
    name: json["personal_details"]['first_name'].toString(),
    caste: json["religion_community"] != null ? json["religion_community"]['religion'] : "",
    age: json["personal_details"]['age'] != null ? json["personal_details"]['age'] : 0,
    height: json["personal_details"]['height']  != null ? json["personal_details"]['height'] : 0,
    city: json["permanent_address"]  != null ? json["permanent_address"]['city'] : "",
    job: json["carrier_and_working_details"]  != null ? json["carrier_and_working_details"]["working_as"] : "",
    salary: json["carrier_and_working_details"]  != null ? json["carrier_and_working_details"]["annual_income"] : "",
  );
}


