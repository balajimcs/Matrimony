class AllUsersModel {
  int? success;
  String? message;
  int? status;
  int? totalCount;
  List<Data>? data;

  AllUsersModel(
      {this.success, this.message, this.status, this.totalCount, this.data});

  AllUsersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] != null ? json['success'] : "";
    message = json['message'] != null ? json['message'] : "";
    status = json['status'] != null ? json['status'] : 0;
    totalCount = json['totalCount'] != null ? json['totalCount'] : 0;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['status'] = this.status;
    data['totalCount'] = this.totalCount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  ReligionCommunity? religionCommunity;
  CommunicationDetials? communicationDetials;
  String? sId;
  String? userObjId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? stepperFormStage;
  PermanentAddress? permanentAddress;
  List<Attachments>? attachments;
  PersonalDetails? personalDetails;
  CarrierAndWorkingDetails? carrierAndWorkingDetails;
  JathagamDetails? jathagamDetails;
  FamilyDetails? familyDetails;

  Data(
      {this.religionCommunity,
        this.communicationDetials,
        this.sId,
        this.userObjId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.stepperFormStage,
        this.permanentAddress,
        this.attachments,
        this.personalDetails,
        this.carrierAndWorkingDetails,
        this.jathagamDetails,
        this.familyDetails});

  Data.fromJson(Map<String, dynamic> json) {
    religionCommunity = json['religion_community'] != null
        ? new ReligionCommunity.fromJson(json['religion_community'] as Map<String, dynamic>)
        : null;
    communicationDetials = json['communication_detials'] != null
        ? new CommunicationDetials.fromJson(json['communication_detials'] as Map<String, dynamic>)
        : null;
    sId = json['_id'] != null ? json['_id'] : "";
    userObjId = json['user_obj_id'] != null ? json['user_obj_id'] : "";
    createdAt = json['createdAt'] != null ? json['createdAt'] : "";
    updatedAt = json['updatedAt'] != null ? json['updatedAt'] : "";
    // iV = json['__v'];
    stepperFormStage = json['stepper_form_stage'] != null ? json['stepper_form_stage'] : 0;
    permanentAddress = json['permanent_address'] != null
        ? new PermanentAddress.fromJson(json['permanent_address'] as Map<String, dynamic>)
        : null;
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v as Map<String, dynamic>));
      });
    }
    personalDetails = json['personal_details'] != null
        ? new PersonalDetails.fromJson(json['personal_details'] as Map<String, dynamic>)
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
    if (this.religionCommunity != null) {
      data['religion_community'] = this.religionCommunity!.toJson();
    }
    if (this.communicationDetials != null) {
      data['communication_detials'] = this.communicationDetials!.toJson();
    }
    data['_id'] = this.sId;
    data['user_obj_id'] = this.userObjId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    // data['__v'] = this.iV;
    data['stepper_form_stage'] = this.stepperFormStage;
    if (this.permanentAddress != null) {
      data['permanent_address'] = this.permanentAddress!.toJson();
    }
    if (this.personalDetails != null) {
      data['personal_details'] = this.personalDetails!.toJson();
    }
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
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
    community = json['community'] != null ? json['community'] : "";
    motherTounge = json['mother_tounge'] != null ? json['mother_tounge'] : "";
    religion = json['religion'] != null ? json['religion'] : "";
    subCaste = json['sub_caste'] != null ? json['sub_caste'] : "";
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

class CommunicationDetials {
  String? area;
  String? city;
  String? country;
  String? district;
  String? doorNo;
  String? nationality;
  String? state;
  String? street;
  String? currentNationality;

  CommunicationDetials(
      {this.area,
        this.city,
        this.country,
        this.district,
        this.doorNo,
        this.nationality,
        this.state,
        this.street,
        this.currentNationality});

