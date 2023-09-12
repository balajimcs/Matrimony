import 'dart:convert';

ChatOnetoOneModel sendDataModelFromJson(String str) => ChatOnetoOneModel.fromJson(json.decode(str));

// String sendDataModelToJson(postFeedModel data) => json.encode(data.toJson());

class ChatOnetoOneModel {
  ChatOnetoOneModel({
    this.id,
    this.userId,
    this.channel_id,
    this.msg,
    this.attachment,
    this.createdAt,
    this.userAttachment,
    
  });

  String? id;
  String? channel_id;
  String? msg;
  String? userId;
  String? createdAt;
  List<Attachment>? attachment;
  List<UserAttachment>? userAttachment;
  
  factory ChatOnetoOneModel.fromJson(Map<String, dynamic> json) => ChatOnetoOneModel(
    id: json["_id"] == null ? null : json["_id"],
    userId: json['messaged_by']['customer_obj_id']['user_obj_id'] == null ? null : json['messaged_by']['customer_obj_id']['user_obj_id'],
    channel_id: json["channel_id"] == null ? null : json["channel_id"],
    msg: json["msg"] == null ? null : json["msg"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    attachment: json["attachements"] == null ? null : List<Attachment>.from(json["attachements"].map((x) => Attachment.fromJson(x))),
    userAttachment: json['messaged_by']['customer_obj_id']["attachments"] == null ? null : List<UserAttachment>.from(json['messaged_by']['customer_obj_id']["attachments"].map((x) => UserAttachment.fromJson(x))),
  );
}

class Attachment {
  Attachment({
    this.url,
    
  });

  String? url;
  

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
    url: json["url"] == null ? null : json["url"],
  );

  
}

class UserAttachment {
  UserAttachment({
    this.url,
    
  });

  String? url;
  

  factory UserAttachment.fromJson(Map<String, dynamic> json) => UserAttachment(
    url: json["url"] == null ? null : json["url"],
  );

  
}