import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:thirumanam/controller/detailed_filter_controller.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/send_proposal_model.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/utils/utils.dart';
import '../models/received_proprosal_model.dart';
import '../models/wishList_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class WishListController extends BaseController{
  final TextEditingController searchController = TextEditingController();
   Timer? timer;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  
  var name = "".obs;
  var name1 = "".obs;
  var memeber = "".obs;
  var customer = "".obs;
  var profileattachemnts = "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg".obs;
  var profileattachemnts1 = [].obs;
  var attachemnts1 = [].obs;
  var profilePicUrl = "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg".obs;
   @override
  void onInit() {
    super.onInit();
    fetchWishListProposal();
    fetchMyDetailedPage();
    name.value = "";
    name1.value = "";
    memeber.value = "";
    customer.value = "";
    profileattachemnts.value = "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg";
    profileattachemnts1.value = [];
    attachemnts1.value = [];
    profilePicUrl.value = "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg";
    
    
  }
  String _popupMessage = '';
List<wishListProprosalModel> result = [];
var wishListPageModel = StreamController<List<wishListProprosalModel>>.broadcast();
  Stream<List<wishListProprosalModel>> getFilteredModel() => wishListPageModel.stream;

     fetchWishListProposal() async {
     final url = RestApiClient().getallWishlist;
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
        
     wishListPageModel.add(List<wishListProprosalModel>.from(
        body["data"].map((x) => wishListProprosalModel.fromJson(x))));   
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
                        
                        showSuccessSnackBar("Successfully added to wishlist", context);
                        fetchWishListProposal();
                        
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
                       showSuccessSnackBar("Successfully removed to wishlist", context);
                       fetchWishListProposal();
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
                    var profileValid = false.obs;
                    var profileValidSelect = false.obs;
                    
var detailedPageModel = StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> getDetailedModel() => detailedPageModel.stream;
                  fetchMyDetailedPage() async {
                    profileValid.value = false;
    final url = Uri.parse("${URL}auth/myprofile");
    print(url);
    
    final response =
        await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          appPreference.accessToken!
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if (response.statusCode == 200) {
      attachemnts1.value = body['data'] != null && body['data']['customerDetails']  != 0 ? body['data']['customerDetails']["attachments"] : [];
      profileattachemnts1.value = body['data'] != null && body['data']['customerDetails']  != 0 ? body['data']['customerDetails']["attachments"] : [];
      print('profileattachemnts1.value');
       print(profileattachemnts1.value);
      // lastAttachment1.value = body["data"] != null && body["data"]['customerDetails'] != 0 ? body["data"]['customerDetails']["attachments"]!.length : [];
      final lastAttachment = body["data"] != null && body["data"]['customerDetails'] != null && body["data"]['customerDetails']["attachments"]!.length != 0 ? body["data"]['customerDetails']["attachments"].last : [];
      name.value = "${body['data']['customerDetails']["personal_details"]["first_name"] ?? ""}";
      name1.value = "${body['data']['customerDetails']["personal_details"]["last_name"] ?? ""}";
      profileattachemnts.value = "${body['data'] != null && body['data']['customerDetails'] != null && body['data']['customerDetails']["attachments"]!.length != 0 ? lastAttachment["url"] : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}";
      customer.value = "${body['data']['customerDetails']["customer_id"] ?? ""}";
      memeber.value = "${body['data']['customerDetails']["member_type"] ?? ""}"; 
      for (var attachment in profileattachemnts1.value) {
        print("attachment");
        print(attachment);
  if (attachment['isProfilePic'] == true) {
    profilePicUrl.value = attachment['url'];
    print('ba');
    print(profilePicUrl.value);
    break;
  }else{
    profilePicUrl.value = profileattachemnts.value;
    print('la');
    print(profilePicUrl.value);
  }
}
   
      // print("${body['data'] != null && body['data']['customerDetails'] != null && body['data']['customerDetails']["attachments"]!.length != 0 ? lastAttachment1["url"] : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}");
      // appPreference.accessToken = body["data"];memeber.value = "";
    // customer.value = "";
      print("balaji");
    }
    print(body);
    profileValid.value = true;
    profileValidSelect.value = true;
    // isLoading.value = false;
    // return body.map<receiviedProprosalModel>((data) => receiviedProprosalModel.fromJson(data)).toList();
    detailedPageModel.add(body);
    
  }

}