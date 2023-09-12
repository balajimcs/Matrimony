// class receiviedProprosalModel {
//   int? success;
//   String? message;
//   int? status;
//   int? totalCount;
//   List<Data>? data;

//   receiviedProprosalModel(
//       {this.success, this.message, this.status, this.totalCount, this.data});

//   receiviedProprosalModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     message = json['message'];
//     status = json['status'];
//     totalCount = json['totalCount'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     data['message'] = this.message;
//     data['status'] = this.status;
//     data['totalCount'] = this.totalCount;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   String? sId;
//   RequestedBy? requestedBy;
//   String? requestFor;
//   String? message;
//   String? requestStatus;
//   String? requestStatusUpdatedTime;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;

//   Data(
//       {this.sId,
//       this.requestedBy,
//       this.requestFor,
//       this.message,
//       this.requestStatus,
//       this.requestStatusUpdatedTime,
//       this.createdAt,
//       this.updatedAt,
//       this.iV});

//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     requestedBy = json['requested_by'] != null
//         ? new RequestedBy.fromJson(json['requested_by'])
//         : null;
//     requestFor = json['request_for'];
//     message = json['message'];
//     requestStatus = json['request_status'];
//     requestStatusUpdatedTime = json['request_status_updated_time'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     if (this.requestedBy != null) {
//       data['requested_by'] = this.requestedBy!.toJson();
//     }
//     data['request_for'] = this.requestFor;
//     data['message'] = this.message;
//     data['request_status'] = this.requestStatus;
//     data['request_status_updated_time'] = this.requestStatusUpdatedTime;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }

// class RequestedBy {
//   AuthDetails? authDetails;
//   String? sId;
//   PersonalDetails? personalDetails;
//   String? profileFor;
//   String? userType;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//   CustomerObjId? customerObjId;
//   List<String>? whishListProfiles;

//   RequestedBy(
//       {this.authDetails,
//       this.sId,
//       this.personalDetails,
//       this.profileFor,
//       this.userType,
//       this.createdAt,
//       this.updatedAt,
//       this.iV,
//       this.customerObjId,
//       this.whishListProfiles});

//   RequestedBy.fromJson(Map<String, dynamic> json) {
//     authDetails = json['auth_details'] != null
//         ? new AuthDetails.fromJson(json['auth_details'])
//         : null;
//     sId = json['_id'];
//     personalDetails = json['personal_details'] != null
//         ? new PersonalDetails.fromJson(json['personal_details'])
//         : null;
//     profileFor = json['profile_for'];
//     userType = json['user_type'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//     customerObjId = json['customer_obj_id'] != null
//         ? new CustomerObjId.fromJson(json['customer_obj_id'])
//         : null;
//     whishListProfiles = json['whish_list_profiles'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.authDetails != null) {
//       data['auth_details'] = this.authDetails!.toJson();
//     }
//     data['_id'] = this.sId;
//     if (this.personalDetails != null) {
//       data['personal_details'] = this.personalDetails!.toJson();
//     }
//     data['profile_for'] = this.profileFor;
//     data['user_type'] = this.userType;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     if (this.customerObjId != null) {
//       data['customer_obj_id'] = this.customerObjId!.toJson();
//     }
//     data['whish_list_profiles'] = this.whishListProfiles;
//     return data;
//   }
// }

// class AuthDetails {
//   String? countryCode;
//   String? mobileNumber;
//   String? email;
//   String? password;

//   AuthDetails({this.countryCode, this.mobileNumber, this.email, this.password});

//   AuthDetails.fromJson(Map<String, dynamic> json) {
//     countryCode = json['country_code'];
//     mobileNumber = json['mobile_number'];
//     email = json['email'];
//     password = json['password'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['country_code'] = this.countryCode;
//     data['mobile_number'] = this.mobileNumber;
//     data['email'] = this.email;
//     data['password'] = this.password;
//     return data;
//   }
// }

// class PersonalDetails {
//   String? firstName;
//   String? lastName;
//   String? nickName;
//   String? gender;
//   int? age;
//   String? dOB;

