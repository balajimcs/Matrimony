import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/send_proposal_model.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/utils/utils.dart';
import '../models/received_proprosal_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class SentProporsalController extends BaseController{
   final TextEditingController searchController = TextEditingController();
   Timer? timer;
  var isWithdrawLoading = false.obs;
   @override
  void onInit() {
    super.onInit();
    
    // isLoading.value = true;
    fetchSentProposal();
  }
  TextEditingController RecentlyController = TextEditingController(text: '');
  TextEditingController name1Controller = TextEditingController(text: '');
  
  String Recently = '';
  String name1 = '';

var sentProposalPageModel = StreamController<List<sendProprosalModel>>.broadcast();
  Stream<List<sendProprosalModel>> getFilteredModel() => sentProposalPageModel.stream;

    fetchSentProposal() async {
     final url = Uri.parse("${URL}proposal/getallsendproposal?${Recently == '' ? '' : "sortCri=$Recently"}");
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
    sentProposalPageModel.add(List<sendProprosalModel>.from(
        body["data"].map((x) => sendProprosalModel.fromJson(x))));   
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
                        isWithdrawLoading.value = true;
                         showSuccessSnackBar(data["message"], context);
                        fetchSentProposal();
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
                        fetchSentProposal();
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                      }else{
                        showSuccessSnackBar("Some error occured", context);
                      Text("Failed");
                      }
                      print(data);
                      
                    }
}