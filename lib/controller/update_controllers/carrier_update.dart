import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';


class CarrierUpdateController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController educationDetailsController = TextEditingController(text: '');
  TextEditingController WorkingDetailsController = TextEditingController(text: '');
  TextEditingController WorkingInController = TextEditingController(text: '');
  TextEditingController WorkingAsController = TextEditingController(text: '');
  TextEditingController CompanyController = TextEditingController(text: '');
  TextEditingController IncomeController = TextEditingController(text: '');

  var education = "B.Com";
  var occupation = "Manager";
  var workingIn = "Government/PSU";

  checkInput(context){
      print("objecaaat");
      print(CarrierUpdateControllerRegisterAPI(context));
      CarrierUpdateControllerRegisterAPI(context);
  
}

CarrierUpdateControllerRegisterAPI(context) async {
  final headers = {"x-access-token":appPreference.accessToken!};
  final params = {"educational_qualification": education, "working_in": workingIn, "working_as": WorkingAsController.text, "company_details": CompanyController.text, "annual_income":IncomeController.text
   ,"educational_details": educationDetailsController.text, "working_details": WorkingDetailsController.text, "occupation": occupation};
  
  print("Carrier Address API Params: ${params}");
  final response = await http.post(
      RestApiClient().carrierEdit,
      headers: <String, String>{
        "x-access-token":appPreference.accessToken!,
        "Content-Type": "application/json",
      },
      body: jsonEncode(params),
    );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     appPreference.isData = datas["data"].toString();
        showSuccessSnackBar(datas["message"], context);
      
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

}
 
}