//   PersonalDetails(
//       {this.firstName,
//       this.lastName,
//       this.nickName,
//       this.gender,
//       this.age,
//       this.dOB});

//   PersonalDetails.fromJson(Map<String, dynamic> json) {
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     nickName = json['nick_name'];
//     gender = json['gender'];
//     age = json['age'];
//     dOB = json['DOB'];
//   }

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
//   List<Null>? attachments;

//   CustomerObjId(
//       {
//       this.religionCommunity,
//       this.communicationDetials,
//       this.permanentAddress,
//       this.personalDetails,
//       this.carrierAndWorkingDetails,
//       this.jathagamDetails,
//       this.familyDetails,
//       this.memberType,
//       this.sId,
//       this.userObjId,
//       this.createdAt,
//       this.updatedAt,
//       this.iV,
//       this.stepperFormStage,
//       this.attachments});

//   CustomerObjId.fromJson(Map<String, dynamic> json) {
    
//     religionCommunity = json['religion_community'] != null
//         ? new ReligionCommunity.fromJson(json['religion_community'])
//         : null;
//     communicationDetials = json['communication_detials'] != null
//         ? new CommunicationDetials.fromJson(json['communication_detials'])
//         : null;
//     permanentAddress = json['permanent_address'] != null
//         ? new PermanentAddress.fromJson(json['permanent_address'])
//         : null;
//     personalDetails = json['personal_details'] != null
//         ? new PersonalDetails.fromJson(json['personal_details'])
//         : null;
//     carrierAndWorkingDetails = json['carrier_and_working_details'] != null
//         ? new CarrierAndWorkingDetails.fromJson(
//             json['carrier_and_working_details'])
//         : null;
//     jathagamDetails = json['jathagam_details'] != null
//         ? new JathagamDetails.fromJson(json['jathagam_details'])
//         : null;
//     familyDetails = json['family_details'] != null
//         ? new FamilyDetails.fromJson(json['family_details'])
//         : null;
//     memberType = json['member_type'];
//     sId = json['_id'];
//     userObjId = json['user_obj_id'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//     stepperFormStage = json['stepper_form_stage'];
    
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
   
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
    
//     return data;
//   }
// }



// class ReligionCommunity {
//   String? caste;
//   String? community;
//   String? motherTounge;
//   String? religion;
//   String? subCaste;

//   ReligionCommunity(
//       {this.caste,
//       this.community,
//       this.motherTounge,
//       this.religion,
//       this.subCaste});

//   ReligionCommunity.fromJson(Map<String, dynamic> json) {
//     caste = json['caste'];
//     community = json['community'];
//     motherTounge = json['mother_tounge'];
//     religion = json['religion'];
//     subCaste = json['sub_caste'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['caste'] = this.caste;
//     data['community'] = this.community;
//     data['mother_tounge'] = this.motherTounge;
//     data['religion'] = this.religion;
//     data['sub_caste'] = this.subCaste;
//     return data;
//   }
// }

// class CommunicationDetials {
//   String? area;
//   String? city;
//   String? country;
//   String? district;
//   String? doorNo;
//   String? nationality;
//   String? state;
//   String? street;

//   CommunicationDetials(
//       {this.area,
//       this.city,
//       this.country,
//       this.district,
//       this.doorNo,
//       this.nationality,
//       this.state,
//       this.street});

//   CommunicationDetials.fromJson(Map<String, dynamic> json) {
//     area = json['area'];
//     city = json['city'];
//     country = json['country'];
//     district = json['district'];
//     doorNo = json['door_no'];
//     nationality = json['nationality'];
//     state = json['state'];
//     street = json['street'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['area'] = this.area;
//     data['city'] = this.city;
//     data['country'] = this.country;
//     data['district'] = this.district;
//     data['door_no'] = this.doorNo;
//     data['nationality'] = this.nationality;
//     data['state'] = this.state;
//     data['street'] = this.street;
//     return data;
//   }
// }

// class PermanentAddress {
//   String? area;
//   String? city;
//   String? country;
//   String? district;
//   String? doorNo;
//   String? state;
//   String? street;

