import 'dart:convert';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/controller/splash_controller.dart';
import 'package:thirumanam/models/all_users_model.dart';
import 'package:thirumanam/models/data_model.dart';
import 'package:http/http.dart' as http;

import '../models/home_user_model.dart';
import '../resources/app_routes.dart';
import '../utils/api_config.dart';
import '../utils/constants.dart';

class DashboardController extends BaseController{
  void showDialogBox() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
		borderRadius: BorderRadius.circular(30),
	),
        backgroundColor: Color(0xffEAF12D),
      title: Text('Complete the profile!!', style: TextStyle(fontFamily: "Raleway",
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xFF134FAF), fontSize: 25)),
      actions: [
       SizedBox(
                                          height: 350,
                                          child: SingleChildScrollView(
                                            child: Column(children: [
                                              Center(
                                                child: Image.asset('assets/images/wrong.gif'),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text("Complete the profile for make profile matched", textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black, fontSize: 17),),
                                              ),
                                               SizedBox(
                                                height: 25,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(right: 20),
                                                child: Column(
                                                  children: [
                                                    
                                                        MouseRegion(
                                                          cursor: SystemMouseCursors.basic,
                                                          
                                                          child: ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              primary: Color(0xFF134FAF),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(10))),
                                                            ),
                                                            child: Text("Profile"),
                                                            onPressed: (){
                                                                                                              // controller.withdrawProposal(food.id, context);
                                                                                                              // print(controller.withdrawProposal(food.id, context));
                                                              
                                                              Get.back();
                                                              
                                                              
                                                             
                                                              // fetchWishListProposal("");
                                                            },
                                                          ),
                                                          
                                                        ),
                                                      
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ))
      ],
    ),
  );
    });
}

void showDialogBox1() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
		borderRadius: BorderRadius.circular(30),
	),
        backgroundColor: Color(0xffEAF12D),
      title: Text('Complete the profile!!', style: TextStyle(fontFamily: "Raleway",
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xFF134FAF), fontSize: 25)),
      actions: [
       SizedBox(
                                          height: 350,
                                          child: SingleChildScrollView(
                                            child: Column(children: [
                                              Center(
                                                child: Image.asset('assets/images/wrong.gif'),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text("Complete the profile picture for make profile matched", textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black, fontSize: 17),),
                                              ),
                                               SizedBox(
                                                height: 25,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(right: 20),
                                                child: Column(
                                                  children: [
                                                    
                                                        MouseRegion(
                                                          cursor: SystemMouseCursors.basic,
                                                          
                                                          child: ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              primary: Color(0xFF134FAF),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(10))),
                                                            ),
                                                            child: Text("Profile"),
                                                            onPressed: (){
                                                                                                              // controller.withdrawProposal(food.id, context);
                                                                                                              // print(controller.withdrawProposal(food.id, context));
                                                              
                                                              Get.back();
                                                              
                                                              
                                                             
                                                              // fetchWishListProposal("");
                                                            },
                                                          ),
                                                          
                                                        ),
                                                      
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ))
      ],
    ),
  );
    });
}

