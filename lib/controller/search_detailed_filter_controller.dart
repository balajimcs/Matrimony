import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/models/detailed_filter_model.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/search_filter_model.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/utils/utils.dart';
import '../models/received_proprosal_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class SearchDetailedFilterController extends BaseController {
  
  TextEditingController memberController = TextEditingController(text: '');
  TextEditingController ageMinController = TextEditingController(text: '');
  TextEditingController ageMaxController = TextEditingController(text: '');
  TextEditingController heightMinController = TextEditingController(text: '');
  TextEditingController heightMaxController = TextEditingController(text: '');
  TextEditingController MaritalStatusController = TextEditingController(text: '');
  TextEditingController ReligionController = TextEditingController(text: '');
  TextEditingController MotherToungueController = TextEditingController(text: '');
  TextEditingController CasteController = TextEditingController(text: '');
  TextEditingController PhysicalStatusController = TextEditingController(text: '');
  TextEditingController CountryController = TextEditingController(text: '');
  TextEditingController StateController = TextEditingController(text: '');
  TextEditingController DistrictController = TextEditingController(text: '');
  TextEditingController CityController = TextEditingController(text: '');
  TextEditingController ResidentStatusController = TextEditingController(text: '');
  TextEditingController EducationController = TextEditingController(text: '');
  TextEditingController EducationInController = TextEditingController(text: '');
  TextEditingController OccupationController = TextEditingController(text: '');
  TextEditingController annualMinController = TextEditingController(text: '');
  TextEditingController annualMaxController = TextEditingController(text: '');
  TextEditingController StarController = TextEditingController(text: '');
  TextEditingController ChevvaiController = TextEditingController(text: '');
  TextEditingController EatingHabitsController = TextEditingController(text: '');
  TextEditingController DriningController = TextEditingController(text: '');
  TextEditingController SmokingController = TextEditingController(text: '');
  int ageMin = 0;
  int ageMax = 0;
  String member = '';
  int heightMin = 0;
  int heightMax = 0;
  String maritalStaus = '';
  String religion = '';
  String motherTounge = '';
  String caste = '';
  String physicalStatus = '';
  String country = '';
  String state = '';
  String district = '';
  String city = '';
  String residentStatus = '';
  String education = '';
  String employedIn = '';
  String occupation = '';
  String annualIncomeMin = '';
  String annualIncomeMax = '';
  String star = '';
  String chevvaiDosham = '';
  String eatingHabits = '';
  String drinking = '';
  String smoking = '';

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    fetchSearchDetailedFilter('');
  }

  List<SearchDetailedFilterModel> result = [];

  Future<List<SearchDetailedFilterModel>> fetchSearchDetailedFilter(String? query) async {
    final url = Uri.parse(
        "${URL}auth/all-user-details-with-filters?${ageMin == 0 ? '' : "age_min=$ageMin"}${ageMax == 0 ? '' : "&age_max=$ageMax"}${heightMin == 0 ? '' : "&height_min=$heightMin"}${heightMax == 0 ? '' : "&height_max=$heightMax"}${annualIncomeMin == '' ? '' : "&annual_income_min=$annualIncomeMin"}${annualIncomeMax == '' ? '' : "&annual_income_max=$annualIncomeMax"}${maritalStaus == '' ? '' : "&marital_status=$maritalStaus"}${religion == '' ? '' : "&religion=$religion"}${motherTounge == '' ? '' : "&mother_tongue=$motherTounge"}${caste == '' ? '' : "&caste=$caste"}${physicalStatus == '' ? '' : "&physical_status=$physicalStatus"}${country == '' ? '' : "&country=$country"}${state == '' ? '' : "&state=$state"}${district == '' ? '' : "&district=$district"}${city == '' ? '' : "&city=$city"}${residentStatus == '' ? '' : "&resident_status=$residentStatus"}${education == '' ? '' : "&education=$education"}${employedIn == '' ? '' : "&employed_in=$employedIn"}${occupation == '' ? '' : "&occupation=$occupation"}${chevvaiDosham == '' ? '' : "&dosham=$chevvaiDosham"}${eatingHabits == '' ? '' : "&eating_habbits=$eatingHabits"}${drinking == '' ? '' : "&drinking=$drinking"}${smoking == '' ? '' : "&smoking=$smoking"}");
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
      
      result = List<SearchDetailedFilterModel>.from(
          body["data"].map((x) => SearchDetailedFilterModel.fromJson(x)));

      if (query != null) {
        result = result
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()) ||
                element.caste.toLowerCase().contains(query.toLowerCase()) ||
                element.job.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        print("api error");
      }

      return result;
    }
    print(body);
    return List<SearchDetailedFilterModel>.from(
        body["data"].map((x) => SearchDetailedFilterModel.fromJson(x)));
  }
}
