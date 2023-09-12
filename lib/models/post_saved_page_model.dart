import 'dart:convert';

postSavedFeedModel sendDataModelFromJson(String str) => postSavedFeedModel.fromJson(json.decode(str));

// String sendDataModelToJson(postFeedModel data) => json.encode(data.toJson());

class postSavedFeedModel {
  postSavedFeedModel({
    this.id,
    this.title,
    this.content,
    this.attachements,
    this.customerDetails,
    this.time,
    this.likedBy,
    this.postSaved,
    
  });

  String? id;
  String? title;
  String? content;
  List<CustomerDetails>? customerDetails;
  List<Attachements>? attachements;
  List<LikedBy>? likedBy;
  String? time;
  int? postSaved;
  
  factory postSavedFeedModel.fromJson(Map<String, dynamic> json) => postSavedFeedModel(
    id: json["_id"].toString(),
    title: json["title"].toString(),
    content: json["content"].toString(),
    attachements: json["attachements"] == null ? null : List<Attachements>.from(json["attachements"].map((x) => Attachements.fromJson(x))),
    customerDetails: json["user_posting_customers_details"] == null ? null : List<CustomerDetails>.from(json["user_posting_customers_details"].map((x) => CustomerDetails.fromJson(x))),
    likedBy: json["liked_by_customers_details"] == null ? null : List<LikedBy>.from(json["liked_by_customers_details"].map((x) => LikedBy.fromJson(x))),
    time: json["posted_on"].toString(),
    postSaved : json["isPostSaved"] != null ? json["isPostSaved"] : 0);
}

class CustomerDetails{
  CustomerDetails({
    this.userId,
    this.firstName,
    this.lastName,
    this.userAttachements,
    
  });

String? userId;
String? firstName;
String? lastName;
List<UserAttachements>? userAttachements;


  factory CustomerDetails.fromJson(Map<String, dynamic> json) => CustomerDetails(
    userId: json["user_obj_id"].toString(),
    firstName: json["personal_details"]['first_name'].toString(),
    lastName: json["personal_details"]['last_name'].toString(),
    userAttachements: json["attachments"] == null ? null : List<UserAttachements>.from(json["attachments"].map((x) => UserAttachements.fromJson(x))),
    
  );
}

class Attachements {
  Attachements({
    this.attachement_url,
    this.attachement_type,
    this.attachement_format,
  });

  String? attachement_url;
  String? attachement_type;
  String? attachement_format;

  factory Attachements.fromJson(Map<String, dynamic> json) => Attachements(
    attachement_url: json["attachement_url"] == null ? null : json["attachement_url"],
    attachement_type: json["attachement_type"] == null ? json["attachement_type"] : '',
    attachement_format: json["attachement_format"] == null ? json["attachement_format"] : '',
  );

  
}

class UserAttachements {
  UserAttachements({
    this.url
    
  });

  String? url;
  
  factory UserAttachements.fromJson(Map<String, dynamic> json) => UserAttachements(
    url: json["url"] == null ?  null : json["url"] 
  );

 
}

class LikedBy {
  LikedBy({
    this.name,
    this.id
    
  });

  String? name;
  String? id;
  
  factory LikedBy.fromJson(Map<String, dynamic> json) => LikedBy(
    name: json["personal_details"]["first_name"].toString(),
    id: json["_id"] == null ? null : json["_id"]
  );

  
}

