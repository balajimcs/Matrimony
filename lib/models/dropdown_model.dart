// import 'dart:convert';

// dropDownModel sendDataModelFromJson(String str) => dropDownModel.fromJson(json.decode(str));

// String sendDataModelToJson(dropDownModel data) => json.encode(data.toJson());

// class dropDownModel {
//   dropDownModel({
//     this.id,
//     this.category_name,
//     this.subCat,
    
//   });

//   String? id;
//   String? category_name;
//   List<SubCat>? subCat;
  
//   factory dropDownModel.fromJson(Map<String, dynamic> json) => dropDownModel(
//     id: json["_id"] == null ? null : json["_id"],
//     category_name: json["category_name"] == null ? null : json["category_name"],
//     subCat: json["subCat"] == null ? null : List<SubCat>.from(json["subCat"].map((x) => SubCat.fromJson(x))),
//   );

//   Map<String, dynamic> toJson() => {
//     "_id": id == null ? null : id,
//     "category_name": category_name == null ? null : category_name,
//     "subCat": subCat == null ? null : List<dynamic>.from(subCat!.map((x) => x.toJson())),
//     };
// }


// class SubCat {
//   SubCat({
//     this.sub_category_name,
//     this.getNestedSubCategories,
//   });

//   String? sub_category_name;
//   List<GetNestedSubCategories>? getNestedSubCategories;

//   factory SubCat.fromJson(Map<String, dynamic> json) => SubCat(
//     sub_category_name: json["sub_category_name"] == null ? null : json["sub_category_name"],
//      getNestedSubCategories: json["getNestedSubCategories"] == null ? null : List<GetNestedSubCategories>.from(json["getNestedSubCategories"].map((x) => GetNestedSubCategories.fromJson(x))),
    
//   );

//   Map<String, dynamic> toJson() => {
//     "sub_category_name": sub_category_name == null ? null : sub_category_name,
//     "getNestedSubCategories": getNestedSubCategories == null ? null : List<dynamic>.from(getNestedSubCategories!.map((x) => x.toJson())),
//   };
// }

// class GetNestedSubCategories {
//   GetNestedSubCategories({
//     this.sub_category_name
//   });

//   String? sub_category_name;
  
//   factory GetNestedSubCategories.fromJson(Map<String, dynamic> json) => GetNestedSubCategories(
//     sub_category_name: json["sub_category_name"] == null ? null : json["sub_category_name"],
//   );

//   Map<String, dynamic> toJson() => {
//     "sub_category_name": sub_category_name == null ? null : sub_category_name
//   };
// }