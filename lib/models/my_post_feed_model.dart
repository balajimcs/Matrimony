import 'dart:convert';

myPostFeedModel sendDataModelFromJson(String str) => myPostFeedModel.fromJson(json.decode(str));

// String sendDataModelToJson(postFeedModel data) => json.encode(data.toJson());

class myPostFeedModel {
  myPostFeedModel({
    this.id,
    this.title,
    this.content,
    this.attachements,
    this.time,
    this.liked,
    
  });

  String? id;
  String? title;
  String? content;
  List<Attachements>? attachements;
  String? time;
  List<Liked>? liked;
  
  factory myPostFeedModel.fromJson(Map<String, dynamic> json) => myPostFeedModel(
    id: json["_id"] == null ? null : json["_id"],
    title: json["title"] == null ? null : json["title"],
    content: json["content"] == null ? null : json["content"],
    attachements: json["attachements"] == null ? null : List<Attachements>.from(json["attachements"].map((x) => Attachements.fromJson(x))),
    time: json["posted_on"] == null ? null : json["posted_on"],
    liked: json["liked_by"] == null ? null : List<Liked>.from(json["liked_by"].map((x) => Liked.fromJson(x))),
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
    attachement_type: json["attachement_type"] == null ? null : json["attachement_type"],
    attachement_format: json["attachement_format"] == null ? null : json["attachement_format"],
  );

  Map<String, dynamic> toJson() => {
    "attachement_url": attachement_url == null ? null : attachement_url,
    "attachement_type": attachement_type == null ? null : attachement_type,
    "attachement_format": attachement_format == null ? null : attachement_format,
  };
}

class Liked {
  Liked({
    this.firstName,
    this.lastName,
    this.id,
    
  });

  String? firstName;
  String? lastName;
  String? id;
  
  factory Liked.fromJson(Map<String, dynamic> json) => Liked(
    firstName: json["customer_obj_id"] == null ? null : json["customer_obj_id"]["personal_details"]["first_name"],
    lastName: json["customer_obj_id"] == null ? null : json["customer_obj_id"]["personal_details"]["last_name"],
    id: json["_id"] == null ? null : json["_id"],
    );
  

  
}


