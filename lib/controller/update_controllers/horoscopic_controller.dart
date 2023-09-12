import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';

class HoroScopicController extends BaseController {

  List<String> Rselected = [];
List<String> Rselected1 = [];
List<String> Rselected2 = [];
List<String> Rselected3 = [];
List<String> Rselected4 = [];
List<String> Rselected5 = [];
List<String> Rselected6 = [];
List<String> Rselected7 = [];
List<String> Rselected8 = [];
List<String> Rselected9 = [];
List<String> Rselected10 = [];
List<String> Rselected11 = [];

List<String> Aselected = [];
List<String> Aselected1 = [];
List<String> Aselected2 = [];
List<String> Aselected3 = [];
List<String> Aselected4 = [];
List<String> Aselected5 = [];
List<String> Aselected6 = [];
List<String> Aselected7 = [];
List<String> Aselected8 = [];
List<String> Aselected9 = [];
List<String> Aselected10 = [];
List<String> Aselected11 = [];

  
  checkInput(context) {
    HoroScopicAPI(context);
  }

  HoroScopicAPI(context) async {
    
    
    
    final headers = <String, String>{
      "x-access-token":
          appPreference.accessToken!,
      "Content-Type": "application/json",
    };

      final data = {"center": "rasi", "A": Rselected,
  "B": Rselected1, "C": Rselected2,"D": Rselected3
  ,"E": Rselected4,"F": Rselected5,"G": Rselected6
  ,"H": Rselected7,"I": Rselected8, "J": Rselected9,"K": Rselected10
  };
  final data1 = {"center": "amsam", "A": Aselected,
  "B": Aselected1, "C": Aselected2,"D": Aselected3
  ,"E": Aselected4,"F": Aselected5,"G": Aselected6
  ,"H": Aselected7,"I": Aselected8, "J": Aselected9,"K": Aselected10
  };
  final params ={ "rasi":data, "second":data1};
  print("Horoscopic API Params: ${params}");

   final response = await http.post(
      RestApiClient().horoscopicEdit,
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

