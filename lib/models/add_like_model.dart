// import 'dart:convert';

// postAddLikeModel sendDataModelFromJson(String str) => postAddLikeModel.fromJson(json.decode(str));

// // String sendDataModelToJson(postFeedModel data) => json.encode(data.toJson());

// class postAddLikeModel {
//    String? id;
//   String? firstName;
//   String? lastName;
//   String? time;
//   List<Attachements>? attachements;
//   postAddLikeModel({
//    this.firstName,
//     this.lastName,
//     this.id,
//     this.time,
//     this.attachements
    
//   });

 
  
  
//    factory postAddLikeModel.fromJson(Map<String, dynamic> json) => postAddLikeModel(
//     id: json["_id"] == null ? null : json["_id"],
//     firstName: json["customer_obj_id"] == null ? null : json["customer_obj_id"]["personal_details"]["first_name"],
//     lastName: json["customer_obj_id"] == null ? null : json["customer_obj_id"]["personal_details"]["last_name"],
//     time: json["customer_obj_id"] == null ? null : json["customer_obj_id"]["createdAt"],
//     attachements: json["customer_obj_id"]["attachments"] == null ? null : List<Attachements>.from(json["customer_obj_id"]["attachments"].map((x) => Attachements.fromJson(x))),
//   );
// }
// class Attachements {
//   Attachements({
//     this.url
    
//   });

//   String? url;
  
//   factory Attachements.fromJson(Map<String, dynamic> json) => Attachements(
//     url: json["url"] == null ? null : json["url"]
//   );

//   Map<String, dynamic> toJson() => {
//     "url": url == null ? null : url
//   };
// }