
import 'dart:convert';

PaymentModel sendDataModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

class PaymentModel {
  
  List<PackageDetails>? packageDetails;
  
  PaymentModel({
    required this.packageDetails,
});

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        packageDetails: json['data'] == null ? null : List<PackageDetails>.from(json['data']['getAllPackageDetails'].map((x) => PackageDetails.fromJson(x))),
      );
       
      
}

class PackageDetails {
  PackageDetails({
    this.package_title,
    this.package_base_price,
    this.package_currency,
    this.package_validity,
    
  });

  String? package_title;
  int? package_base_price;
  String? package_currency;
  int? package_validity;
  
  factory PackageDetails.fromJson(Map<String, dynamic> json) => PackageDetails(
    package_title: json["package_title"] == null ? null : json["package_title"],
    package_base_price: json["package_base_price"] == null ? null : json["package_base_price"],
    package_currency: json["package_currency"] == null ? null : json["package_currency"],
    package_validity: json["package_validity"] == null ? null : json["package_validity"]
  );

  
}