void showDialogBox2() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
		borderRadius: BorderRadius.circular(30),
	),
        backgroundColor: Color(0xffEAF12D),
      title: Text('Complete the profile!!', style: TextStyle(fontFamily: "Raleway",
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xFF134FAF), fontSize: 25)),
      actions: [
       SizedBox(
                                          height: 350,
                                          child: SingleChildScrollView(
                                            child: Column(children: [
                                              Center(
                                                child: Image.asset('assets/images/wrong.gif'),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text("Complete the horoscopic for make profile matched", textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black, fontSize: 17),),
                                              ),
                                               SizedBox(
                                                height: 25,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(right: 20),
                                                child: Column(
                                                  children: [
                                                    
                                                        MouseRegion(
                                                          cursor: SystemMouseCursors.basic,
                                                          
                                                          child: ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              primary: Color(0xFF134FAF),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(10))),
                                                            ),
                                                            child: Text("Profile"),
                                                            onPressed: (){
                                                                                                              // controller.withdrawProposal(food.id, context);
                                                                                                              // print(controller.withdrawProposal(food.id, context));
                                                              
                                                              Get.back();
                                                              
                                                              
                                                             
                                                              // fetchWishListProposal("");
                                                            },
                                                          ),
                                                          
                                                        ),
                                                      
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ))
      ],
    ),
  );
    });
}

 var percent = 0.obs;
 int completedFields = 0;
   var name = "".obs;
  var name1 = "".obs;
  var memeber = "".obs;
  var customer = "".obs;
  var profileattachemnts = "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg".obs;
  var religion = false.obs;
  var communication = false.obs;
  var permenent = false.obs;
  var carrier = false.obs;
  var personal = false.obs;
  var jathagam = false.obs;
  var family = false.obs;
  var basic = false.obs;
  var imageadded = false.obs;
  var horoscopic = false.obs;
  var nearby = <HomeProfileModel> [].obs;
  var recentlyViewed = <HomeProfileModel> [].obs;
  var featuredMembers = <HomeProfileModel> [].obs;
  var recommendedMembers = <HomeProfileModel> [].obs;
  var DetailedPage = false.obs;
  var itemList = <HomePageDataModel>[].obs;

  var allUserModel = HomeUserModel().obs;

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    percent.value = 0;
    name.value = "";
    name1.value = "";
    memeber.value = "";
    customer.value = "";
    profileattachemnts.value = "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg";
    religion.value = false;
    communication.value = false;
    permenent.value = false;
    carrier.value = false;
    personal.value = false;
    jathagam.value = false;
    family.value = false;
    basic.value = false;
    imageadded.value = false;
    horoscopic.value = false;
    fetchMyDetailedPage();
    isLoading.value = true;
    DetailedPage.value = true;
    getAllUsersAPI();
    // setDummyHomeData();
  }

  getAllUsersAPI(){
    http.get(
        RestApiClient().allUsers,headers: {
          'Content-type': 'application/json; charset=UTF-8',
            "x-access-token": appPreference.accessToken!

          },
        ).then((value) {
      print("getAllUsersAPI Response: ${value.body}");
      final res = jsonDecode(value.body);
      if(res["success"]== 1){
          
        
        
          
          allUserModel.value = HomeUserModel.fromJson(res);
          if(religion.value == false || communication.value == false || permenent.value == false || carrier.value == false || permenent.value == false || jathagam.value == false || family.value == false || basic.value == false){
          showDialogBox();
          }else if(imageadded.value == false){
          showDialogBox1();
          }else if(horoscopic.value == false){
          showDialogBox2();
          }else{
            print("a");
          }


          if(percent.value <= 70){

            Get.toNamed(RouteNames.profile);
            showDialogBox();

            
          }
      }

      for(int i =0 ;i<allUserModel.value.data!.nearByYou!.length; i++){
        String? name = "";
        String? gender = "";
        int? age;
        String? des = "";
        String? address = "";
        int? height = 0;
        if(allUserModel.value.data!.nearByYou![i].cusomterDetails != null && allUserModel.value.data!.nearByYou![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails != null){
          if(allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.firstName != null || allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.lastName != null){
            name = '${allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.firstName != null ? "${allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.firstName} " : ""}'
                '${allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.lastName ?? ""}';
          }
          if(allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.gender != null && allUserModel.value.data!.nearByYou![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.gender != ""){
            gender = allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.gender;
          }
          if(allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.dOB != null && allUserModel.value.data!.nearByYou![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.dOB != ""){
            DateTime? tempDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.dOB ?? "");
            age = AgeCalculator.age(tempDate).years;
          }
          if(allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.height != null && allUserModel.value.data!.nearByYou![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.height != ""){
            height = allUserModel.value.data!.nearByYou![i].cusomterDetails![0].personalDetails?.height;
          }
        }
        if(allUserModel.value.data!.nearByYou![i].cusomterDetails != null && allUserModel.value.data!.nearByYou![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].cusomterDetails![0].carrierAndWorkingDetails != null){
          if(allUserModel.value.data!.nearByYou![i].cusomterDetails![0].carrierAndWorkingDetails?.workingAs != null && allUserModel.value.data!.nearByYou![i].cusomterDetails![0].carrierAndWorkingDetails?.workingAs != ""){
            des = allUserModel.value.data!.nearByYou![i].cusomterDetails![0].carrierAndWorkingDetails?.workingAs ?? "";
          }
        }
        if(allUserModel.value.data!.nearByYou![i].cusomterDetails != null && allUserModel.value.data!.nearByYou![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].cusomterDetails![0].permanentAddress != null){
          address = '${allUserModel.value.data!.nearByYou![i].cusomterDetails![0].permanentAddress?.city != null ? "${allUserModel.value.data!.nearByYou![i].cusomterDetails![0].permanentAddress?.city}, " : ""}'
              '${allUserModel.value.data!.nearByYou![i].cusomterDetails![0].permanentAddress?.district != null ? "${allUserModel.value.data!.nearByYou![i].cusomterDetails![0].permanentAddress?.district}, " : ""}'
              '${allUserModel.value.data!.nearByYou![i].cusomterDetails![0].permanentAddress?.state != null ? "${allUserModel.value.data!.nearByYou![i].cusomterDetails![0].permanentAddress?.state}" : ""}';
        }
        // print("appPreference.userId ${appPreference.userId}");
        // var tempOption = allUserModel.value.data!.nearByYou![i].requestSentDetails?.where((element) => element.sId! == appPreference.userId).toList();
        HomeProfileModel model = HomeProfileModel(
            id: allUserModel.value.data!.nearByYou![i].sId,
            userId: allUserModel.value.data!.nearByYou![i].cusomterDetails != null && allUserModel.value.data!.nearByYou![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].cusomterDetails![0] != null ? allUserModel.value.data!.nearByYou![i].cusomterDetails![0].userObjId : "",
            name: name,
            gender: gender,
            image: allUserModel.value.data!.nearByYou![i].cusomterDetails != null && allUserModel.value.data!.nearByYou![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].cusomterDetails![0].attachments!.length > 0 ? allUserModel.value.data!.nearByYou![i].cusomterDetails![0].attachments![0].url : "",
            designation: des,
            location: address,
            cusId: allUserModel.value.data!.nearByYou![i].cusomterDetails != null && allUserModel.value.data!.nearByYou![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].cusomterDetails![0] != null ? allUserModel.value.data!.nearByYou![i].cusomterDetails![0].userObjId : "",
            heightInch: height,
            age: age,
            sendProposalId: allUserModel.value.data!.nearByYou![i].requestSentDetails != null && allUserModel.value.data!.nearByYou![i].requestSentDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].requestSentDetails![0] != null ? allUserModel.value.data!.nearByYou![i].requestSentDetails![0].sentId : '',
            receiveProposalId: allUserModel.value.data!.nearByYou![i].requestRecievedDetails != null && allUserModel.value.data!.nearByYou![i].requestRecievedDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].requestRecievedDetails![0] != null ? allUserModel.value.data!.nearByYou![i].requestRecievedDetails![0].recievedId : '',
            removeWishlistId: allUserModel.value.data!.nearByYou![i].requestWishListDetails != null && allUserModel.value.data!.nearByYou![i].requestWishListDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].requestWishListDetails![0] != null ? allUserModel.value.data!.nearByYou![i].requestWishListDetails![0].wishlistId : '',
            isLiked: allUserModel.value.data!.nearByYou![i].isAddedToWhishList == 0 ? false : true,
            isRequestSent: allUserModel.value.data!.nearByYou![i].isRequestSent != null ? allUserModel.value.data!.nearByYou![i].isRequestSent : 0,
            isRequestSentAccept: allUserModel.value.data!.nearByYou![i].isRequestSentAccepted != null ? allUserModel.value.data!.nearByYou![i].isRequestSentAccepted : 0,
            isRequestSentReject: allUserModel.value.data!.nearByYou![i].isRequestSentRejected != null ? allUserModel.value.data!.nearByYou![i].isRequestSentRejected : 0,
            isRequestReceived: allUserModel.value.data!.nearByYou![i].isRequestRecieved != null ? allUserModel.value.data!.nearByYou![i].isRequestRecieved : 0,
            isRequestReceivedAccept: allUserModel.value.data!.nearByYou![i].isRequestRecievedAccepted != null ? allUserModel.value.data!.nearByYou![i].isRequestRecievedAccepted : 0,
            isRequestReceivedReject: allUserModel.value.data!.nearByYou![i].isRequestRecievedRejected != null ? allUserModel.value.data!.nearByYou![i].isRequestRecievedRejected : 0,
            isaddedWishlist: allUserModel.value.data!.nearByYou![i].isAddedToWhishList != null ? allUserModel.value.data!.nearByYou![i].isAddedToWhishList : 0,
            sendProposal: allUserModel.value.data!.nearByYou![i].isRequestSent == 0 ? false : true,
            sendacceptProposal: allUserModel.value.data!.nearByYou![i].isRequestSentAccepted == 0 ? false : true,
            sendrejectProposal: allUserModel.value.data!.nearByYou![i].isRequestSentRejected == 0 ? false : true,
            receiveProposal: allUserModel.value.data!.nearByYou![i].isRequestRecieved == 0 ? false : true,
            receiveacceptProposal: allUserModel.value.data!.nearByYou![i].isRequestRecievedAccepted == 0 ? false : true,
            receiverejectProposal: allUserModel.value.data!.nearByYou![i].isRequestRecievedRejected == 0 ? false : true,
            // proposalId: tempOption != null && tempOption.length == 0 ? "" : tempOption?.first.sId
     
        );
     print('aaaaaa: ${allUserModel.value.data!.nearByYou![i].requestSentDetails != null && allUserModel.value.data!.nearByYou![i].requestSentDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].requestSentDetails![0] != null ? allUserModel.value.data!.nearByYou![i].requestSentDetails![0].sentId : ''}');
        nearby.value.add(model);
      }

      HomePageDataModel dataModel1 = HomePageDataModel(
          title: "Near by you",
          itemList: nearby.value
      );

      for(int i =0 ;i<allUserModel.value.data!.recentlyViewed!.length; i++){
        String? name = "";
        String? gender = "";
        int? age;
        String? des = "";
        String? address = "";
        int? height = 0;
        if(allUserModel.value.data!.recentlyViewed![i].cusomterDetails != null && allUserModel.value.data!.recentlyViewed![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails != null){
          if(allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.firstName != null || allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.lastName != null){
            name = '${allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.firstName != null ? "${allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.firstName} " : ""}'
                '${allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.lastName ?? ""}';
          }
          if(allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.gender != null && allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.gender != ""){
            gender = allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.gender;
          }
          if(allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.dOB != null && allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.dOB != ""){
            DateTime? tempDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.dOB ?? "");
            age = AgeCalculator.age(tempDate).years;
          }
          if(allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.height != null && allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.height != ""){
            height = allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].personalDetails?.height;
          }
        }
        if(allUserModel.value.data!.recentlyViewed![i].cusomterDetails != null && allUserModel.value.data!.recentlyViewed![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].carrierAndWorkingDetails != null){
          if(allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].carrierAndWorkingDetails?.workingAs != null && allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].carrierAndWorkingDetails?.workingAs != ""){
            des = allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].carrierAndWorkingDetails?.workingAs ?? "";
          }
        }
        if(allUserModel.value.data!.recentlyViewed![i].cusomterDetails != null && allUserModel.value.data!.recentlyViewed![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].permanentAddress != null){
          address = '${allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].permanentAddress?.city != null ? "${allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].permanentAddress?.city}, " : ""}'
              '${allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].permanentAddress?.district != null ? "${allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].permanentAddress?.district}, " : ""}'
              '${allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].permanentAddress?.state != null ? "${allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].permanentAddress?.state}" : ""}';
        }

        // var tempOption1 = allUserModel.value.data!.recentlyViewed![i].requestSentDetails?.where((element) => element.sId! == appPreference.userId).toList();

        HomeProfileModel model1 = HomeProfileModel(
            id: allUserModel.value.data!.recentlyViewed![i].sId,
            userId: allUserModel.value.data!.recentlyViewed![i].cusomterDetails != null && allUserModel.value.data!.recentlyViewed![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0] != null ? allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].userObjId : "",
            name: name,
            gender: gender,
            image: allUserModel.value.data!.recentlyViewed![i].cusomterDetails != null && allUserModel.value.data!.recentlyViewed![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].attachments!.length > 0 ? allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].attachments![0].url : "",
            designation: des,
            location: address,
            cusId: allUserModel.value.data!.recentlyViewed![i].cusomterDetails != null && allUserModel.value.data!.recentlyViewed![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0] != null ? allUserModel.value.data!.recentlyViewed![i].cusomterDetails![0].userObjId : "",
            heightInch: height,
            age: age,
            isRequestSent: allUserModel.value.data!.recentlyViewed![i].isRequestSent != null ? allUserModel.value.data!.recentlyViewed![i].isRequestSent : 0,
            isRequestSentAccept: allUserModel.value.data!.recentlyViewed![i].isRequestSentAccepted != null ? allUserModel.value.data!.recentlyViewed![i].isRequestSentAccepted : 0,
            isRequestSentReject: allUserModel.value.data!.recentlyViewed![i].isRequestSentRejected != null ? allUserModel.value.data!.recentlyViewed![i].isRequestSentRejected : 0,
            isRequestReceived: allUserModel.value.data!.recentlyViewed![i].isRequestRecieved != null ? allUserModel.value.data!.recentlyViewed![i].isRequestRecieved : 0,
            isRequestReceivedAccept: allUserModel.value.data!.recentlyViewed![i].isRequestRecievedAccepted != null ? allUserModel.value.data!.recentlyViewed![i].isRequestRecievedAccepted : 0,
            isRequestReceivedReject: allUserModel.value.data!.recentlyViewed![i].isRequestRecievedRejected != null ? allUserModel.value.data!.recentlyViewed![i].isRequestRecievedRejected : 0,
            isaddedWishlist: allUserModel.value.data!.recentlyViewed![i].isAddedToWhishList != null ? allUserModel.value.data!.recentlyViewed![i].isAddedToWhishList : 0,
            sendProposalId: allUserModel.value.data!.recentlyViewed![i].requestSentDetails != null && allUserModel.value.data!.recentlyViewed![i].requestSentDetails!.isNotEmpty && allUserModel.value.data!.recentlyViewed![i].requestSentDetails![0] != null ? allUserModel.value.data!.recentlyViewed![i].requestSentDetails![0].sentId : '',
            receiveProposalId: allUserModel.value.data!.recentlyViewed![i].requestRecievedDetails != null && allUserModel.value.data!.recentlyViewed![i].requestRecievedDetails!.isNotEmpty && allUserModel.value.data!.recentlyViewed![i].requestRecievedDetails![0] != null ? allUserModel.value.data!.recentlyViewed![i].requestRecievedDetails![0].recievedId : '',
            removeWishlistId: allUserModel.value.data!.recentlyViewed![i].requestWishListDetails != null && allUserModel.value.data!.recentlyViewed![i].requestWishListDetails!.isNotEmpty && allUserModel.value.data!.recentlyViewed![i].requestWishListDetails![0] != null ? allUserModel.value.data!.recentlyViewed![i].requestWishListDetails![0].wishlistId : '',
            isLiked: allUserModel.value.data!.recentlyViewed![i].isAddedToWhishList == 0 ? false : true,
          sendProposal: allUserModel.value.data!.recentlyViewed![i].isRequestSent == 0 ? false : true,
            sendacceptProposal: allUserModel.value.data!.recentlyViewed![i].isRequestSentAccepted == 0 ? false : true,
            sendrejectProposal: allUserModel.value.data!.recentlyViewed![i].isRequestSentRejected == 0 ? false : true,
            receiveProposal: allUserModel.value.data!.recentlyViewed![i].isRequestRecieved == 0 ? false : true,
            receiveacceptProposal: allUserModel.value.data!.recentlyViewed![i].isRequestRecievedAccepted == 0 ? false : true,
            receiverejectProposal: allUserModel.value.data!.recentlyViewed![i].isRequestRecievedRejected == 0 ? false : true,
          //   proposalId: tempOption1 != null && tempOption1.length == 0 ? "" : tempOption1?.first.sId
        );
        print('aaaaaa: ${allUserModel.value.data!.nearByYou![i].requestSentDetails != null && allUserModel.value.data!.nearByYou![i].requestSentDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].requestSentDetails![0] != null ? allUserModel.value.data!.nearByYou![i].requestSentDetails![0].sentId : ''}');
        recentlyViewed.value.add(model1);
      }

      HomePageDataModel dataModel2 = HomePageDataModel(
          title: "Recently Viewed",
          itemList: recentlyViewed.value
      );

      for(int i =0 ;i<allUserModel.value.data!.featuredMembers!.length; i++){
        String? name = "";
        String? gender = "";
        int? age;
        String? des = "";
        String? address = "";
        int? height = 0;
        if(allUserModel.value.data!.featuredMembers![i].cusomterDetails != null && allUserModel.value.data!.featuredMembers![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails != null){
          if(allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.firstName != null || allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.lastName != null){
            name = '${allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.firstName != null ? "${allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.firstName} " : ""}'
                '${allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.lastName ?? ""}';
          }
          if(allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.gender != null && allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.gender != ""){
            gender = allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.gender;
          }
          if(allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.dOB != null && allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.dOB != ""){
            DateTime? tempDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.dOB ?? "");
            age = AgeCalculator.age(tempDate).years;
          }
          if(allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.height != null && allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.height != ""){
            height = allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].personalDetails?.height;
          }
        }
        if(allUserModel.value.data!.featuredMembers![i].cusomterDetails != null && allUserModel.value.data!.featuredMembers![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.featuredMembers![i].cusomterDetails![0] != null && allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].carrierAndWorkingDetails != null){
          if(allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].carrierAndWorkingDetails?.workingAs != null && allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].carrierAndWorkingDetails?.workingAs != ""){
            des = allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].carrierAndWorkingDetails?.workingAs ?? "";
          }
        }
        if(allUserModel.value.data!.featuredMembers![i].cusomterDetails != null && allUserModel.value.data!.featuredMembers![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.featuredMembers![i].cusomterDetails![0] != null && allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].permanentAddress != null){
          address = '${allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].permanentAddress?.city != null ? "${allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].permanentAddress?.city}, " : ""}'
              '${allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].permanentAddress?.district != null ? "${allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].permanentAddress?.district}, " : ""}'
              '${allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].permanentAddress?.state != null ? "${allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].permanentAddress?.state}" : ""}';
        }

        // var tempOption2 = allUserModel.value.data!.featuredMembers![i].requestSentDetails?.where((element) => element.sId! == appPreference.userId).toList();

        HomeProfileModel model2 = HomeProfileModel(
            id: allUserModel.value.data!.featuredMembers![i].sId,
            userId: allUserModel.value.data!.featuredMembers![i].cusomterDetails != null && allUserModel.value.data!.featuredMembers![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.featuredMembers![i].cusomterDetails![0] != null ? allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].userObjId : "",
            name: name,
            gender: gender,
            image: allUserModel.value.data!.featuredMembers![i].cusomterDetails != null && allUserModel.value.data!.featuredMembers![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].attachments!.length > 0 ? allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].attachments![0].url : "",
            designation: des,
            location: address,
            cusId: allUserModel.value.data!.featuredMembers![i].cusomterDetails != null && allUserModel.value.data!.featuredMembers![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.featuredMembers![i].cusomterDetails![0] != null ? allUserModel.value.data!.featuredMembers![i].cusomterDetails![0].userObjId : "",
            heightInch: height,
            age: age,
            isRequestSent: allUserModel.value.data!.featuredMembers![i].isRequestSent != null ? allUserModel.value.data!.featuredMembers![i].isRequestSent : 0,
            isRequestSentAccept: allUserModel.value.data!.featuredMembers![i].isRequestSentAccepted != null ? allUserModel.value.data!.featuredMembers![i].isRequestSentAccepted : 0,
            isRequestSentReject: allUserModel.value.data!.featuredMembers![i].isRequestSentRejected != null ? allUserModel.value.data!.featuredMembers![i].isRequestSentRejected : 0,
            isRequestReceived: allUserModel.value.data!.featuredMembers![i].isRequestRecieved != null ? allUserModel.value.data!.featuredMembers![i].isRequestRecieved : 0,
            isRequestReceivedAccept: allUserModel.value.data!.featuredMembers![i].isRequestRecievedAccepted != null ? allUserModel.value.data!.featuredMembers![i].isRequestRecievedAccepted : 0,
            isRequestReceivedReject: allUserModel.value.data!.featuredMembers![i].isRequestRecievedRejected != null ? allUserModel.value.data!.featuredMembers![i].isRequestRecievedRejected : 0,
            isaddedWishlist: allUserModel.value.data!.featuredMembers![i].isAddedToWhishList != null ? allUserModel.value.data!.featuredMembers![i].isAddedToWhishList : 0,
            sendProposalId: allUserModel.value.data!.featuredMembers![i].requestSentDetails != null && allUserModel.value.data!.featuredMembers![i].requestSentDetails!.isNotEmpty && allUserModel.value.data!.featuredMembers![i].requestSentDetails![0] != null ? allUserModel.value.data!.featuredMembers![i].requestSentDetails![0].sentId : '',
            receiveProposalId: allUserModel.value.data!.featuredMembers![i].requestRecievedDetails != null && allUserModel.value.data!.featuredMembers![i].requestRecievedDetails!.isNotEmpty && allUserModel.value.data!.featuredMembers![i].requestRecievedDetails![0] != null ? allUserModel.value.data!.featuredMembers![i].requestRecievedDetails![0].recievedId : '',
            removeWishlistId: allUserModel.value.data!.featuredMembers![i].requestWishListDetails != null && allUserModel.value.data!.featuredMembers![i].requestWishListDetails!.isNotEmpty && allUserModel.value.data!.featuredMembers![i].requestWishListDetails![0] != null ? allUserModel.value.data!.featuredMembers![i].requestWishListDetails![0].wishlistId : '',
            isLiked: allUserModel.value.data!.featuredMembers![i].isAddedToWhishList == 0 ? false : true,
          sendProposal: allUserModel.value.data!.featuredMembers![i].isRequestSent == 0 ? false : true,
            sendacceptProposal: allUserModel.value.data!.featuredMembers![i].isRequestSentAccepted == 0 ? false : true,
            sendrejectProposal: allUserModel.value.data!.featuredMembers![i].isRequestSentRejected == 0 ? false : true,
            receiveProposal: allUserModel.value.data!.featuredMembers![i].isRequestRecieved == 0 ? false : true,
            receiveacceptProposal: allUserModel.value.data!.featuredMembers![i].isRequestRecievedAccepted == 0 ? false : true,
            receiverejectProposal: allUserModel.value.data!.featuredMembers![i].isRequestRecievedRejected == 0 ? false : true,
          //   proposalId: tempOption2 != null && tempOption2.length == 0 ? "" : tempOption2?.first.sId
        );
 print('aaaaaa: ${allUserModel.value.data!.nearByYou![i].requestSentDetails != null && allUserModel.value.data!.nearByYou![i].requestSentDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].requestSentDetails![0] != null ? allUserModel.value.data!.nearByYou![i].requestSentDetails![0].sentId : ''}');
        featuredMembers.value.add(model2);
      }

      HomePageDataModel dataModel3 = HomePageDataModel(
          title: "Featured members",
          itemList: featuredMembers.value
      );

      for(int i =0 ;i<allUserModel.value.data!.recommendedMembers!.length; i++){
        String? name = "";
        String? gender = "";
        int? age;
        String? des = "";
        String? address = "";
        int? height = 0;
        if(allUserModel.value.data!.recommendedMembers![i].cusomterDetails != null && allUserModel.value.data!.recommendedMembers![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails != null){
          if(allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.firstName != null || allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.lastName != null){
            name = '${allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.firstName != null ? "${allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.firstName} " : ""}'
                '${allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.lastName ?? ""}';
          }
          if(allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.gender != null && allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.gender != ""){
            gender = allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.gender;
          }
          if(allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.dOB != null && allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.dOB != ""){
            DateTime? tempDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.dOB ?? "");
            age = AgeCalculator.age(tempDate).years;
          }
          if(allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.height != null && allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.height != ""){
            height = allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].personalDetails?.height;
          }
        }
        if(allUserModel.value.data!.recommendedMembers![i].cusomterDetails != null && allUserModel.value.data!.recommendedMembers![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0] != null && allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].carrierAndWorkingDetails != null){
          if(allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].carrierAndWorkingDetails?.workingAs != null && allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].carrierAndWorkingDetails?.workingAs != ""){
            des = allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].carrierAndWorkingDetails?.workingAs ?? "";
          }
        }
        if(allUserModel.value.data!.recommendedMembers![i].cusomterDetails != null && allUserModel.value.data!.recommendedMembers![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0] != null && allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].permanentAddress != null){
          address = '${allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].permanentAddress?.city != null ? "${allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].permanentAddress?.city}, " : ""}'
              '${allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].permanentAddress?.district != null ? "${allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].permanentAddress?.district}, " : ""}'
              '${allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].permanentAddress?.state != null ? "${allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].permanentAddress?.state}" : ""}';
        }
        // var tempOption3 = allUserModel.value.data!.recommendedMembers![i].requestSentDetails?.where((element) => element.sId! == appPreference.userId).toList();

        HomeProfileModel model3 = HomeProfileModel(
            id: allUserModel.value.data!.recommendedMembers![i].sId,
            userId: allUserModel.value.data!.recommendedMembers![i].cusomterDetails != null && allUserModel.value.data!.recommendedMembers![i].cusomterDetails!.isNotEmpty &&  allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0] != null ? allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].userObjId : "",
            name: name,
            gender: gender,
            image: allUserModel.value.data!.recommendedMembers![i].cusomterDetails != null && allUserModel.value.data!.recommendedMembers![i].cusomterDetails!.isNotEmpty && allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].attachments!.length > 0 ? allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].attachments![0].url : "",
            designation: des,
            location: address,
            cusId: allUserModel.value.data!.recommendedMembers![i].cusomterDetails != null && allUserModel.value.data!.recommendedMembers![i].cusomterDetails!.isNotEmpty &&  allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0] != null ? allUserModel.value.data!.recommendedMembers![i].cusomterDetails![0].userObjId : "",
            heightInch: height,
            age: age,
            isRequestSent: allUserModel.value.data!.recommendedMembers![i].isRequestSent != null ? allUserModel.value.data!.recommendedMembers![i].isRequestSent : 0,
            isRequestSentAccept: allUserModel.value.data!.recommendedMembers![i].isRequestSentAccepted != null ? allUserModel.value.data!.recommendedMembers![i].isRequestSentAccepted : 0,
            isRequestSentReject: allUserModel.value.data!.recommendedMembers![i].isRequestSentRejected != null ? allUserModel.value.data!.recommendedMembers![i].isRequestSentRejected : 0,
            isRequestReceived: allUserModel.value.data!.recommendedMembers![i].isRequestRecieved != null ? allUserModel.value.data!.recommendedMembers![i].isRequestRecieved : 0,
            isRequestReceivedAccept: allUserModel.value.data!.recommendedMembers![i].isRequestRecievedAccepted != null ? allUserModel.value.data!.recommendedMembers![i].isRequestRecievedAccepted : 0,
            isRequestReceivedReject: allUserModel.value.data!.recommendedMembers![i].isRequestRecievedRejected != null ? allUserModel.value.data!.recommendedMembers![i].isRequestRecievedRejected : 0,
            isaddedWishlist: allUserModel.value.data!.recommendedMembers![i].isAddedToWhishList != null ? allUserModel.value.data!.recommendedMembers![i].isAddedToWhishList : 0,
            sendProposalId: allUserModel.value.data!.recommendedMembers![i].requestSentDetails != null && allUserModel.value.data!.recommendedMembers![i].requestSentDetails!.isNotEmpty && allUserModel.value.data!.recommendedMembers![i].requestSentDetails![0] != null ? allUserModel.value.data!.recommendedMembers![i].requestSentDetails![0].sentId : '',
            receiveProposalId: allUserModel.value.data!.recommendedMembers![i].requestRecievedDetails != null && allUserModel.value.data!.recommendedMembers![i].requestRecievedDetails!.isNotEmpty && allUserModel.value.data!.recommendedMembers![i].requestRecievedDetails![0] != null ? allUserModel.value.data!.recommendedMembers![i].requestRecievedDetails![0].recievedId : '',
            removeWishlistId: allUserModel.value.data!.recommendedMembers![i].requestWishListDetails != null && allUserModel.value.data!.recommendedMembers![i].requestWishListDetails!.isNotEmpty && allUserModel.value.data!.recommendedMembers![i].requestWishListDetails![0] != null ? allUserModel.value.data!.recommendedMembers![i].requestWishListDetails![0].wishlistId : '',
            isLiked: allUserModel.value.data!.recommendedMembers![i].isAddedToWhishList == 0 ? false : true,
          sendProposal: allUserModel.value.data!.recommendedMembers![i].isRequestSent == 0 ? false : true,
            sendacceptProposal: allUserModel.value.data!.recommendedMembers![i].isRequestSentAccepted == 0 ? false : true,
            sendrejectProposal: allUserModel.value.data!.recommendedMembers![i].isRequestSentRejected == 0 ? false : true,
            receiveProposal: allUserModel.value.data!.recommendedMembers![i].isRequestRecieved == 0 ? false : true,
            receiveacceptProposal: allUserModel.value.data!.recommendedMembers![i].isRequestRecievedAccepted == 0 ? false : true,
            receiverejectProposal: allUserModel.value.data!.recommendedMembers![i].isRequestRecievedRejected == 0 ? false : true,
          //   proposalId: tempOption3 != null && tempOption3.length == 0 ? "" : tempOption3?.first.sId
        );
        
        print('aaaaaa: ${allUserModel.value.data!.nearByYou![i].requestSentDetails != null && allUserModel.value.data!.nearByYou![i].requestSentDetails!.isNotEmpty && allUserModel.value.data!.nearByYou![i].requestSentDetails![0] != null ? allUserModel.value.data!.nearByYou![i].requestSentDetails![0].sentId : ''}');
        recommendedMembers.value.add(model3);
      }

      HomePageDataModel dataModel4 = HomePageDataModel(
          title: "Recommanded members",
          itemList: recommendedMembers.value
      );
      itemList.value.add(dataModel1);
        itemList.value.add(dataModel2);
        itemList.value.add(dataModel3);
        itemList.value.add(dataModel4);
      isLoading.value = false;
    });
    
  }


  addWishListProposal(int catIndex, int index, context)async {
    String userID = itemList.value[catIndex].itemList![index].cusId!;
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
                          "wishuserId": userID,
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        allUserModel.value;
                        showSuccessSnackBar(data["message"], context);
                        
                        // getAllUsersAPI();
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                      }else{
                      Text("Failed");
                      showSnackBar("Some error occured", context);
                      }
                      print(data);
                      
                    }

       removeWishListProposal(int catIndex, int index, context)async {
        String userID = itemList.value[catIndex].itemList![index].removeWishlistId!;
        print(userID);
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
                          "wishuserId": userID,
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        
                        // _popupMessage = 'Successfully removed to wishlist';
                       showSuccessSnackBar(data["message"], context);
                      //  getAllUsersAPI();
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

 

  sentRequestProposal(int catIndex, int index, context)async {
    String userID = itemList.value[catIndex].itemList![index].cusId!;
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
                          "request_for": userID,
                          "message":"hi"
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        
                        showSuccessSnackBar(data["message"], context);
                        // getAllUsersAPI();
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                      }else{
                        showSuccessSnackBar("Some error occured", context);
                      Text("Failed");
                      }
                      print(data);
                      
                    }

   withdrawProposal(int catIndex, int index, context)async {
    String userID = itemList.value[catIndex].itemList![index].sendProposalId!;
    print('bbb: ${userID}');
    print(itemList.value[catIndex]);
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
                          "propsal_id": userID,
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        
                        showSuccessSnackBar(data["message"], context);
                        // getAllUsersAPI();
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                      }else{
                        showSuccessSnackBar("Some error occured", context);
                      Text("Failed");
                      }
                      print(data);
                      
                    }

       acceptProposal(int catIndex, int index, context) async {
        String userID = itemList.value[catIndex].itemList![index].receiveProposalId!;
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
                          "propsal_id": userID,
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        showSuccessSnackBar(data["message"], context);
                        // getAllUsersAPI();
                      Text("success");  
                      }else if(response.statusCode == 410){
                         showSnackBar(data["message"], context);
                      }else{
                      Text("Failed");
                      }
                      print(data);
                      
                    }

  rejectProposal(int catIndex, int index, context)async {
    String userID = itemList.value[catIndex].itemList![index].receiveProposalId!;
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
                          "propsal_id": userID,
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        showSuccessSnackBar(data["message"], context);
                        // getAllUsersAPI();
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                        
                      }else{
                      Text("Failed");
                      }
                      print(data);
                      
                    }

   

  fetchMyDetailedPage() async {
    DetailedPage.value = true;
    final url = Uri.parse("${URL}auth/myprofile");
    print(url);

    final response =
        await http.get(Uri.parse(url.toString()), headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8',
      'x-access-token':
          appPreference.accessToken!
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if (response.statusCode == 200) {
      // if(religion.value == true && communication.value == true && permenent.value == true
      //  && carrier.value == true && personal.value == true && jathagam.value == true && family.value == true){
      //     percent.value = 70;
      //     }else if(communication.value == true){
      //     percent.value = 20;
      //     }else if(permenent.value == true){
      //     percent.value = 30;
      //     }else if(carrier.value == true){
      //     percent.value = 40;
      //     }else if(personal.value == true){
      //     percent.value = 50;
      //     }else if(jathagam.value == true){
      //     percent.value = 60;
      //     }else if(family.value == true){
      //     percent.value = 10;
      //     }else if(basic.value == true){
      //     percent.value = 80;
      //     }else if(imageadded.value == true){
      //     percent.value = 90;
      //     }else if(horoscopic.value == true){
      //     percent.value = 100;
      //     }else{
      //       percent.value = 10;
      //     }
      //     print(percent.value);
      name.value = "${body['data']['customerDetails']["personal_details"]["first_name"] ?? ""}";
      name1.value = "${body['data']['customerDetails']["personal_details"]["last_name"] ?? ""}";
      profileattachemnts.value = "${body['data'] != null && body['data']['customerDetails'] != null && body['data']['customerDetails']["attachments"]!.length != 0 ? body['data']['customerDetails']["attachments"]![0]["url"] : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}";
      customer.value = "${body['data']['customerDetails']["customer_id"] ?? ""}";
      memeber.value = "${body['data']['customerDetails']["member_type"] ?? ""}";
      religion.value = body['data']['customerDetails']["isCompletedReligion"];
      print(religion.value);
      communication.value = body['data']['customerDetails']["isCompletedCommunication"];
      permenent.value = body['data']['customerDetails']["isCompletedPermanent"];
      carrier.value = body['data']['customerDetails']["isCompletedCarrierWorking"];
      personal.value = body['data']['customerDetails']["isCompletedPersonal"];
      jathagam.value = body['data']['customerDetails']["isCompletedJathagam"];
      family.value = body['data']['customerDetails']["isCompletedFamily"];
      basic.value = body['data']['customerDetails']["isCompletedBasic"];
      imageadded.value = body['data']['customerDetails']["isProfileImageAdded"];
      horoscopic.value = body['data']['customerDetails']["isHoroscopeAdded"];
      
if (religion.value == true) {
  completedFields++;
}

if (communication.value == true) {
  completedFields++;
}

if (permenent.value == true) {
  completedFields++;
}

if (carrier.value == true) {
  completedFields++;
}

if (personal.value == true) {
  completedFields++;
}

if (jathagam.value == true) {
  completedFields++;
}

if (family.value == true) {
  completedFields++;
}

if (basic.value == true) {
  completedFields++;
}

if (imageadded.value == true) {
  completedFields++;
}

if (horoscopic.value == true) {
  completedFields++;
}
// double percentage = (completedFields / 10.0) * 100.0;

// Update the percent value
double percentage = (completedFields / 10.0) * 100.0;
if (percentage >= 100.0) {
  percent.value = 100;
} else if (percentage >= 90.0) {
  percent.value = 90;
}  else if (percentage >= 80.0) {
  percent.value = 80;
} else if (percentage >= 70.0) {
  percent.value = 70;
} else if (percentage >= 60.0) {
  percent.value = 60;
} else if (percentage >= 50.0) {
  percent.value = 50;
} else if (percentage >= 40.0) {
  percent.value = 40;
} else if (percentage >= 30.0) {
  percent.value = 30;
} else if (percentage >= 20.0) {
  percent.value = 20;
} else {
  percent.value = 10;
}
    // if (percent.value > 100) {
    //   percent.value = 80;
    // }
    print(percent.value);
    print(completedFields);
  print(percentage);
      // appPreference.accessToken = body["data"];memeber.value = "";
    // customer.value = "";
      print("balaji");
    }
    print(body);
    DetailedPage.value = false;
    // isLoading.value = false;
    // return body.map<receiviedProprosalModel>((data) => receiviedProprosalModel.fromJson(data)).toList();
    return body;
    
    
  }

}

Card buildButton({
    required onTap,
    required title,
    required text,
    required leadingImage,
  }) {
    return Card(
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            leadingImage,
          ),
        ),
        title: Text(title ?? ""),
        subtitle: Text(text ?? ""),
        trailing: const Icon(
          Icons.keyboard_arrow_right_rounded,
        ),
      ),
    );
  }