//   PermanentAddress(
//       {this.area,
//       this.city,
//       this.country,
//       this.district,
//       this.doorNo,
//       this.state,
//       this.street});

//   PermanentAddress.fromJson(Map<String, dynamic> json) {
//     area = json['area'];
//     city = json['city'];
//     country = json['country'];
//     district = json['district'];
//     doorNo = json['door_no'];
//     state = json['state'];
//     street = json['street'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['area'] = this.area;
//     data['city'] = this.city;
//     data['country'] = this.country;
//     data['district'] = this.district;
//     data['door_no'] = this.doorNo;
//     data['state'] = this.state;
//     data['street'] = this.street;
//     return data;
//   }
// }

// // class PersonalDetails {
// //   String? firstName;
// //   String? lastName;
// //   String? nickName;
// //   String? gender;
// //   int? age;
// //   String? dOB;
// //   String? childrenStatus;
// //   String? diet;
// //   String? height;
// //   String? hobbies;
// //   String? maritalDetails;
// //   String? noOfChildren;
// //   String? skinTone;
// //   int? weight;

// //   PersonalDetails(
// //       {this.firstName,
// //       this.lastName,
// //       this.nickName,
// //       this.gender,
// //       this.age,
// //       this.dOB,
// //       this.childrenStatus,
// //       this.diet,
// //       this.height,
// //       this.hobbies,
// //       this.maritalDetails,
// //       this.noOfChildren,
// //       this.skinTone,
// //       this.weight});

// //   PersonalDetails.fromJson(Map<String, dynamic> json) {
// //     firstName = json['first_name'];
// //     lastName = json['last_name'];
// //     nickName = json['nick_name'];
// //     gender = json['gender'];
// //     age = json['age'];
// //     dOB = json['DOB'];
// //     childrenStatus = json['children_status'];
// //     diet = json['diet'];
// //     height = json['height'];
// //     hobbies = json['hobbies'];
// //     maritalDetails = json['marital_details'];
// //     noOfChildren = json['no_of_children'];
// //     skinTone = json['skin_tone'];
// //     weight = json['weight'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['first_name'] = this.firstName;
// //     data['last_name'] = this.lastName;
// //     data['nick_name'] = this.nickName;
// //     data['gender'] = this.gender;
// //     data['age'] = this.age;
// //     data['DOB'] = this.dOB;
// //     data['children_status'] = this.childrenStatus;
// //     data['diet'] = this.diet;
// //     data['height'] = this.height;
// //     data['hobbies'] = this.hobbies;
// //     data['marital_details'] = this.maritalDetails;
// //     data['no_of_children'] = this.noOfChildren;
// //     data['skin_tone'] = this.skinTone;
// //     data['weight'] = this.weight;
// //     return data;
// //   }
// // }

// class CarrierAndWorkingDetails {
//   String? educationalQualification;
//   String? workingIn;
//   String? workingAs;
//   String? companyDetails;
//   String? annualIncome;

//   CarrierAndWorkingDetails(
//       {this.educationalQualification,
//       this.workingIn,
//       this.workingAs,
//       this.companyDetails,
//       this.annualIncome});

//   CarrierAndWorkingDetails.fromJson(Map<String, dynamic> json) {
//     educationalQualification = json['educational_qualification'];
//     workingIn = json['working_in'];
//     workingAs = json['working_as'];
//     companyDetails = json['company_details'];
//     annualIncome = json['annual_income'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['educational_qualification'] = this.educationalQualification;
//     data['working_in'] = this.workingIn;
//     data['working_as'] = this.workingAs;
//     data['company_details'] = this.companyDetails;
//     data['annual_income'] = this.annualIncome;
//     return data;
//   }
// }

// class JathagamDetails {
//   String? doshamDetails;
//   String? gothram;
//   String? kuladeivam;
//   String? laknam;
//   String? natchathiram;
//   String? rasi;
//   String? dosham;

//   JathagamDetails(
//       {this.doshamDetails,
//       this.gothram,
//       this.kuladeivam,
//       this.laknam,
//       this.natchathiram,
//       this.rasi,
//       this.dosham});

