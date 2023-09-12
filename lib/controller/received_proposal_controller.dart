import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/utils/utils.dart';
import '../models/received_proprosal_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class ReceiviedProporsalController extends BaseController{
  final TextEditingController searchController = TextEditingController();
   Timer? timer;
var proposalPageData = <ProposalProfileModel> [].obs;
  var itemList = <ProposalDataModel>[].obs;
  String name = '';
  String sort = 'recently_added';
  RxBool isLoader = false.obs;

  // var receiviedProprosal = receiviedProprosalModel().obs;
   @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    isLoader.value = false;
    fetchFood();
    }
  TextEditingController RecentlyController = TextEditingController(text: '');
  TextEditingController name1Controller = TextEditingController(text: '');
  
  String Recently = '';
  String name1 = '';

 
var receviedProposalPageModel = StreamController<List<receiviedProprosalModel>>.broadcast();
  Stream<List<receiviedProprosalModel>> getFilteredModel() => receviedProposalPageModel.stream;

    fetchFood() async {
    final url = Uri.parse("${URL}proposal/getallreceivedproposal?${Recently == '' ? '' : "sortCri=$Recently"}");
    print(url);

    final response = await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          appPreference.accessToken!
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if(response.statusCode == 200){
      print(body);
          }
    receviedProposalPageModel.add(List<receiviedProprosalModel>.from(
        body["data"].map((x) => receiviedProprosalModel.fromJson(x))));   
    
  }


  

  acceptProposal(id, context) async {
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
                        isLoader.value = true;
                        await Future.delayed(Duration(seconds: 2));
                        //  update([() => isLoader.value = false]);
                        showSuccessSnackBar(data["message"], context);
                        fetchFood();
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
                        fetchFood();
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                        
                      }else{
                      Text("Failed");
                      }
                      print(data);
                      
                    }
}