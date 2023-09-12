class HomeUserModel {
  int? success;
  String? message;
  int? status;
  Data? data;

  HomeUserModel({this.success, this.message, this.status, this.data});

  HomeUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] != null ? json['success'] : "";
    message = json['message'] != null ? json['message'] : "";
    status = json['status'] != null ? json['status'] : 0;
    data = json['data'] != null ? new Data.fromJson(json['data'] as Map<String, dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<NearByYou>? nearByYou;
  List<RecentlyViewed>? recentlyViewed;
  List<FeaturedMembers>? featuredMembers;
  List<RecommendedMembers>? recommendedMembers;

  Data(
      {this.nearByYou,
        this.recentlyViewed,
        this.featuredMembers,
        this.recommendedMembers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['nearByYou'] != null) {
      nearByYou = <NearByYou>[];
      json['nearByYou'].forEach((v) {
        nearByYou!.add(new NearByYou.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['recentlyViewed'] != null) {
      recentlyViewed = <RecentlyViewed>[];
      json['recentlyViewed'].forEach((v) {
        recentlyViewed!.add(new RecentlyViewed.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['featuredMembers'] != null) {
      featuredMembers = <FeaturedMembers>[];
      json['featuredMembers'].forEach((v) {
        featuredMembers!.add(new FeaturedMembers.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['recommendedMembers'] != null) {
      recommendedMembers = <RecommendedMembers>[];
      json['recommendedMembers'].forEach((v) {
        recommendedMembers!.add(new RecommendedMembers.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nearByYou != null) {
      data['nearByYou'] = this.nearByYou!.map((v) => v.toJson()).toList();
    }
    if (this.recentlyViewed != null) {
      data['recentlyViewed'] =
          this.recentlyViewed!.map((v) => v.toJson()).toList();
    }
    if (this.featuredMembers != null) {
      data['featuredMembers'] =
          this.featuredMembers!.map((v) => v.toJson()).toList();
    }
    if (this.recommendedMembers != null) {
      data['recommendedMembers'] =
          this.recommendedMembers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NearByYou {
  AuthDetails? authDetails;
  String? sId;
  String? userType;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? customerObjId;
  List<CusomterDetails>? cusomterDetails;
  List<RequestSentDetails>? requestSentDetails;
  List<RequestRecievedDetails>? requestRecievedDetails;
  List<RequestWishListDetails>? requestWishListDetails;
  int? isRequestSent;
  int? isRequestSentAccepted;
  int? isRequestSentRejected;
  int? isRequestRecieved;
  int? isRequestRecievedAccepted;
  int? isRequestRecievedRejected;
  int? isAddedToWhishList;

  NearByYou(
      {this.sId,
        this.authDetails,
        this.userType,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.customerObjId,
        this.cusomterDetails,
        this.requestSentDetails,
        this.requestRecievedDetails,
        this.requestWishListDetails,
        this.isRequestSent,
        this.isRequestSentAccepted,
        this.isRequestSentRejected,
        this.isRequestRecieved,
        this.isRequestRecievedAccepted,
        this.isRequestRecievedRejected,
        this.isAddedToWhishList});

  NearByYou.fromJson(Map<String, dynamic> json) {
    authDetails = json['auth_details'] != null
        ? new AuthDetails.fromJson(json['auth_details'] as Map<String, dynamic>)
        : null;
    sId = json['_id'] != null ? json['_id'] : "";
    userType = json['user_type'] != null ? json['user_type'] : "";
    createdAt = json['createdAt'] != null ? json['createdAt'] : "";
    updatedAt = json['updatedAt'] != null ? json['updatedAt'] : "";
    iV = json['__v'] != null ? json['__v'] : 0;
    customerObjId = json['customer_obj_id']  != null ? json['customer_obj_id'] : "";
    if (json['cusomter_details'] != null) {
      cusomterDetails = <CusomterDetails>[];
      // json['cusomter_details'].forEach((v) {
        cusomterDetails!.add(new CusomterDetails.fromJson(json['cusomter_details'] as Map<String, dynamic> ));
      // });
    }
     if (json['requestSentDetails'] != null) {
      requestSentDetails = <RequestSentDetails>[];
      json['requestSentDetails'].forEach((v) {
        requestSentDetails!.add(new RequestSentDetails.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['requestRecievedDetails'] != null) {
      requestRecievedDetails = <RequestRecievedDetails>[];
      json['requestRecievedDetails'].forEach((v) {
        requestRecievedDetails!.add(new RequestRecievedDetails.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['requestWishListDetails'] != null) {
      requestWishListDetails = <RequestWishListDetails>[];
      json['requestWishListDetails'].forEach((v) {
        requestWishListDetails!.add(new RequestWishListDetails.fromJson(v as Map<String, dynamic>));
      });
    }
    isRequestSent = json['isRequestSent'] != null ? json['isRequestSent'] : 0;
    isRequestSentAccepted = json['isRequestSentAccepted'] != null ? json['isRequestSentAccepted'] : 0;
    isRequestSentRejected = json['isRequestSentRejected'] != null ? json['isRequestSentRejected'] : 0;
    isRequestRecieved = json['isRequestRecieved'] != null ? json['isRequestRecieved'] : 0;
    isRequestRecievedAccepted = json['isRequestRecievedAccepted'] != null ? json['isRequestRecievedAccepted'] : 0;
    isRequestRecievedRejected = json['isRequestRecievedRejected'] != null ? json['isRequestRecievedRejected'] : 0;
    isAddedToWhishList = json['isAddedToWhishList'] != null ? json['isAddedToWhishList'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authDetails != null) {
      data['auth_details'] = this.authDetails!.toJson();
    }
    data['_id'] = this.sId;
    data['user_type'] = this.userType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.requestSentDetails != null) {
      data['requestSentDetails'] =
          this.requestSentDetails!.map((v) => v.toJson()).toList();
    }
    if (this.requestRecievedDetails != null) {
      data['requestRecievedDetails'] =
          this.requestRecievedDetails!.map((v) => v.toJson()).toList();
    }
    if (this.requestWishListDetails != null) {
      data['requestWishListDetails'] =
          this.requestWishListDetails!.map((v) => v.toJson()).toList();
    }
    data['customer_obj_id'] = this.customerObjId;
    if (this.cusomterDetails != null) {
      data['cusomter_details'] =
          this.cusomterDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RequestSentDetails {
  String? sentId;
 

  RequestSentDetails(
      {this.sentId,
       });

  RequestSentDetails.fromJson(Map<String, dynamic> json) {
    sentId = json['_id'] ?? '';
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sentId;
    
    return data;
  }
}

class RequestRecievedDetails {
  String? recievedId;
  
  RequestRecievedDetails(
      {this.recievedId,
        });

RequestRecievedDetails.fromJson(Map<String, dynamic> json) {
    recievedId = json['_id'] ?? '';
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.recievedId;
    
    return data;
  }
}

class RequestWishListDetails {
  String? wishlistId;
  
  RequestWishListDetails(
      {this.wishlistId,
        });

RequestWishListDetails.fromJson(Map<String, dynamic> json) {
    wishlistId = json['_id'] ?? '';
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.wishlistId;
    
    return data;
  }
}

class AuthDetails {
  String? countryCode;
  String? mobileNumber;
  String? email;
  String? password;

  AuthDetails({this.countryCode, this.mobileNumber, this.email, this.password});

  AuthDetails.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'] != null ? json['country_code'] : "";
    mobileNumber = json['mobile_number'] != null ? json['mobile_number'] : "";
    email = json['email'] != null ? json['email'] : "";
    password = json['password'] != null ? json['password'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}



class CusomterDetails {
  String? sId;
  PersonalDetails? personalDetails;
  String? memberType;
  String? customerId;
  String? userObjId;
  String? referalCode;
  List<Attachments>? attachments;
  String? createdAt;
  String? updatedAt;
  int? iV;
  ReligionCommunity? religionCommunity;
  int? stepperFormStage;
  CommunicationDetials? communicationDetials;
  PermanentAddress? permanentAddress;
  CarrierAndWorkingDetails? carrierAndWorkingDetails;
  JathagamDetails? jathagamDetails;
  FamilyDetails? familyDetails;

  CusomterDetails(
      {this.sId,
        this.personalDetails,
        this.memberType,
        this.customerId,
        this.userObjId,
        this.referalCode,
        this.attachments,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.religionCommunity,
        this.stepperFormStage,
        this.communicationDetials,
        this.permanentAddress,
        this.carrierAndWorkingDetails,
        this.jathagamDetails,
        this.familyDetails});

  CusomterDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id']  != null ? json['_id'] : "";
    personalDetails = json['personal_details'] != null
        ? new PersonalDetails.fromJson(json['personal_details'] as Map<String, dynamic>)
        : null;
    memberType = json['member_type'] != null ? json['member_type'] : "";
    customerId = json['customer_id'] != null ? json['customer_id'] : "";
    userObjId = json['user_obj_id'] != null ? json['user_obj_id'] : "";
    referalCode = json['referal_code'] != null ? json['referal_code'] : "";
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v as Map<String, dynamic>));
      });
    }
    createdAt = json['createdAt'] != null ? json['createdAt'] : "";
    updatedAt = json['updatedAt'] != null ? json['updatedAt'] : "";
    iV = json['__v'] != null ? json['country_code'] : 0;
    religionCommunity = json['religion_community'] != null
        ? new ReligionCommunity.fromJson(json['religion_community'] as Map<String, dynamic>)
        : null;
    stepperFormStage = json['stepper_form_stage'] != null ? json['stepper_form_stage'] : 0;
    communicationDetials = json['communication_detials'] != null
        ? new CommunicationDetials.fromJson(json['communication_detials'] as Map<String, dynamic>)
        : null;
    permanentAddress = json['permanent_address'] != null
        ? new PermanentAddress.fromJson(json['permanent_address'] as Map<String, dynamic>)
        : null;
    carrierAndWorkingDetails = json['carrier_and_working_details'] != null
        ? new CarrierAndWorkingDetails.fromJson(
        json['carrier_and_working_details'] as Map<String, dynamic>)
        : null;
    jathagamDetails = json['jathagam_details'] != null
        ? new JathagamDetails.fromJson(json['jathagam_details'] as Map<String, dynamic>)
        : null;
    familyDetails = json['family_details'] != null
        ? new FamilyDetails.fromJson(json['family_details'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.personalDetails != null) {
      data['personal_details'] = this.personalDetails!.toJson();
    }
    data['member_type'] = this.memberType;
    data['customer_id'] = this.customerId;
    data['user_obj_id'] = this.userObjId;
    data['referal_code'] = this.referalCode;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.religionCommunity != null) {
      data['religion_community'] = this.religionCommunity!.toJson();
    }
    data['stepper_form_stage'] = this.stepperFormStage;
    if (this.communicationDetials != null) {
      data['communication_detials'] = this.communicationDetials!.toJson();
    }
    if (this.permanentAddress != null) {
      data['permanent_address'] = this.permanentAddress!.toJson();
    }
    if (this.carrierAndWorkingDetails != null) {
      data['carrier_and_working_details'] =
          this.carrierAndWorkingDetails!.toJson();
    }
    if (this.jathagamDetails != null) {
      data['jathagam_details'] = this.jathagamDetails!.toJson();
    }
    if (this.familyDetails != null) {
      data['family_details'] = this.familyDetails!.toJson();
    }
    return data;
  }
}

class ReligionCommunity {
  String? caste;
  String? community;
  String? motherTounge;
  String? religion;
  String? subCaste;

  ReligionCommunity(
      {this.caste,
        this.community,
        this.motherTounge,
        this.religion,
        this.subCaste});

  ReligionCommunity.fromJson(Map<String, dynamic> json) {
    caste = json['caste'] != null ? json['caste'] : "";
    community = json['community']!= null ? json['community'] : "";
    motherTounge = json['mother_tounge']!= null ? json['mother_tounge'] : "";
    religion = json['religion']!= null ? json['religion'] : "";
    subCaste = json['sub_caste']!= null ? json['sub_caste'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caste'] = this.caste;
    data['community'] = this.community;
    data['mother_tounge'] = this.motherTounge;
    data['religion'] = this.religion;
    data['sub_caste'] = this.subCaste;
    return data;
  }
}

// class CommunicationDetials {
//   String? area;
//   String? city;
//   String? country;
//   String? district;
//   String? doorNo;
//   String? currentNationality;
//   String? nationality;
//   String? state;
//   String? street;
//
//
//   CommunicationDetials(
//       {this.area,
//         this.city,
//         this.country,
//         this.district,
//         this.doorNo,
//         this.nationality,
//         this.state,
//         this.street,
//         this.currentNationality});
//
//   CommunicationDetials.fromJson(Map<String, dynamic> json) {
//     area = json['area'] != null ? json['area'] : "";
//     city = json['city'] != null ? json['city'] : "";
//     country = json['country'] != null ? json['country'] : "";
//     district = json['district'] != null ? json['district'] : "";
//     doorNo = json['door_no'] != null ? json['door_no'] : "";
//     nationality = json['nationality'] != null ? json['nationality'] : "";
//     state = json['state'] != null ? json['state'] : "";
//     street = json['street'] != null ? json['street'] : "";
//     currentNationality = json['current_nationality'] != null ? json['current_nationality'] : "";
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['area'] = this.area;
//     data['current_nationality'] = this.currentNationality;
//     data['city'] = this.city;
//     data['country'] = this.country;
//     data['district'] = this.district;
//     data['door_no'] = this.doorNo;
//     data['nationality'] = this.nationality;
//     data['state'] = this.state;
//     data['street'] = this.street;
//
//     return data;
//   }
// }

class PermanentAddress {
  String? area;
  String? city;
  String? country;
  String? district;
  String? doorNo;
  String? residentStatus;
  String? state;
  String? street;

  PermanentAddress(
      {this.area,
        this.city,
        this.country,
        this.district,
        this.doorNo,
        this.residentStatus,
        this.state,
        this.street});

  PermanentAddress.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? json['area'] : "";
    city = json['city'] != null ? json['city'] : "";
    country = json['country'] != null ? json['country'] : "";
    district = json['district'] != null ? json['district'] : "";
    doorNo = json['door_no'] != null ? json['door_no'] : "";
    residentStatus = json['resident_status']  != null ? json['resident_status'] : "";
    state = json['state'] != null ? json['state'] : "";
    street = json['street'] != null ? json['street'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['city'] = this.city;
    data['country'] = this.country;
    data['district'] = this.district;
    data['door_no'] = this.doorNo;
    data['state'] = this.state;
    data['street'] = this.street;
    return data;
  }
}

class PersonalDetails {
  String? firstName;
  String? lastName;
  String? nickName;
  String? gender;
  int? age;
  String? dOB;
  String? profileFor;
  String? childrenStatus;
  String? diet;
  int? height;
  String? hobbies;
  String? maritalDetails;
  int? noOfChildren;
  String? physicalStatus;

  String? skinTone;
  int? weight;

  PersonalDetails(
      {this.firstName,
        this.lastName,
        this.nickName,
        this.gender,
        this.age,
        this.dOB,
        this.childrenStatus,
        this.diet,
        this.height,
        this.hobbies,
        this.maritalDetails,
        this.noOfChildren,
        this.skinTone,
        this.weight,
        this.profileFor});

  PersonalDetails.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'] != null ? json['first_name'] : "";
    lastName = json['last_name'] != null ? json['last_name'] : "";
    nickName = json['nick_name'] != null ? json['nick_name'] : "";
    gender = json['gender'] != null ? json['gender'] : "";
    age = json['age'] != null ? json['age'] : 0;
    dOB = json['DOB'] != null ? json['DOB'] : "";
    childrenStatus = json['children_status'] != null ? json['children_status'] : "";
    diet = json['diet'] != null ? json['diet'] : "";
    height = json['height'] != null ? json['height'] : 0;
    hobbies = json['hobbies'] != null ? json['hobbies'] : "";
    maritalDetails = json['marital_details'] != null ? json['marital_details'] : "";
    noOfChildren = json['no_of_children'] != null ? json['no_of_children'] : 0;
    skinTone = json['skin_tone'] != null ? json['skin_tone'] : "";
    weight = json['weight'] != null ? json['weight'] : 0;
    profileFor = json['profile_for'] != null ? json['profile_for'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['nick_name'] = this.nickName;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['DOB'] = this.dOB;
    data['children_status'] = this.childrenStatus;
    data['diet'] = this.diet;
    data['height'] = this.height;
    data['hobbies'] = this.hobbies;
    data['marital_details'] = this.maritalDetails;
    data['no_of_children'] = this.noOfChildren;
    data['skin_tone'] = this.skinTone;
    data['weight'] = this.weight;
    data['profile_for'] = this.profileFor;
    return data;
  }
}

class Attachments {
  String? sId;
  String? url;
  int? order;

  Attachments({this.sId, this.url, this.order});

  Attachments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] != null ? json['_id'] : "";
    url = json['url'] != null ? json['url'] : "";
    order = json['order'] != null ? json['order'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['url'] = this.url;
    data['order'] = this.order;
    return data;
  }
}

class CarrierAndWorkingDetails {
  String? educationalQualification;
  String? workingIn;
  String? workingAs;
  String? companyDetails;
  dynamic? annualIncome;

  CarrierAndWorkingDetails(
      {this.educationalQualification,
        this.workingIn,
        this.workingAs,
        this.companyDetails,
        this.annualIncome});

  CarrierAndWorkingDetails.fromJson(Map<String, dynamic> json) {
    educationalQualification = json['educational_qualification']  != null ? json['educational_qualification'] : "";
    workingIn = json['working_in']  != null ? json['working_in'] : "";
    workingAs = json['working_as'] != null ? json['working_as'] : "";
    companyDetails = json['company_details'] != null ? json['company_details'] : "";
    annualIncome = json['annual_income'] != null ? json['annual_income'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['educational_qualification'] = this.educationalQualification;
    data['working_in'] = this.workingIn;
    data['working_as'] = this.workingAs;
    data['company_details'] = this.companyDetails;
    data['annual_income'] = this.annualIncome;
    return data;
  }
}

class JathagamDetails {
  String? doshamDetails;
  String? gothram;
  String? kuladeivam;
  String? laknam;
  String? placeOfBirth;
  String? timeOfBirth;
  String? natchathiram;
  String? rasi;
  String? dosham;

  JathagamDetails(
      {this.doshamDetails,
        this.gothram,
        this.kuladeivam,
        this.laknam,
        this.natchathiram,
        this.placeOfBirth,
        this.timeOfBirth,
        this.rasi,
        this.dosham});

  JathagamDetails.fromJson(Map<String, dynamic> json) {
    doshamDetails = json['dosham_details'] != null ? json['dosham_details'] : "";
    gothram = json['gothram'] != null ? json['gothram'] : "";
    kuladeivam = json['kuladeivam'] != null ? json['kuladeivam'] : "";
    laknam = json['laknam'] != null ? json['laknam'] : "";
    placeOfBirth = json['placeOfBirth'] != null ? json['placeOfBirth'] : "";
    timeOfBirth = json['timeOfBirth'] != null ? json['timeOfBirth'] : "";
    natchathiram = json['natchathiram'] != null ? json['natchathiram'] : "";
    rasi = json['rasi'] != null ? json['rasi'] : "";
    dosham = json['dosham'] != null ? json['dosham'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dosham_details'] = this.doshamDetails;
    data['gothram'] = this.gothram;
    data['kuladeivam'] = this.kuladeivam;
    data['laknam'] = this.laknam;
    data['natchathiram'] = this.natchathiram;
    data['rasi'] = this.rasi;
    data['dosham'] = this.dosham;
    return data;
  }
}

class FamilyDetails {
  String? expectation;
  String? fatherName;
  String? fatherOcuupation;
  String? motherName;
  String? motherOccupation;
  int? noOfBro;
  int? noOfBroMarried;
  int? noOfSis;
  int? noOfSisMarried;
  int? ownVehicle;
  int? ownHouse;
  int? ownLands;
  int? ownFlats;

  FamilyDetails(
      {this.expectation,
        this.fatherName,
        this.fatherOcuupation,
        this.motherName,
        this.motherOccupation,
        this.noOfBro,
        this.noOfBroMarried,
        this.noOfSis,
        this.noOfSisMarried,
        this.ownVehicle,
        this.ownHouse,
        this.ownLands,
        this.ownFlats});

  FamilyDetails.fromJson(Map<String, dynamic> json) {
    expectation = json['expectation'] != null ? json['expectation'] : "";
    fatherName = json['father_name'] != null ? json['father_name'] : "";
    fatherOcuupation = json['father_ocuupation'] != null ? json['father_ocuupation'] : "";
    motherName = json['mother_name'] != null ? json['mother_name'] : "";
    motherOccupation = json['mother_occupation'] != null ? json['mother_occupation'] : "";
    noOfBro = json['no_of_bro'] != null ? json['no_of_bro'] : 0;
    noOfBroMarried = json['no_of_bro_married'] != null ? json['no_of_bro_married'] : 0;
    noOfSis = json['no_of_sis'] != null ? json['no_of_sis'] : 0;
    noOfSisMarried = json['no_of_sis_married'] != null ? json['no_of_sis_married'] : 0;
    ownVehicle = json['own_vehicle'] != null ? json['own_vehicle'] : 0;
    ownHouse = json['own_house'] != null ? json['own_house'] : 0;
    ownLands = json['own_lands'] != null ? json['own_lands'] : 0;
    ownFlats = json['own_flats'] != null ? json['own_flats'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expectation'] = this.expectation;
    data['father_name'] = this.fatherName;
    data['father_ocuupation'] = this.fatherOcuupation;
    data['mother_name'] = this.motherName;
    data['mother_occupation'] = this.motherOccupation;
    data['no_of_bro'] = this.noOfBro;
    data['no_of_bro_married'] = this.noOfBroMarried;
    data['no_of_sis'] = this.noOfSis;
    data['no_of_sis_married'] = this.noOfSisMarried;
    data['own_vehicle'] = this.ownVehicle;
    data['own_house'] = this.ownHouse;
    data['own_lands'] = this.ownLands;
    data['own_flats'] = this.ownFlats;
    return data;
  }
}

// class PersonalDetails {
//   String? firstName;
//   String? lastName;
//   String? nickName;
//   String? gender;
//   int? age;
//   String? dOB;
//
//   PersonalDetails(
//       {this.firstName,
//         this.lastName,
//         this.nickName,
//         this.gender,
//         this.age,
//         this.dOB});
//
//   PersonalDetails.fromJson(Map<String, dynamic> json) {
//     firstName = json['first_name'] != null ? json['first_name'] : "";
//     lastName = json['last_name'] != null ? json['last_name'] : "";
//     nickName = json['nick_name'] != null ? json['nick_name'] : "";
//     gender = json['nick_name'] != null ? json['nick_name'] : "";
//     age = json['age'] != null ? json['age'] : 0;
//     dOB = json['DOB'] != null ? json['DOB'] : "";
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['nick_name'] = this.nickName;
//     data['gender'] = this.gender;
//     data['age'] = this.age;
//     data['DOB'] = this.dOB;
//     return data;
//   }
// }

class RecentlyViewed {
  AuthDetails? authDetails;
  String? sId;
  String? userType;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? customerObjId;
  List<CusomterDetails>? cusomterDetails;
  List<RequestSentDetails>? requestSentDetails;
  List<RequestRecievedDetails>? requestRecievedDetails;
  List<RequestWishListDetails>? requestWishListDetails;
  // List<RequestSentDetails>? requestSentDetails;
  // List<RequestSentAcceptDetails>? requestSentAcceptDetails;
  // List<RequestSentRejectDetails>? requestSentRejectDetails;
  // List<RequestRecievedDetails>? requestRecievedDetails;
  // List<RequestRecievedAcceptDetails>? requestRecievedAcceptDetails;
  // List<RequestRecievedRejectDetails>? requestRecievedRejectDetails;
  // List<RequestWishListDetails>? requestWishListDetails;
  // List<RequestVisitorDetails>? requestVisitorDetails;
  int? isRequestSent;
  int? isRequestSentAccepted;
  int? isRequestSentRejected;
  int? isRequestRecieved;
  int? isRequestRecievedAccepted;
  int? isRequestRecievedRejected;
  int? isAddedToWhishList;

  RecentlyViewed(
      {this.sId,
        this.authDetails,
        this.userType,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.customerObjId,
        this.cusomterDetails,
        this.requestSentDetails,
        this.requestRecievedDetails,
        this.requestWishListDetails,
        // this.requestSentDetails,
        // this.requestSentAcceptDetails,
        // this.requestSentRejectDetails,
        // this.requestRecievedDetails,
        // this.requestRecievedAcceptDetails,
        // this.requestRecievedRejectDetails,
        // this.requestWishListDetails,
        // this.requestVisitorDetails,
        this.isRequestSent,
        this.isRequestSentAccepted,
        this.isRequestSentRejected,
        this.isRequestRecieved,
        this.isRequestRecievedAccepted,
        this.isRequestRecievedRejected,
        this.isAddedToWhishList});

  RecentlyViewed.fromJson(Map<String, dynamic> json) {
    authDetails = json['auth_details'] != null
        ? new AuthDetails.fromJson(json['auth_details'] as Map<String, dynamic>)
        : null;
    sId = json['_id'] != null ? json['_id'] : "";
    userType = json['user_type'] != null ? json['user_type'] : "";
    createdAt = json['createdAt'] != null ? json['createdAt'] : "";
    updatedAt = json['updatedAt'] != null ? json['updatedAt'] : "";
    iV = json['__v'] != null ? json['__v'] : 0;
    customerObjId = json['customer_obj_id']  != null ? json['customer_obj_id'] : "";
    if (json['cusomter_details'] != null) {
      cusomterDetails = <CusomterDetails>[];
      // json['cusomter_details'].forEach((v) {
        cusomterDetails!.add(new CusomterDetails.fromJson(json['cusomter_details'] as Map<String, dynamic> ));
      // });
    }
    if (json['requestSentDetails'] != null) {
      requestSentDetails = <RequestSentDetails>[];
      json['requestSentDetails'].forEach((v) {
        requestSentDetails!.add(new RequestSentDetails.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['requestRecievedDetails'] != null) {
      requestRecievedDetails = <RequestRecievedDetails>[];
      json['requestRecievedDetails'].forEach((v) {
        requestRecievedDetails!.add(new RequestRecievedDetails.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['requestWishListDetails'] != null) {
      requestWishListDetails = <RequestWishListDetails>[];
      json['requestWishListDetails'].forEach((v) {
        requestWishListDetails!.add(new RequestWishListDetails.fromJson(v as Map<String, dynamic>));
      });
    }
    isRequestSent = json['isRequestSent'] != null ? json['isRequestSent'] : 0;
    isRequestSentAccepted = json['isRequestSentAccepted'] != null ? json['isRequestSentAccepted'] : 0;
    isRequestSentRejected = json['isRequestSentRejected'] != null ? json['isRequestSentRejected'] : 0;
    isRequestRecieved = json['isRequestRecieved'] != null ? json['isRequestRecieved'] : 0;
    isRequestRecievedAccepted = json['isRequestRecievedAccepted'] != null ? json['isRequestRecievedAccepted'] : 0;
    isRequestRecievedRejected = json['isRequestRecievedRejected'] != null ? json['isRequestRecievedRejected'] : 0;
    isAddedToWhishList = json['isAddedToWhishList'] != null ? json['isAddedToWhishList'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authDetails != null) {
      data['auth_details'] = this.authDetails!.toJson();
    }
    data['_id'] = this.sId;
    data['user_type'] = this.userType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['customer_obj_id'] = this.customerObjId;
    if (this.cusomterDetails != null) {
      data['cusomter_details'] =
          this.cusomterDetails!.map((v) => v.toJson()).toList();
    }
    if (this.requestSentDetails != null) {
      data['requestSentDetails'] =
          this.requestSentDetails!.map((v) => v.toJson()).toList();
    }
    if (this.requestRecievedDetails != null) {
      data['requestRecievedDetails'] =
          this.requestRecievedDetails!.map((v) => v.toJson()).toList();
    }
    if (this.requestWishListDetails != null) {
      data['requestWishListDetails'] =
          this.requestWishListDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeaturedMembers {
  AuthDetails? authDetails;
  String? sId;
  String? userType;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? customerObjId;
  List<CusomterDetails>? cusomterDetails;
  List<RequestSentDetails>? requestSentDetails;
  List<RequestRecievedDetails>? requestRecievedDetails;
  List<RequestWishListDetails>? requestWishListDetails;
  // List<RequestSentDetails>? requestSentDetails;
  // List<RequestSentAcceptDetails>? requestSentAcceptDetails;
  // List<RequestSentRejectDetails>? requestSentRejectDetails;
  // List<RequestRecievedDetails>? requestRecievedDetails;
  // List<RequestRecievedAcceptDetails>? requestRecievedAcceptDetails;
  // List<RequestRecievedRejectDetails>? requestRecievedRejectDetails;
  // List<RequestWishListDetails>? requestWishListDetails;
  // List<RequestVisitorDetails>? requestVisitorDetails;
  int? isRequestSent;
  int? isRequestSentAccepted;
  int? isRequestSentRejected;
  int? isRequestRecieved;
  int? isRequestRecievedAccepted;
  int? isRequestRecievedRejected;
  int? isAddedToWhishList;

  FeaturedMembers(
      {this.sId,
        this.authDetails,
        this.userType,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.customerObjId,
        this.cusomterDetails,
        this.requestSentDetails,
        this.requestRecievedDetails,
        this.requestWishListDetails,
        // this.requestSentDetails,
        // this.requestSentAcceptDetails,
        // this.requestSentRejectDetails,
        // this.requestRecievedDetails,
        // this.requestRecievedAcceptDetails,
        // this.requestRecievedRejectDetails,
        // this.requestWishListDetails,
        // this.requestVisitorDetails,
        this.isRequestSent,
        this.isRequestSentAccepted,
        this.isRequestSentRejected,
        this.isRequestRecieved,
        this.isRequestRecievedAccepted,
        this.isRequestRecievedRejected,
        this.isAddedToWhishList});

  FeaturedMembers.fromJson(Map<String, dynamic> json) {
    authDetails = json['auth_details'] != null
        ? new AuthDetails.fromJson(json['auth_details'] as Map<String, dynamic>)
        : null;
    sId = json['_id'] != null ? json['_id'] : "";
    userType = json['user_type'] != null ? json['user_type'] : "";
    createdAt = json['createdAt'] != null ? json['createdAt'] : "";
    updatedAt = json['updatedAt'] != null ? json['updatedAt'] : "";
    iV = json['__v'] != null ? json['__v'] : 0;
    customerObjId = json['customer_obj_id']  != null ? json['customer_obj_id'] : "";
    if (json['cusomter_details'] != null) {
      cusomterDetails = <CusomterDetails>[];
      // json['cusomter_details'].forEach((v) {
        cusomterDetails!.add(new CusomterDetails.fromJson(json['cusomter_details'] as Map<String, dynamic> ));
      // });
    }
    if (json['requestSentDetails'] != null) {
      requestSentDetails = <RequestSentDetails>[];
      json['requestSentDetails'].forEach((v) {
        requestSentDetails!.add(new RequestSentDetails.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['requestRecievedDetails'] != null) {
      requestRecievedDetails = <RequestRecievedDetails>[];
      json['requestRecievedDetails'].forEach((v) {
        requestRecievedDetails!.add(new RequestRecievedDetails.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['requestWishListDetails'] != null) {
      requestWishListDetails = <RequestWishListDetails>[];
      json['requestWishListDetails'].forEach((v) {
        requestWishListDetails!.add(new RequestWishListDetails.fromJson(v as Map<String, dynamic>));
      });
    }
    isRequestSent = json['isRequestSent'] != null ? json['isRequestSent'] : 0;
    isRequestSentAccepted = json['isRequestSentAccepted'] != null ? json['isRequestSentAccepted'] : 0;
    isRequestSentRejected = json['isRequestSentRejected'] != null ? json['isRequestSentRejected'] : 0;
    isRequestRecieved = json['isRequestRecieved'] != null ? json['isRequestRecieved'] : 0;
    isRequestRecievedAccepted = json['isRequestRecievedAccepted'] != null ? json['isRequestRecievedAccepted'] : 0;
    isRequestRecievedRejected = json['isRequestRecievedRejected'] != null ? json['isRequestRecievedRejected'] : 0;
    isAddedToWhishList = json['isAddedToWhishList'] != null ? json['isAddedToWhishList'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authDetails != null) {
      data['auth_details'] = this.authDetails!.toJson();
    }
    data['_id'] = this.sId;
    data['user_type'] = this.userType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['customer_obj_id'] = this.customerObjId;
    if (this.cusomterDetails != null) {
      data['cusomter_details'] =
          this.cusomterDetails!.map((v) => v.toJson()).toList();
    }
    if (this.requestSentDetails != null) {
      data['requestSentDetails'] =
          this.requestSentDetails!.map((v) => v.toJson()).toList();
    }
    if (this.requestRecievedDetails != null) {
      data['requestRecievedDetails'] =
          this.requestRecievedDetails!.map((v) => v.toJson()).toList();
    }
    if (this.requestWishListDetails != null) {
      data['requestWishListDetails'] =
          this.requestWishListDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecommendedMembers {
  AuthDetails? authDetails;
  String? sId;
  String? userType;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? customerObjId;
  List<CusomterDetails>? cusomterDetails;
  List<RequestSentDetails>? requestSentDetails;
  List<RequestRecievedDetails>? requestRecievedDetails;
  List<RequestWishListDetails>? requestWishListDetails;
  // List<RequestSentDetails>? requestSentDetails;
  // List<RequestSentAcceptDetails>? requestSentAcceptDetails;
  // List<RequestSentRejectDetails>? requestSentRejectDetails;
  // List<RequestRecievedDetails>? requestRecievedDetails;
  // List<RequestRecievedAcceptDetails>? requestRecievedAcceptDetails;
  // List<RequestRecievedRejectDetails>? requestRecievedRejectDetails;
  // List<RequestWishListDetails>? requestWishListDetails;
  // List<RequestVisitorDetails>? requestVisitorDetails;
  int? isRequestSent;
  int? isRequestSentAccepted;
  int? isRequestSentRejected;
  int? isRequestRecieved;
  int? isRequestRecievedAccepted;
  int? isRequestRecievedRejected;
  int? isAddedToWhishList;

  RecommendedMembers(
      {this.sId,
        this.authDetails,
        this.userType,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.customerObjId,
        this.cusomterDetails,
        this.requestSentDetails,
        this.requestRecievedDetails,
        this.requestWishListDetails,
        // this.requestSentDetails,
        // this.requestSentAcceptDetails,
        // this.requestSentRejectDetails,
        // this.requestRecievedDetails,
        // this.requestRecievedAcceptDetails,
        // this.requestRecievedRejectDetails,
        // this.requestWishListDetails,
        // this.requestVisitorDetails,
        this.isRequestSent,
        this.isRequestSentAccepted,
        this.isRequestSentRejected,
        this.isRequestRecieved,
        this.isRequestRecievedAccepted,
        this.isRequestRecievedRejected,
        this.isAddedToWhishList});

  RecommendedMembers.fromJson(Map<String, dynamic> json) {
    authDetails = json['auth_details'] != null
        ? new AuthDetails.fromJson(json['auth_details'] as Map<String, dynamic>)
        : null;
    sId = json['_id'] != null ? json['_id'] : "";
    userType = json['user_type'] != null ? json['user_type'] : "";
    createdAt = json['createdAt'] != null ? json['createdAt'] : "";
    updatedAt = json['updatedAt'] != null ? json['updatedAt'] : "";
    iV = json['__v'] != null ? json['__v'] : 0;
    customerObjId = json['customer_obj_id']  != null ? json['customer_obj_id'] : "";
    if (json['cusomter_details'] != null) {
      cusomterDetails = <CusomterDetails>[];
      // json['cusomter_details'].forEach((v) {
        cusomterDetails!.add(new CusomterDetails.fromJson(json['cusomter_details'] as Map<String, dynamic> ));
      // });
    }
    if (json['requestSentDetails'] != null) {
      requestSentDetails = <RequestSentDetails>[];
      json['requestSentDetails'].forEach((v) {
        requestSentDetails!.add(new RequestSentDetails.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['requestRecievedDetails'] != null) {
      requestRecievedDetails = <RequestRecievedDetails>[];
      json['requestRecievedDetails'].forEach((v) {
        requestRecievedDetails!.add(new RequestRecievedDetails.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['requestWishListDetails'] != null) {
      requestWishListDetails = <RequestWishListDetails>[];
      json['requestWishListDetails'].forEach((v) {
        requestWishListDetails!.add(new RequestWishListDetails.fromJson(v as Map<String, dynamic>));
      });
    }
    isRequestSent = json['isRequestSent'] != null ? json['isRequestSent'] : 0;
    isRequestSentAccepted = json['isRequestSentAccepted'] != null ? json['isRequestSentAccepted'] : 0;
    isRequestSentRejected = json['isRequestSentRejected'] != null ? json['isRequestSentRejected'] : 0;
    isRequestRecieved = json['isRequestRecieved'] != null ? json['isRequestRecieved'] : 0;
    isRequestRecievedAccepted = json['isRequestRecievedAccepted'] != null ? json['isRequestRecievedAccepted'] : 0;
    isRequestRecievedRejected = json['isRequestRecievedRejected'] != null ? json['isRequestRecievedRejected'] : 0;
    isAddedToWhishList = json['isAddedToWhishList'] != null ? json['isAddedToWhishList'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authDetails != null) {
      data['auth_details'] = this.authDetails!.toJson();
    }
    data['_id'] = this.sId;
    data['user_type'] = this.userType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['customer_obj_id'] = this.customerObjId;
    if (this.cusomterDetails != null) {
      data['cusomter_details'] =
          this.cusomterDetails!.map((v) => v.toJson()).toList();
    }
    if (this.requestSentDetails != null) {
      data['requestSentDetails'] =
          this.requestSentDetails!.map((v) => v.toJson()).toList();
    }
    if (this.requestRecievedDetails != null) {
      data['requestRecievedDetails'] =
          this.requestRecievedDetails!.map((v) => v.toJson()).toList();
    }
    if (this.requestWishListDetails != null) {
      data['requestWishListDetails'] =
          this.requestWishListDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VisitedBy {
  AuthDetails? authDetails;
  String? sId;
  String? profileFor;
  String? userType;
  String? createdAt;
  String? updatedAt;
  int? iV;

  VisitedBy(
      {this.authDetails,
        this.sId,
        this.profileFor,
        this.userType,
        this.createdAt,
        this.updatedAt,
        this.iV,
      });

  VisitedBy.fromJson(Map<String, dynamic> json) {
    authDetails = json['auth_details'] != null
        ? new AuthDetails.fromJson(json['auth_details'] as Map<String, dynamic>)
        : null;
    sId = json['_id'] != null ? json['_id'] : "";
    profileFor = json['profile_for'] != null ? json['profile_for'] : "";
    userType = json['user_type'] != null ? json['user_type'] : "";
    createdAt = json['createdAt'] != null ? json['createdAt'] : "";
    updatedAt = json['updatedAt'] != null ? json['updatedAt'] : "";
    iV = json['__v'] != null ? json['__v'] : 0;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authDetails != null) {
      data['auth_details'] = this.authDetails!.toJson();
    }
    data['_id'] = this.sId;
    data['profile_for'] = this.profileFor;
    data['user_type'] = this.userType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

// class CustomerObjId {
//   // Horoscope? horoscope;
//   ReligionCommunity? religionCommunity;
//   CommunicationDetials? communicationDetials;
//   PermanentAddress? permanentAddress;
//   PersonalDetails? personalDetails;
//   CarrierAndWorkingDetails? carrierAndWorkingDetails;
//   JathagamDetails? jathagamDetails;
//   FamilyDetails? familyDetails;
//   String? memberType;
//   String? sId;
//   String? userObjId;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//   int? stepperFormStage;
//   List<String>? attachments;
//
//   CustomerObjId(
//       {
//         this.religionCommunity,
//         this.communicationDetials,
//         this.permanentAddress,
//         this.personalDetails,
//         this.carrierAndWorkingDetails,
//         this.jathagamDetails,
//         this.familyDetails,
//         this.memberType,
//         this.sId,
//         this.userObjId,
//         this.createdAt,
//         this.updatedAt,
//         this.iV,
//         this.stepperFormStage,
//         this.attachments});
//
//   CustomerObjId.fromJson(Map<String, dynamic> json) {
//     // horoscope = json['horoscope'] != null
//     //     ? new Horoscope.fromJson(json['horoscope'])
//     //     : null;
//     religionCommunity = json['religion_community'] != null
//         ? new ReligionCommunity.fromJson(json['religion_community'] as Map<String, dynamic>)
//         : null;
//     communicationDetials = json['communication_detials'] != null
//         ? new CommunicationDetials.fromJson(json['communication_detials'] as Map<String, dynamic>)
//         : null;
//     permanentAddress = json['permanent_address'] != null
//         ? new PermanentAddress.fromJson(json['permanent_address'] as Map<String, dynamic>)
//         : null;
//     personalDetails = json['personal_details'] != null
//         ? new PersonalDetails.fromJson(json['personal_details'] as Map<String, dynamic>)
//         : null;
//     carrierAndWorkingDetails = json['carrier_and_working_details'] != null
//         ? new CarrierAndWorkingDetails.fromJson(
//         json['carrier_and_working_details'] as Map<String, dynamic>)
//         : null;
//     jathagamDetails = json['jathagam_details'] != null
//         ? new JathagamDetails.fromJson(json['jathagam_details'] as Map<String, dynamic>)
//         : null;
//     familyDetails = json['family_details'] != null
//         ? new FamilyDetails.fromJson(json['family_details'] as Map<String, dynamic>)
//         : null;
//     memberType = json['member_type'] != null ? json['member_type'] : "";
//     sId = json['_id'] != null ? json['_id'] : "";
//     userObjId = json['user_obj_id'] != null ? json['user_obj_id'] : "";
//     createdAt = json['createdAt'] != null ? json['createdAt'] : "";
//     updatedAt = json['updatedAt'] != null ? json['updatedAt'] : "";
//     iV = json['__v'] != null ? json['__v'] : 0;
//     stepperFormStage = json['stepper_form_stage'] != null ? json['stepper_form_stage'] : 0;
//     if (json['attachments'] != null) {
//       attachments = <String>[];
//       json['attachments'].forEach((v) {
//         attachments!.add((v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     // if (this.horoscope != null) {
//     //   data['horoscope'] = this.horoscope!.toJson();
//     // }
//     if (this.religionCommunity != null) {
//       data['religion_community'] = this.religionCommunity!.toJson();
//     }
//     if (this.communicationDetials != null) {
//       data['communication_detials'] = this.communicationDetials!.toJson();
//     }
//     if (this.permanentAddress != null) {
//       data['permanent_address'] = this.permanentAddress!.toJson();
//     }
//     if (this.personalDetails != null) {
//       data['personal_details'] = this.personalDetails!.toJson();
//     }
//     if (this.carrierAndWorkingDetails != null) {
//       data['carrier_and_working_details'] =
//           this.carrierAndWorkingDetails!.toJson();
//     }
//     if (this.jathagamDetails != null) {
//       data['jathagam_details'] = this.jathagamDetails!.toJson();
//     }
//     if (this.familyDetails != null) {
//       data['family_details'] = this.familyDetails!.toJson();
//     }
//     data['member_type'] = this.memberType;
//     data['_id'] = this.sId;
//     data['user_obj_id'] = this.userObjId;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     data['stepper_form_stage'] = this.stepperFormStage;
//     if (this.attachments != null) {
//       data['attachments'] = this.attachments!.map((v) => v).toList();
//     }
//     return data;
//   }
// }

class CommunicationDetials {
  String? area;
  String? city;
  String? country;
  String? district;
  String? currentNationality;
  String? doorNo;
  String? nationality;
  String? state;
  String? street;

  CommunicationDetials(
      {this.area,
        this.city,
        this.country,
        this.district,
        this.doorNo,
        this.currentNationality,
        this.nationality,
        this.state,
        this.street});

  CommunicationDetials.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? json['area'] : "";
    city = json['city'] != null ? json['city'] : "";
    country = json['country'] != null ? json['country'] : "";
    district = json['district'] != null ? json['district'] : "";
    currentNationality = json['current_nationality'] != null ? json['current_nationality'] : "";
    doorNo = json['door_no'] != null ? json['door_no'] : "";
    nationality = json['nationality'] != null ? json['nationality'] : "";
    state = json['state'] != null ? json['state'] : "";
    street = json['street'] != null ? json['street'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['city'] = this.city;
    data['country'] = this.country;
    data['current_nationality'] = this.currentNationality;
    data['district'] = this.district;
    data['door_no'] = this.doorNo;
    data['nationality'] = this.nationality;
    data['state'] = this.state;
    data['street'] = this.street;
    return data;
  }
}

// class PersonalDetails {
//   String? firstName;
//   String? lastName;
//   String? nickName;
//   String? gender;
//   int? age;
//   String? dOB;
//   String? childrenStatus;
//   String? diet;
//   String? height;
//   String? hobbies;
//   String? maritalDetails;
//   String? noOfChildren;
//   String? skinTone;
//   int? weight;
//
//   PersonalDetails(
//       {this.firstName,
//         this.lastName,
//         this.nickName,
//         this.gender,
//         this.age,
//         this.dOB,
//         this.childrenStatus,
//         this.diet,
//         this.height,
//         this.hobbies,
//         this.maritalDetails,
//         this.noOfChildren,
//         this.skinTone,
//         this.weight});
//
//   PersonalDetails.fromJson(Map<String, dynamic> json) {
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     nickName = json['nick_name'];
//     gender = json['gender'];
//     age = json['age'];
//     dOB = json['DOB'];
//     childrenStatus = json['children_status'];
//     diet = json['diet'];
//     height = json['height'];
//     hobbies = json['hobbies'];
//     maritalDetails = json['marital_details'];
//     noOfChildren = json['no_of_children'];
//     skinTone = json['skin_tone'];
//     weight = json['weight'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['nick_name'] = this.nickName;
//     data['gender'] = this.gender;
//     data['age'] = this.age;
//     data['DOB'] = this.dOB;
//     data['children_status'] = this.childrenStatus;
//     data['diet'] = this.diet;
//     data['height'] = this.height;
//     data['hobbies'] = this.hobbies;
//     data['marital_details'] = this.maritalDetails;
//     data['no_of_children'] = this.noOfChildren;
//     data['skin_tone'] = this.skinTone;
//     data['weight'] = this.weight;
//     return data;
//   }
// }