//   JathagamDetails.fromJson(Map<String, dynamic> json) {
//     doshamDetails = json['dosham_details'];
//     gothram = json['gothram'];
//     kuladeivam = json['kuladeivam'];
//     laknam = json['laknam'];
//     natchathiram = json['natchathiram'];
//     rasi = json['rasi'];
//     dosham = json['dosham'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['dosham_details'] = this.doshamDetails;
//     data['gothram'] = this.gothram;
//     data['kuladeivam'] = this.kuladeivam;
//     data['laknam'] = this.laknam;
//     data['natchathiram'] = this.natchathiram;
//     data['rasi'] = this.rasi;
//     data['dosham'] = this.dosham;
//     return data;
//   }
// }

// class FamilyDetails {
//   String? expectation;
//   String? fatherName;
//   String? fatherOcuupation;
//   String? motherName;
//   String? motherOccupation;
//   String? noOfBro;
//   String? noOfBroMarried;
//   String? noOfSis;
//   String? noOfSisMarried;
//   String? ownVehicle;
//   String? ownHouse;
//   String? ownLands;
//   String? ownFlats;

//   FamilyDetails(
//       {this.expectation,
//       this.fatherName,
//       this.fatherOcuupation,
//       this.motherName,
//       this.motherOccupation,
//       this.noOfBro,
//       this.noOfBroMarried,
//       this.noOfSis,
//       this.noOfSisMarried,
//       this.ownVehicle,
//       this.ownHouse,
//       this.ownLands,
//       this.ownFlats});

//   FamilyDetails.fromJson(Map<String, dynamic> json) {
//     expectation = json['expectation'];
//     fatherName = json['father_name'];
//     fatherOcuupation = json['father_ocuupation'];
//     motherName = json['mother_name'];
//     motherOccupation = json['mother_occupation'];
//     noOfBro = json['no_of_bro'];
//     noOfBroMarried = json['no_of_bro_married'];
//     noOfSis = json['no_of_sis'];
//     noOfSisMarried = json['no_of_sis_married'];
//     ownVehicle = json['own_vehicle'];
//     ownHouse = json['own_house'];
//     ownLands = json['own_lands'];
//     ownFlats = json['own_flats'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['expectation'] = this.expectation;
//     data['father_name'] = this.fatherName;
//     data['father_ocuupation'] = this.fatherOcuupation;
//     data['mother_name'] = this.motherName;
//     data['mother_occupation'] = this.motherOccupation;
//     data['no_of_bro'] = this.noOfBro;
//     data['no_of_bro_married'] = this.noOfBroMarried;
//     data['no_of_sis'] = this.noOfSis;
//     data['no_of_sis_married'] = this.noOfSisMarried;
//     data['own_vehicle'] = this.ownVehicle;
//     data['own_house'] = this.ownHouse;
//     data['own_lands'] = this.ownLands;
//     data['own_flats'] = this.ownFlats;
//     return data;
//   }
// }




import 'package:flutter/material.dart';

class receiviedProprosalModel {
  final String id;
  final String userId;
  final String firstName;
  final String lastName;
  final String time;
  // final String name;
  final int age;
  List<Attachements>? attachements;
  
  receiviedProprosalModel({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.time,
    // required this.name,
    required this.age,
    required this.attachements,

    

  });

  factory receiviedProprosalModel.fromJson(Map<String, dynamic> json) => receiviedProprosalModel(
       id: json['_id'].toString(),
       userId: json['customers_details']['user_obj_id'].toString(),
        firstName: json['customers_details']['personal_details']['first_name'].toString(),
        lastName: json['customers_details']['personal_details']['last_name'].toString(),
        time: json['request_status_updated_time'].toString(),
        // name: json['title'].toString(),
        age: json['customers_details']['personal_details']['age']  != null ? json['customers_details']['personal_details']['age'] : 0,
        attachements: json["customers_details"]["attachments"] == null ? null : List<Attachements>.from(json["customers_details"]["attachments"].map((x) => Attachements.fromJson(x))),
      );
       
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
