import 'dart:convert';

BrokerModel sendDataModelFromJson(String str) => BrokerModel.fromJson(json.decode(str));

// String sendDataModelToJson(postFeedModel data) => json.encode(data.toJson());

class BrokerModel {
  BrokerModel({
    this.firstName,
    this.lastName,
    this.doorNo,
    this.attachements,
    this.Street,
    this.Area,
    this.District,
    this.BrokerId,
    this.MobileNo,
    
  });

  String? firstName;
  String? lastName;
  String? doorNo;
  List<Attachements>? attachements;
  String? Area;
  String? Street;
  String? District;
  String? BrokerId;
  String? MobileNo;
  
  factory BrokerModel.fromJson(Map<String, dynamic> json) => BrokerModel(
    firstName: json["data"]['personal_details']['first_name'].toString(),
    lastName: json["data"]['personal_details']['last_name'].toString(),
    doorNo: json["data"]['communication_detials']['door_no'].toString(),
    attachements: json["attachements"] == null ? null : List<Attachements>.from(json["attachements"].map((x) => Attachements.fromJson(x))),
    Street: json["data"]['communication_detials']['street'].toString(),
    Area: json["data"]['communication_detials']['area'].toString(),
    District: json["data"]['communication_detials']['district'].toString(),
    BrokerId: json["data"]['broker_code'].toString(),
    MobileNo : json["data"]['broker_code'].toString());
}


class Attachements {
  Attachements({
    this.url
    
  });

  String? url;
  
  factory Attachements.fromJson(Map<String, dynamic> json) => Attachements(
    url: json["url"] == null ? null : json["url"],
    );

  
}

