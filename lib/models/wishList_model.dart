
import 'dart:convert';

wishListProprosalModel sendDataModelFromJson(String str) => wishListProprosalModel.fromJson(json.decode(str));

class wishListProprosalModel {
  final String id;
  final String userId;
  final String firstName;
  final String lastName;
  final String time;
  // final String name;
  final int age;
  List<Attachements>? attachements;
  
  wishListProprosalModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.time,
    required this.userId,
    // required this.name,
    required this.age,
    required this.attachements,

    

  });

  factory wishListProprosalModel.fromJson(Map<String, dynamic> json) => wishListProprosalModel(
       id: json['_id'].toString(),
       userId: json['wishListed_profile'] != null && json['wishListed_profile']['customer_obj_id'] != null ? json['wishListed_profile']['customer_obj_id']["user_obj_id"] : "",
        firstName: json['wishListed_profile'] != null && json['wishListed_profile']['customer_obj_id'] != null ? json['wishListed_profile']['customer_obj_id']['personal_details']["first_name"] : "",
        lastName: json['wishListed_profile'] != null && json['wishListed_profile']['customer_obj_id'] != null ? json['wishListed_profile']['customer_obj_id']['personal_details']["last_name"] : "",
        time: json['wishListed_date_time'] != null ? json["wishListed_date_time"] : "",
        // name: json['title'].toString(),
        age: json['wishListed_profile'] != null && json['wishListed_profile']['customer_obj_id'] != null ? json['wishListed_profile']['customer_obj_id']['personal_details']["age"] : 0,
        attachements: json['wishListed_profile'] != null && json['wishListed_profile']['customer_obj_id'] != null && json['wishListed_profile']['customer_obj_id']["attachments"] == null ? null : List<Attachements>.from(json['wishListed_profile']['customer_obj_id']["attachments"].map((x) => Attachements.fromJson(x))),
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

