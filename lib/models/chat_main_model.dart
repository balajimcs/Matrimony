import 'dart:convert';

ChatMainModel sendDataModelFromJson(String str) => ChatMainModel.fromJson(json.decode(str));

// String sendDataModelToJson(postFeedModel data) => json.encode(data.toJson());

class ChatMainModel {
  ChatMainModel({
    this.id,
    this.userInvolved,
    
  });

  String? id;
  List<UserInvolved>? userInvolved;
  
  factory ChatMainModel.fromJson(Map<String, dynamic> json) => ChatMainModel(
    id: json["_id"] ?? '',
    userInvolved: json["users_involved"] == null ? null : List<UserInvolved>.from(json["users_involved"].map((x) => UserInvolved.fromJson(x))),
  );
}


class UserInvolved {
  UserInvolved({
    this.id,
    this.channelId,
    this.firstNmae,
    this.lastName,
    this.time,
    this.count,
    this.attachemnt,
  });
  String? channelId;
  String? id;
  String? firstNmae;
  String? lastName;
  String? time;
  int? count;
  List<Attachemnt>? attachemnt;
  

  factory UserInvolved.fromJson(Map<String, dynamic> json) => UserInvolved(
    id: json["user_id"]["customer_obj_id"]["user_obj_id"] ?? '',
    count: json["count_of_new_messages"] ?? 1,
    channelId: json["_id"] ?? '',
    firstNmae: json['user_id'] != null && json['user_id']["customer_obj_id"] != null && json['user_id']["customer_obj_id"]["personal_details"] != null && json["user_id"]["customer_obj_id"]["personal_details"]["first_name"] != null ? json["user_id"]["customer_obj_id"]["personal_details"]["first_name"] : '',
    lastName: json['user_id'] != null && json['user_id']["customer_obj_id"] != null && json['user_id']["customer_obj_id"]["personal_details"] != null && json["user_id"]["customer_obj_id"]["personal_details"]["last_name"] != null ? json["user_id"]["customer_obj_id"]["personal_details"]["last_name"] : '',
    time: json['user_id'] != null && json['user_id']["updatedAt"] != null ? json['user_id']["updatedAt"] : '',
    attachemnt: json['user_id']["customer_obj_id"] == null ? null : List<Attachemnt>.from(json["user_id"]["customer_obj_id"]["attachments"].map((x) => Attachemnt.fromJson(x))),
  );

  
}

class Attachemnt {
  Attachemnt({
    this.url,
    
  });

  String? url;
  

  factory Attachemnt.fromJson(Map<String, dynamic> json) => Attachemnt(
    url: json["url"] == null ? null : json["url"],
  );

  
}