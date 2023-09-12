class AdminDataModel {
  int? success;
  String? message;
  int? status;
  int? totalCount;
  List<Data>? data;

  AdminDataModel(
      {this.success, this.message, this.status, this.totalCount, this.data});

  AdminDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] != null ? json['success'] : 0;
    message = json['message'] != null ? json['message'] : "";
    status = json['status'] != null ? json['status'] : 0;
    totalCount = json['totalCount'] != null ? json['totalCount'] : 0;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v as Map<String, dynamic>));
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
  String? sId;
  bool? isActive;
  String? categoryName;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<SubCat>? subCat;
  String? image;

  Data(
      {this.sId,
        this.isActive,
        this.categoryName,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.subCat,
        this.image});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id']  != null ? json['_id'] : "";
    isActive = json['is_active']  != null ? json['is_active'] : false;
    categoryName = json['category_name']  != null ? json['category_name'] : "";
    createdAt = json['createdAt']  != null ? json['createdAt'] : "";
    updatedAt = json['updatedAt']  != null ? json['updatedAt'] : "";
    iV = json['__v'] != null ? json['__v'] : 0;
    if (json['subCat'] != null) {
      subCat = <SubCat>[];
      json['subCat'].forEach((v) {
        subCat!.add(new SubCat.fromJson(v as Map<String, dynamic>));
      });
    }
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['is_active'] = this.isActive;
    data['category_name'] = this.categoryName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.subCat != null) {
      data['subCat'] = this.subCat!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    return data;
  }
}

class SubCat {
  String? sId;
  bool? isActive;
  dynamic? subCategoryName;
  String? categoryObjId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<GetNestedSubCategories>? getNestedSubCategories;

  SubCat(
      {this.sId,
        this.isActive,
        this.subCategoryName,
        this.categoryObjId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.getNestedSubCategories});

  SubCat.fromJson(Map<String, dynamic> json) {
    sId = json['_id']  != null ? json['_id'] : "";
    isActive = json['is_active']  != null ? json['is_active'] : false;
    subCategoryName = json['sub_category_name'] ?? null;
    categoryObjId = json['category_obj_id']  != null ? json['category_obj_id'] : "";
    createdAt = json['createdAt']  != null ? json['createdAt'] : "";
    updatedAt = json['updatedAt']  != null ? json['updatedAt'] : "";
    iV = json['__v']  != null ? json['__v'] : 0;
     if (json['getNestedSubCategories'] != null) {
      getNestedSubCategories = <GetNestedSubCategories>[];
      json['getNestedSubCategories'].forEach((v) {
        getNestedSubCategories!.add(new GetNestedSubCategories.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['is_active'] = this.isActive;
    data['sub_category_name'] = this.subCategoryName;
    data['category_obj_id'] = this.categoryObjId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
   if (this.getNestedSubCategories != null) {
      data['getNestedSubCategories'] =
          this.getNestedSubCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  
}

class GetNestedSubCategories {
  String? sId;
  bool? isActive;
  String? subName;
  String? subCategoryObjId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  GetNestedSubCategories(
      {this.sId,
      this.isActive,
      this.subName,
      this.subCategoryObjId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  GetNestedSubCategories.fromJson(Map<String, dynamic> json) {
    sId = json['_id']  != null ? json['_id'] : "";
    isActive = json['is_active']  != null ? json['is_active'] : false;
    subName = json['sub_name'] ?? null;
    subCategoryObjId = json['sub_category_obj_id']  != null ? json['sub_category_obj_id'] : "";
    createdAt = json['createdAt']  != null ? json['createdAt'] : "";
    updatedAt = json['updatedAt']  != null ? json['updatedAt'] : "";
    iV = json['__v']  != null ? json['__v'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['is_active'] = this.isActive;
    data['sub_name'] = this.subName;
    data['sub_category_obj_id'] = this.subCategoryObjId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
