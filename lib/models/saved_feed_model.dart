import 'dart:convert';

SavedpostFeedModel sendDataModelFromJson(String str) => SavedpostFeedModel.fromJson(json.decode(str));

// String sendDataModelToJson(postFeedModel data) => json.encode(data.toJson());

class SavedpostFeedModel {
  SavedpostFeedModel({
    this.id,
    this.title,
    this.content,
    this.attachements,
    this.userAttachements,
    this.time,
    this.firstName,
    this.lastName,
    this.userId,
  });

  String? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? title;
  String? content;
  List<Attachements>? attachements;
  List<UserAttachements>? userAttachements;
  String? time;
  
  
  factory SavedpostFeedModel.fromJson(Map<String, dynamic> json) => SavedpostFeedModel(
    id: json["_id"].toString(),
    userId: json["feed_posted_user"]["customer_obj_id"]["user_obj_id"].toString(),
    title: json['newsfeed_obj_id']["title"].toString(),
    content: json['newsfeed_obj_id']["content"].toString(),
    firstName: json["feed_posted_user"]["customer_obj_id"]["personal_details"]["first_name"].toString(),
    lastName: json["feed_posted_user"]["customer_obj_id"]["personal_details"]["last_name"].toString(),
    attachements: json['newsfeed_obj_id']["attachements"] == null ? null : List<Attachements>.from(json['newsfeed_obj_id']["attachements"].map((x) => Attachements.fromJson(x))),
    userAttachements: json["feed_posted_user"]["customer_obj_id"]["attachments"] == null ? null : List<UserAttachements>.from(json["feed_posted_user"]["customer_obj_id"]["attachments"].map((x) => UserAttachements.fromJson(x))),
    time: json['newsfeed_obj_id']["posted_on"].toString());
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


