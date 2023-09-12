import 'dart:convert';

import 'package:get/get.dart';

import '../preferences/app_preference.dart';


class GetConnectedModel {
  final AppPreference appPreference = Get.find();
String details = "";
  GetConnectedModel( {
    
    this.id,
    this.userId,
    this.userId1,
    this.firstName,
    this.lastName,
    this.caste,
    this.age,
    this.height,
    this.city,
    this.category,
    this.job,
    this.salary,
    this.member_type,
    this.customer_id,
    this.attachements,
  });

  String? id;
  String? userId;
  String? userId1;
  String? firstName;
  String? lastName;
  String? caste;
  int? age;
  int? height;
  String? city;
  String? category;
  String? job;
  var salary;
  String? member_type;
  String? customer_id;
  List<Attachements>? attachements;
  
 
        

  GetConnectedModel.fromJson(Map<String, dynamic> json){
     if (json.containsKey('requested_by_customers')) {
      userId = json['requested_by_customers']["user_obj_id"];
      
    } else if (json.containsKey('request_for_customers')) {
      userId = json['request_for_customers']["user_obj_id"];
    }
    

    if (json.containsKey('requested_by_customers')) {
      firstName = json['requested_by_customers']["personal_details"]['first_name'];
    } else if (json.containsKey('request_for_customers')) {
      firstName = json['request_for_customers']["personal_details"]['first_name'];
    }
    if (json.containsKey('requested_by_customers')) {
      lastName = json['requested_by_customers']["personal_details"]['last_name'];
    } else if (json.containsKey('request_for_customers')) {
      lastName = json['request_for_customers']["personal_details"]['last_name'];
    }
    if (json.containsKey('requested_by_customers')) {
      caste = json['requested_by_customers']["religion_community"]['religion'];
    } else if (json.containsKey('request_for_customers')) {
      caste = json['request_for_customers']["religion_community"]['religion'];
    }
    if (json.containsKey('requested_by_customers')) {
      age = json['requested_by_customers']["personal_details"]['age'];
    } else if (json.containsKey('request_for_customers')) {
      age = json['request_for_customers']["personal_details"]['age'];
    }
    if (json.containsKey('requested_by_customers')) {
      height = json['requested_by_customers']["personal_details"]['height'];
    } else if (json.containsKey('request_for_customers')) {
      height = json['request_for_customers']["personal_details"]['height'];
    }
    if (json.containsKey('requested_by_customers')) {
      city = json['requested_by_customers']["permanent_address"]['city'];
    } else if (json.containsKey('request_for_customers')) {
      city = json['request_for_customers']["permanent_address"]['city'];
    }
    if (json.containsKey('requested_by_customers')) {
      category = json['requested_by_customers']["member_type"];
    } else if (json.containsKey('request_for_customers')) {
      category = json['request_for_customers']["member_type"];
    }
    if (json.containsKey('requested_by_customers')) {
      job = json['requested_by_customers']?["carrier_and_working_details"]?["working_as"];
    } else if (json.containsKey('request_for_customers')) {
      job = json['request_for_customers']?["carrier_and_working_details"]?["working_as"];
    }
    if (json.containsKey('requested_by_customers')) {
      salary = json['requested_by_customers']?["carrier_and_working_details"]?["annual_income"];
    } else if (json.containsKey('request_for_customers')) {
      salary = json['request_for_customers']?["carrier_and_working_details"]?["annual_income"];
    }
    if (json.containsKey('requested_by_customers')) {
      member_type = json['requested_by_customers']["member_type"];
    } else if (json.containsKey('request_for_customers')) {
      member_type = json['request_for_customers']["member_type"];
    }
    if (json.containsKey('requested_by_customers')) {
      customer_id = json['requested_by_customers']["customer_id"];
    } else if (json.containsKey('request_for_customers')) {
      customer_id = json['request_for_customers']["customer_id"];
    }
    if (json.containsKey('requested_by_customers')) {
      attachements = json['requested_by_customers']["attachments"] == null ? null : List<Attachements>.from(json['requested_by_customers']["attachments"].map((x) => Attachements.fromJson(x)));
    } else if (json.containsKey('request_for_customers')) {
      attachements = json['request_for_customers']["attachments"] == null ? null : List<Attachements>.from(json['request_for_customers']["attachments"].map((x) => Attachements.fromJson(x)));;
    }
    id: json["_id"].toString();
    // userId: json['requested_by_customers']["user_obj_id"] ?? json['request_for_customers']["user_obj_id"],
    // userId1: json['request_for_customers']["user_obj_id"],
    // firstName: json['requested_by_customers']["personal_details"]['first_name'] ?? json['request_for_customers']["personal_details"]['first_name'],
    // lastName: json['requested_by_customers']["personal_details"]['last_name'] ?? json['request_for_customers']["personal_details"]['last_name'],
    // caste: json['requested_by_customers']["religion_community"]['religion'] ?? json['request_for_customers']["religion_community"]['religion'],
    // age: json['requested_by_customers']["personal_details"]['age'] ?? json['request_for_customers']["personal_details"]['age'],
    // height: json['requested_by_customers']["personal_details"]['height'] ?? json['request_for_customers']["personal_details"]['height'],
    // city: json['requested_by_customers']["permanent_address"]['city'] ?? json['request_for_customers']["permanent_address"]['city'],
    // category: json['requested_by_customers']["member_type"] ?? json['request_for_customers']["member_type"],
    // job: json['requested_by_customers']["carrier_and_working_details"]["working_as"] ?? json['request_for_customers']?["carrier_and_working_details"]?["working_as"],
    // salary: json['requested_by_customers']["carrier_and_working_details"]["annual_income"] ?? json['request_for_customers']?["carrier_and_working_details"]?["annual_income"],
    // member_type: json['requested_by_customers']["member_type"] ?? json['request_for_customers']["member_type"],
    // customer_id: json['requested_by_customers']["customer_id"] ?? json['request_for_customers']["customer_id"],
    
    // attachements: json['requested_by_customers']["attachments"] == null ? null : List<Attachements>.from(json['requested_by_customers']["attachments"].map((x) => Attachements.fromJson(x)));
    }

  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requested_by_customers']["user_obj_id"] = this.userId;
    data['request_for_customers']["user_obj_id"] = this.userId;
    return data;
  }
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

class RequestSent{
  RequestSent({
    this.id
    
  });

  String? id;
  
  factory RequestSent.fromJson(Map<String, dynamic> json) => RequestSent(
    id: json["_id"] == null ? null : json["_id"]
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id
  };
}

class RequestRecivied{
  RequestRecivied({
    this.id
    
  });

  String? id;
  
  factory RequestRecivied.fromJson(Map<String, dynamic> json) => RequestRecivied(
    id: json["_id"] == null ? null : json["_id"]
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id
  };
}

class RequestWishList{
  RequestWishList({
    this.id
    
  });

  String? id;
  
  factory RequestWishList.fromJson(Map<String, dynamic> json) => RequestWishList(
    id: json["_id"] == null ? null : json["_id"]
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id
  };
}


