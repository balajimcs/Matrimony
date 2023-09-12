import 'dart:convert';


class DetailedFilterModel {
  DetailedFilterModel( {
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.caste,
    this.age,
    this.height,
    this.city,
    this.category,
    this.job,
    this.salary,
    this.isRequestSent, 
    this.isRequestSentAccept, 
    this.isRequestSentReject, 
    this.isRequestReceived, 
    this.isRequestReceivedAccept, 
    this.isRequestReceivedReject,
    this.isAddedToWhishList,
    this.member_type,
    this.customer_id,
    this.attachements,
    this.requestSent,
    this.requestRecivied,
    this.requestWishList,
  });

  String? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? caste;
  int? age;
  int? height;
  String? city;
  String? category;
  String? job;
  var salary;
  int? isRequestSent;
  int? isRequestSentAccept;
  int? isRequestSentReject;
  int? isRequestReceived;
  int? isRequestReceivedAccept;
  int? isRequestReceivedReject;
  int? isAddedToWhishList;
  String? member_type;
  String? customer_id;
  List<Attachements>? attachements;
  List<RequestSent>? requestSent;
  List<RequestRecivied>? requestRecivied;
  List<RequestWishList>? requestWishList;

  //  DetailedFilterModel.clone(DetailedFilterModel source){
  //   id = source.id;
  //       userId = source.userId;
  //       firstName = source.firstName;
  //       lastName = source.lastName;
  //       caste = source.caste;
  //       age = source.age;
  //       height = source.height;
  //       city = source.city;
  //       category = source.category;
  //       job = source.job;
  //       salary = source.salary;
  //       isRequestSent = source.isRequestSent;
  //       isRequestSentAccept = source.isRequestSentAccept;
  //       isRequestSentReject = source.isRequestSentReject;
  //       isRequestReceived = source.isRequestReceived;
  //       isRequestReceivedAccept = source.isRequestReceivedAccept;
  //       isRequestReceivedReject = source.isRequestReceivedReject;
  //       isAddedToWhishList = source.isAddedToWhishList;
  //       member_type = source.member_type;
  //       customer_id = source.customer_id;
  //       attachements = source.attachements;
  //       requestSent = source.requestSent;
  //       requestRecivied = source.requestRecivied;
  //       requestWishList = source.requestWishList;
  //       }

  //       static DetailedFilterModel cloneFromOriginal(DetailedFilterModel source) {
  //   return DetailedFilterModel(id : source.id,
  //       userId : source.userId,
  //       firstName : source.firstName,
  //       lastName : source.lastName,
  //       caste : source.caste,
  //       age : source.age,
  //       height : source.height,
  //       city : source.city,
  //       category : source.category,
  //       job : source.job,
  //       salary : source.salary,
  //       isRequestSent : source.isRequestSent,
  //       isRequestSentAccept : source.isRequestSentAccept,
  //       isRequestSentReject : source.isRequestSentReject,
  //       isRequestReceived : source.isRequestReceived,
  //       isRequestReceivedAccept : source.isRequestReceivedAccept,
  //       isRequestReceivedReject : source.isRequestReceivedReject,
  //       isAddedToWhishList : source.isAddedToWhishList,
  //       member_type : source.member_type,
  //       customer_id : source.customer_id,
  //       attachements : source.attachements,
  //       requestSent : source.requestSent,
  //       requestRecivied : source.requestRecivied,
  //       requestWishList : source.requestWishList);
  // }
        

  factory DetailedFilterModel.fromJson(Map<String, dynamic> json) => DetailedFilterModel(
    id: json["_id"].toString(),
    userId: json["user_obj_id"].toString(),
    firstName: json["personal_details"]['first_name'].toString(),
    lastName: json["personal_details"]['last_name'].toString(),
    caste: json["religion_community"] != null ? json["religion_community"]['religion'] : "",
    age: json["personal_details"]['age'] != null ? json["personal_details"]['age'] : 0,
    height: json["personal_details"]['height']  != null ? json["personal_details"]['height'] : 0,
    city: json["permanent_address"]  != null ? json["permanent_address"]['city'] : "",
    category: json["member_type"].toString(),
    job: json["carrier_and_working_details"]  != null ? json["carrier_and_working_details"]["working_as"] : "",
    salary: json["carrier_and_working_details"]  != null ? json["carrier_and_working_details"]["annual_income"] : "",
    isRequestSent: json["isRequestSent"] != null ? json["isRequestSent"] : 0,
    isRequestSentAccept: json["isRequestSentAccepted"] != null ? json["isRequestSentAccepted"] : 0,
    isRequestSentReject: json["isRequestSentRejected"] != null ? json["isRequestSentRejected"] : 0,
    isRequestReceived: json["isRequestRecieved"] != null ? json["isRequestRecieved"] : 0,
    isRequestReceivedAccept: json["isRequestRecievedAccepted"] != null ? json["isRequestRecievedAccepted"] : 0,
    isRequestReceivedReject: json["isRequestRecievedRejected"] != null ? json["isRequestRecievedRejected"] : 0,
    isAddedToWhishList: json["isAddedToWhishList"] != null ? json["isAddedToWhishList"] : 0,
    member_type: json["member_type"]  != null ? json["member_type"] : "",
    customer_id: json["customer_id"]  != null ? json["customer_id"] : "",
    attachements: json["attachments"] == null ? null : List<Attachements>.from(json["attachments"].map((x) => Attachements.fromJson(x))),
    requestSent: json["requestSentDetails"] == null ? null : List<RequestSent>.from(json["requestSentDetails"].map((x) => RequestSent.fromJson(x))),
    requestRecivied: json["requestRecievedDetails"] == null ? null : List<RequestRecivied>.from(json["requestRecievedDetails"].map((x) => RequestRecivied.fromJson(x))),
    requestWishList: json["requestWishListDetails"] == null ? null : List<RequestWishList>.from(json["requestWishListDetails"].map((x) => RequestWishList.fromJson(x))),
  );

  DetailedFilterModel.clone(DetailedFilterModel source) {
    source.id;
        source.userId;
        source.firstName;
        source.lastName;
        source.caste;
        source.age;
        source.height;
        source.city;
        source.category;
        source.job;
        source.salary;
        source.isRequestSent;
        source.isRequestSentAccept;
        source.isRequestSentReject;
        source.isRequestReceived;
        source.isRequestReceivedAccept;
        source.isRequestReceivedReject;
        source.isAddedToWhishList;
        source.member_type;
        source.customer_id;
        source.attachements;
        source.requestSent;
        source.requestRecivied;
        source.requestWishList;
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