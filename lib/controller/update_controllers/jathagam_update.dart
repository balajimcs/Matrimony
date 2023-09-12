import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';

import '../../resources/app_routes.dart';


class JathagamUpdateController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController GothramController = TextEditingController(text: '');
  TextEditingController KuladeivamController = TextEditingController(text: '');
  TextEditingController DoshamDetailsController = TextEditingController(text: '');
  TextEditingController PlaceCountryController = TextEditingController(text: '');
  TextEditingController PlaceStateController = TextEditingController(text: '');
  TextEditingController PlaceCityController = TextEditingController(text: '');
  TextEditingController TimeController = TextEditingController(text: '');
  bool showTextField = false;
  var rasi = "Viruchagam";
  var natchathiram = "Mirugasiridam";
  var lakhan = "Rishabam";
  var dosham = "Rishabam";
  checkInput(context){
      print("objecaaat");
      print(JathagamUpdateControllerRegisterAPI(context));
      JathagamUpdateControllerRegisterAPI(context);
  
}

JathagamUpdateControllerRegisterAPI(context) async {
  final headers = {"x-access-token":appPreference.accessToken!};
  final params = {"rasi": rasi, "natchathiram": natchathiram, "laknam": lakhan, "gothram": GothramController.text, "kuladeivam":KuladeivamController.text
  ,"dosham": dosham, "dosham_details": DoshamDetailsController.text,"place_of_birth_country": PlaceCountryController.text,"place_of_birth_state": PlaceStateController.text,"place_of_birth_city": PlaceCityController.text, "time_of_birth": TimeController.text};
  
  print("Jathagam Address API Params: ${params}");
   final response = await http.post(
      RestApiClient().jathagamEdit,
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