  CommunicationDetials.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? json['area'] : "";
    city = json['city'] != null ? json['city'] : "";
    country = json['country'] != null ? json['country'] : "";
    district = json['district'] != null ? json['district'] : "";
    doorNo = json['door_no'] != null ? json['door_no'] : "";
    nationality = json['nationality'] != null ? json['nationality'] : "";
    state = json['state'] != null ? json['state'] : "";
    street = json['street'] != null ? json['street'] : "";
    currentNationality = json['current_nationality'] != null ? json['current_nationality'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['city'] = this.city;
    data['country'] = this.country;
    data['district'] = this.district;
    data['door_no'] = this.doorNo;
    data['nationality'] = this.nationality;
    data['state'] = this.state;
    data['street'] = this.street;
    data['current_nationality'] = this.currentNationality;
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

class PermanentAddress {
  String? area;
  String? city;
  String? country;
  String? district;
  String? doorNo;
  String? state;
  String? street;

  PermanentAddress(
      {this.area,
        this.city,
        this.country,
        this.district,
        this.doorNo,
        this.state,
        this.street});

  PermanentAddress.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? json['area'] : "";
    city = json['city'] != null ? json['city'] : "";
    country = json['country'] != null ? json['country'] : "";
    district = json['district'] != null ? json['district'] : "";
    doorNo = json['door_no'] != null ? json['door_no'] : "";
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
  String? hobbies;
  String? diet;
  int? height;
  int? weight;
  String? maritalDetails;
  int? noOfChildren;
  String? skinTone;
  String? childrenStatus;
  String? dOB;
  int? age;
  String? firstName;
  String? gender;
  String? lastName;
  String? nickName;

  PersonalDetails(
      {this.hobbies,
        this.diet,
        this.height,
        this.weight,
        this.maritalDetails,
        this.noOfChildren,
        this.skinTone,
        this.childrenStatus,
        this.dOB,
        this.age,
        this.firstName,
        this.gender,
        this.lastName,
        this.nickName});

  PersonalDetails.fromJson(Map<String, dynamic> json) {
    hobbies = json['hobbies'] != null  ? json['hobbies'] : "";
    diet = json['diet'] != null  ? json['diet'] : "";
    height = json['height'] != null  ? json['height'] : 0;
    weight = json['weight'] != null  ? json['weight'] : 0;
    maritalDetails = json['marital_details'] != null  ? json['marital_details'] : "";
    noOfChildren = json['no_of_children'] != null  ? json['no_of_children'] : 0;
    skinTone = json['skin_tone'] != null  ? json['skin_tone'] : "";
    childrenStatus = json['children_status'] != null  ? json['children_status'] : "";
    dOB = json['DOB'] != null  ? json['DOB'] : "";
    age = json['age'] != null  ? json['age'] : 0;
    firstName = json['first_name'] != null  ? json['first_name'] : "";
    gender = json['gender'] != null  ? json['gender'] : "";
    lastName = json['last_name'] != null  ? json['last_name'] : "";
    nickName = json['nick_name'] != null  ? json['nick_name'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hobbies'] = this.hobbies;
    data['diet'] = this.diet;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['marital_details'] = this.maritalDetails;
    data['no_of_children'] = this.noOfChildren;
    data['skin_tone'] = this.skinTone;
    data['children_status'] = this.childrenStatus;
    data['DOB'] = this.dOB;
    data['age'] = this.age;
    data['first_name'] = this.firstName;
    data['gender'] = this.gender;
    data['last_name'] = this.lastName;
    data['nick_name'] = this.nickName;
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
    educationalQualification = json['educational_qualification'] != null ? json['educational_qualification'] : "";
    workingIn = json['working_in'] != null ? json['working_in'] : "";
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
  String? gothram;
  String? rasi;
  String? natchathiram;
  String? laknam;
  String? kuladeivam;
  String? doshamDetails;

  JathagamDetails(
      {this.gothram,
        this.rasi,
        this.natchathiram,
        this.laknam,
        this.kuladeivam,
        this.doshamDetails});

  JathagamDetails.fromJson(Map<String, dynamic> json) {
    gothram = json['gothram'] != null ? json['gothram'] : "";
    rasi = json['rasi'] != null ? json['rasi'] : "";
    natchathiram = json['natchathiram'] != null ? json['natchathiram'] : "";
    laknam = json['laknam'] != null ? json['laknam'] : "";
    kuladeivam = json['kuladeivam'] != null ? json['kuladeivam'] : "";
    doshamDetails = json['dosham_details'] != null ? json['dosham_details'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gothram'] = this.gothram;
    data['rasi'] = this.rasi;
    data['natchathiram'] = this.natchathiram;
    data['laknam'] = this.laknam;
    data['kuladeivam'] = this.kuladeivam;
    data['dosham_details'] = this.doshamDetails;
    return data;
  }
}

class FamilyDetails {
  String? fatherName;
  String? motherName;
  String? motherOccupation;
  int? noOfBro;
  int? noOfBroMarried;
  int? noOfSis;
  int? noOfSisMarried;
  int? ownVehicle;
  int? ownHouse;
  String? fatherOcuupation;
  String? expectation;
  int? ownFlats;
  int? ownLands;

  FamilyDetails(
      {this.fatherName,
        this.motherName,
        this.motherOccupation,
        this.noOfBro,
        this.noOfBroMarried,
        this.noOfSis,
        this.noOfSisMarried,
        this.ownVehicle,
        this.ownHouse,
        this.fatherOcuupation,
        this.expectation,
        this.ownFlats,
        this.ownLands});

  FamilyDetails.fromJson(Map<String, dynamic> json) {
    fatherName = json['father_name'] != null ? json['father_name'] : "";
    motherName = json['mother_name'] != null ? json['mother_name'] : "";
    motherOccupation = json['mother_occupation'] != null ? json['mother_occupation'] : "";
    noOfBro = json['no_of_bro'] != null ? json['no_of_bro'] : 0;
    noOfBroMarried = json['no_of_bro_married'] != null ? json['no_of_bro_married'] : 0;
    noOfSis = json['no_of_sis'] != null ? json['no_of_sis'] : 0;
    noOfSisMarried = json['no_of_sis_married'] != null ? json['no_of_sis_married'] : 0;
    ownVehicle = json['own_vehicle'] != null ? json['own_vehicle'] : 0;
    ownHouse = json['own_house'] != null ? json['own_house'] : 0;
    fatherOcuupation = json['father_ocuupation'] != null ? json['father_ocuupation'] : "";
    expectation = json['expectation'] != null ? json['expectation'] : "";
    ownFlats = json['own_flats'] != null ? json['own_flats'] : 0;
    ownLands = json['own_lands'] != null ? json['own_lands'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['father_name'] = this.fatherName;
    data['mother_name'] = this.motherName;
    data['mother_occupation'] = this.motherOccupation;
    data['no_of_bro'] = this.noOfBro;
    data['no_of_bro_married'] = this.noOfBroMarried;
    data['no_of_sis'] = this.noOfSis;
    data['no_of_sis_married'] = this.noOfSisMarried;
    data['own_vehicle'] = this.ownVehicle;
    data['own_house'] = this.ownHouse;
    data['father_ocuupation'] = this.fatherOcuupation;
    data['expectation'] = this.expectation;
    data['own_flats'] = this.ownFlats;
    data['own_lands'] = this.ownLands;
    return data;
  }
}
