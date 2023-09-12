import 'package:flutter/material.dart';

class sendProprosalModel {
  final String id;
  final String userId;
  final String firstName;
  final String lastName;
  final String time;
  // final String name;
  final int age;
  List<Attachements>? attachements;
  
  sendProprosalModel({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.time,
    // required this.name,
    required this.age,
    required this.attachements,

    

  });

  factory sendProprosalModel.fromJson(Map<String, dynamic> json) => sendProprosalModel(
        id: json['_id'].toString(),
        userId: json['customers_details'] != null ? json['customers_details']['user_obj_id'] : '',
        firstName: json['customers_details'] != null ? json['customers_details']['personal_details']["first_name"] : '',
        lastName: json['customers_details'] != null ? json['customers_details']['personal_details']["last_name"] : '',
        time: json['request_status_updated_time'] != null ? json["request_status_updated_time"] : '',
        // name: json['title'].toString(),
        age: json['customers_details'] != null ? json['customers_details']['personal_details']["age"] : 0,
        attachements: json["customers_details"]["attachments"] == null ? null : List<Attachements>.from(json["customers_details"]["attachments"].map((x) => Attachements.fromJson(x))),
        
      );
       
}


class Attachements {
  Attachements({
    this.url
    
  });

  String? url;
  
  factory Attachements.fromJson(Map<String, dynamic> json) => Attachements(
    url: json["url"] == null ? null : json["url"]
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url
  };
}
