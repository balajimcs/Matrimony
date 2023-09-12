import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';

import '../resources/app_routes.dart';
import '../utils/api_config.dart';

class CarrierRegisterController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController educationDetailsController = TextEditingController(text: '');
  TextEditingController WorkingDetailsController = TextEditingController(text: '');
  TextEditingController WorkingInController = TextEditingController(text: '');
  TextEditingController WorkingAsController = TextEditingController(text: '');
  TextEditingController CompanydetailsController = TextEditingController(text: '');
  TextEditingController AnnualIcome = TextEditingController(text: '');
  // dropdownValue45
  checkInput(context){
  if(controller.dropdownValue46 == null){
    showSnackBar("Select the Working values", context);
  }else if(CompanydetailsController.text.isEmpty){
    showSnackBar("Enter Company Details", context);
  }else if(controller.dropdownValue20 == null){
    showSnackBar("Select the education values", context);
  }else if(AnnualIcome.text.isEmpty){
    showSnackBar("Enter Annual Income", context);
  }else if(controller.dropdownValue45 == null){
    showSnackBar("Select the occupation values", context);
  }else{
      print("objecaaat");
      print(CarrierRegisterAPI(context));
      CarrierRegisterAPI(context);
      // registerAPI(context);
  }
  
}

CarrierRegisterAPI(context) async {
  final data = {"educational_qualification": controller.dropdownValue20, "working_in": controller.dropdownValue46, "working_as": WorkingAsController.text, "company_details": CompanydetailsController.text, "annual_income":AnnualIcome.text
  ,"educational_details": educationDetailsController.text, "working_details": WorkingDetailsController.text, "occupation": controller.dropdownValue45};
  final params ={ "carrier_and_working_details":data, "userMobileNo": controller.mobileNumberController.text};
  // ${controller.emailController.text}
  print("Carrier Address API Params: ${params}");
  
  
   final response = await http.post(
      RestApiClient().registerUpdate,
      headers: <String, String>{

        "Content-Type": "application/json",
      },
      body: jsonEncode(params),
    );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     appPreference.isData = datas["data"].toString();
       
       controller.currentStep.value = 5;
          print(controller.currentStep.value = 5);
          // Get.toNamed(RouteNames.welcome);
          showSuccessSnackBar(datas["message"], context);
      
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }
  
  // http.post(
  //     RestApiClient().registerUpdate,
  //     body: jsonEncode(params), headers: headers).then((value) {
  //   Map<String,dynamic> res = jsonDecode(value.body);
  //   print("value");
  //   print(value);
  //   print("Carrier Address: ${res.toString()}");
  //   if (res != null) {
  //     if (res.isNotEmpty && res["status"].toString() != 410) {
  //         appPreference.accessToken = res["data"].toString();
  //         controller.currentStep.value.value = 5;
  //         print(controller.currentStep.value.value = 5);
  //         // Get.toNamed(RouteNames.welcome);
  //         showSuccessSnackBar("Carrier Details verified Succesfully", context);
  //         print("balaji");
  //     }else{
  //       showSnackBar(res["message"].toString(), context);
  //       print("object1");
  //     }
  //   }
  // });

}

}