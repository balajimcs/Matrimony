import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/models/data_model.dart';
import 'package:thirumanam/models/detailed_filter_model.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/utils/utils.dart';
import '../models/received_proprosal_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class DetailedFilterController extends BaseController {
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

  @override
  void onInit() {
    super.onInit();
    fetchDetailedFilter();
    print(MaritalStatus);
    print("MaritalStatus");
  }

  var detailFilterModel = StreamController<List<DetailedFilterModel>>.broadcast();
  Stream<List<DetailedFilterModel>> getFilteredModel() => detailFilterModel.stream;
     final int _limit = 5000000;
    fetchDetailedFilter() async {
    print('fetchDetailedFilter');
    final url = Uri.parse(
        "${URL}auth/all-user-details?limit=$_limit${ageMin == '' ? '' : "&age_min=$ageMin"}${ageMax == "" ? '' : "&age_max=$ageMax"}${showProfile == '' ? '' : "&within_a_month=$showProfile"}${showProfile == '' ? '' : "&within_a_week=$showProfile"}${showProfile == '' ? '' : "&within_a_day=$showProfile"}${member == '' ? '' : "&member_type=$member"}${heightMin == '' ? '' : "&height_min=$heightMin"}${heightMax == '' ? '' : "&height_max=$heightMax"}${Religion == '' ? '' : "&religion=$Religion"}${Dosham == '' ? '' : "&dosham=$Dosham"}${AnnualIncome == '' ? '' : "&annual_income_min=$AnnualIncome"}${MaritalStatus == '' ? '' : "&marital_status=$MaritalStatus"}${MotherTongue == '' ? '' : "&mother_tongue=$MotherTongue"}${physicalStatus == '' ? '' : "&physical_status=$physicalStatus"}${CountryController.text == '' ? '' : "&country=${CountryController.text}"}${StateController.text == '' ? '' : "&state=${StateController.text}"}${CityController.text == '' ? '' : "&city=${CityController.text}"}${residentStatus == '' ? '' : "&resident_status=$residentStatus"}${EmployedIn == '' ? '' : "&employed_in=$EmployedIn"}${deit == '' ? '' : "&eating_habbits=$deit"}${smoking == '' ? '' : "&smoking=$smoking"}${drinking == '' ? '' : "&drinking=$drinking"}${Natchathiram == '' ? '' : "&natchathiram=$Natchathiram"}${Profile == '' ? '' : "&profile=$Profile"}${Education == '' ? '' : "&education=$Education"}${Caste == '' ? '' : "&caste=$Caste"}${rasi == '' ? '' : "&rasi=$rasi"}${laknam == '' ? '' : "&laknam=$laknam"}${occupation == '' ? '' : "&occupation=$occupation"}");
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
    detailFilterModel.add(List<DetailedFilterModel>.from(
        body["data"].map((x) => DetailedFilterModel.fromJson(x))));

  }
  
 


   addWishListProposal(id, context)async {
    final addWishlistUrl = RestApiClient().addWishlist;
    print(addWishlistUrl);

    final response = await http.post(
                        Uri.parse(addWishlistUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              appPreference.accessToken!,
                        },
                        body: jsonEncode(<String, String>{
                          "wishuserId": id.toString(),
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        
                        showSuccessSnackBar(data["message"], context);
                        fetchDetailedFilter();
                        
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                      }else{
                      Text("Failed");
                      showSnackBar("Some error occured", context);
                      }
                      print(data);
                      
                    }

                    removeWishListProposal(id, context)async {
    final removeWishlistUrl = RestApiClient().removeWishlist;
    print(removeWishlistUrl);

    final response = await http.post(
                        Uri.parse(removeWishlistUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              appPreference.accessToken!,
                        },
                        body: jsonEncode(<String, String>{
                          "wishuserId": id.toString(),
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        // _popupMessage = 'Successfully removed to wishlist';
                       showSuccessSnackBar(data["message"], context);
                       fetchDetailedFilter();
                        // showSuccessSnackBar("Successfully withdraw the request", context);
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                      }else{
                        showSnackBar("Some error occured", context);
                      Text("Failed");
                      }
                     
                 
                      print(data);
                      
                    }

                    withdrawProposal(id, context)async {
    final withdrawUrl = RestApiClient().withdrawProposal;
    print(withdrawUrl);

    final response = await http.post(
                        Uri.parse(withdrawUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              appPreference.accessToken!,
                        },
                        body: jsonEncode(<String, String>{
                          "propsal_id": id,
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        
                        showSuccessSnackBar(data["message"], context);
                        fetchDetailedFilter();
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                      }else{
                        showSuccessSnackBar("Some error occured", context);
                      Text("Failed");
                      }
                      print(data);
                      
                    }

                     sentRequestProposal(id, context)async {
    final sentRequestUrl = RestApiClient().sendRequestProposal;
    print(sentRequestUrl);

    final response = await http.post(
                        Uri.parse(sentRequestUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              appPreference.accessToken!,
                        },
                        body: jsonEncode(<String, String>{
                          "request_for": id,
                          "message":"hi"
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        
                        showSuccessSnackBar(data["message"], context);
                        fetchDetailedFilter();
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                      }else{
                        showSuccessSnackBar("Some error occured", context);
                      Text("Failed");
                      }
                      print(data);
                      
                    }

                    acceptProposal(id, context) async {
      // update([() => isLoader.value = true]);
      

    final acceptUrl = RestApiClient().acceptProposal;
    print(acceptUrl);

    final response = await http.post(
                        Uri.parse(acceptUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              appPreference.accessToken!,
                        },
                        body: jsonEncode(<String, String>{
                          "propsal_id": id.toString(),
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        showSuccessSnackBar(data["message"], context);
                        fetchDetailedFilter();
                      Text("success");  
                      }else if(response.statusCode == 410){
                         showSnackBar(data["message"], context);
                      }else{
                      Text("Failed");
                      }
                      print(data);
                      
                    }

                    rejectProposal(id, context)async {
    final rejectUrl = RestApiClient().rejectProposal;
    print(rejectUrl);

    final response = await http.post(
                        Uri.parse(rejectUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              appPreference.accessToken!,
                        },
                        body: jsonEncode(<String, String>{
                          "propsal_id": id.toString(),
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        showSuccessSnackBar(data["message"], context);
                        fetchDetailedFilter();
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                        
                      }else{
                      Text("Failed");
                      }
                      print(data);
                      
                    }

  
   


  
  

 
}
