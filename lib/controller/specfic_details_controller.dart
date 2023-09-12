import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
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

class SpecficDetailsController extends BaseController {
  
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
                        
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                        
                      }else{
                      Text("Failed");
                      }
                      print(data);
                      
                    }

  
  

 
}
