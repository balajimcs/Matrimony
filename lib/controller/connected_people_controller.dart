import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/models/data_model.dart';
import 'package:thirumanam/models/detailed_filter_model.dart';
import 'package:thirumanam/models/getConnectedModel.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/utils/utils.dart';
import '../models/received_proprosal_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class GetConnectedController extends BaseController {
  final TextEditingController searchController = TextEditingController();
   Timer? timer;
  TextEditingController memberController = TextEditingController(text: '');
  TextEditingController ageMinController = TextEditingController(text: '');
  TextEditingController ageMaxController = TextEditingController(text: '');
  TextEditingController heightMinController = TextEditingController(text: '');
  TextEditingController heightMaxController = TextEditingController(text: '');
  TextEditingController annualIncomeController = TextEditingController(text: '');
  TextEditingController showProfileController = TextEditingController(text: '');
  TextEditingController ProfileController = TextEditingController(text: '');
  TextEditingController employedInController = TextEditingController(text: '');
  TextEditingController CountryController = TextEditingController(text: '');
  TextEditingController StateController = TextEditingController(text: '');
  TextEditingController CityController = TextEditingController(text: '');
  TextEditingController DoshamController = TextEditingController(text: '');
  TextEditingController PhysicalController = TextEditingController(text: '');
  
  var ageMin = '';
  var ageMax = "";
  var member = '';
  var heightMin = '';
  var heightMax = '';
  var AnnualIncome = '';
  var MotherTongue = '';
  String MaritalStatus = '';
  var Religion = '';
  var Caste = '';
  var Education = '';
  String EmployedIn = '';
  String residentStatus = '';
  String physicalStatus = '';
  String deit = "";
  String drinking = "";
  String smoking = "";
  var showProfile = '';
  String Profile = "";
  var rasi = '';
  var Dosham = '';
  var Natchathiram = '';
  var laknam = '';
  var occupation = '';

  String details = "";
  @override
  void onInit() {
    super.onInit();
    fetchDetailedFilter();
    String token = appPreference.accessToken!;

    Map<String, dynamic> payload = Jwt.parseJwt(token);
    details = payload['details'];
    print(payload);
    print(details);
  }

  var GetConnectModel = StreamController<List<GetConnectedModel>>.broadcast();
  Stream<List<GetConnectedModel>> getFilteredModel() => GetConnectModel.stream;

    fetchDetailedFilter() async {
    print('fetchDetailedFilter');
    final url = Uri.parse(
        "${URL}proposal/getallconnectedpeoples?${ageMin == '' ? '' : "age_min=$ageMin"}${ageMax == "" ? '' : "&age_max=$ageMax"}${showProfile == '' ? '' : "&within_a_month=$showProfile"}${showProfile == '' ? '' : "&within_a_week=$showProfile"}${showProfile == '' ? '' : "&within_a_day=$showProfile"}${member == '' ? '' : "&member_type=$member"}${heightMin == '' ? '' : "&height_min=$heightMin"}${heightMax == '' ? '' : "&height_max=$heightMax"}${Religion == '' ? '' : "&religion=$Religion"}${Dosham == '' ? '' : "&dosham=$Dosham"}${AnnualIncome == '' ? '' : "&annual_income_min=$AnnualIncome"}${MaritalStatus == '' ? '' : "&marital_status=$MaritalStatus"}${MotherTongue == '' ? '' : "&mother_tongue=$MotherTongue"}${physicalStatus == '' ? '' : "&physical_status=$physicalStatus"}${CountryController.text == '' ? '' : "&country=${CountryController.text}"}${StateController.text == '' ? '' : "&state=${StateController.text}"}${CityController.text == '' ? '' : "&city=${CityController.text}"}${residentStatus == '' ? '' : "&resident_status=$residentStatus"}${EmployedIn == '' ? '' : "&employed_in=$EmployedIn"}${deit == '' ? '' : "&eating_habbits=$deit"}${smoking == '' ? '' : "&smoking=$smoking"}${drinking == '' ? '' : "&drinking=$drinking"}${Natchathiram == '' ? '' : "&natchathiram=$Natchathiram"}${Profile == '' ? '' : "&profile=$Profile"}${Education == '' ? '' : "&education=$Education"}${Caste == '' ? '' : "&caste=$Caste"}${rasi == '' ? '' : "&rasi=$rasi"}${laknam == '' ? '' : "&laknam=$laknam"}${occupation == '' ? '' : "&occupation=$occupation"}");
      print(url);
    final response = await http.get(
      Uri.parse(url.toString()),
      
      headers: <String, String>{
        "Content-Type": "application/json",
        'x-access-token':
            appPreference.accessToken!
      },
    );

    final Map<String, dynamic> body = json.decode(response.body);

    if (response.statusCode == 200) {
      
      print(body);
     
      
    }
    GetConnectModel.add(List<GetConnectedModel>.from(
        body["data"].map((x) => GetConnectedModel.fromJson(x))));

  }
}
