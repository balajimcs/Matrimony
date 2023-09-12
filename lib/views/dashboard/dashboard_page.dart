import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_version_checker/flutter_app_version_checker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:thirumanam/controller/dashboard_controller.dart';
import 'package:thirumanam/controller/wishlist_controller.dart';
import 'package:thirumanam/preferences/app_preference.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/resources/app_dimen.dart';
import 'package:thirumanam/resources/app_font.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/widget/home_profile_cards.dart';

import '../../controller/update_app_controller.dart';

class DashboradPage extends StatefulWidget {
  State<DashboradPage> createState() => DashboradPageState();
}

class DashboradPageState extends State<DashboradPage> {
  final AppPreference appPreference = Get.find();
  final controller = Get.find<DashboardController>();
  final wishcontroller = Get.find<WishListController>();

  // final controller1 = Get.find<UpdateAppController>();
  @override
  void initState(){
    checkVersion();
    // controller1.getProfile();
    super.initState();
  }
  
    
      

    
  
  
  void checkVersion() async {
     http.get(
      RestApiClient().updateApp
    ).then((value) {
      Map<String, dynamic> res = jsonDecode(value.body);
      print("getupdate Response: ${res.toString()}");
      if (res != null) {
        print(res['data']['check_error']);
      print(res['data']['button_one']);
      print(res['data']['button_two']);
      print(res['data']['button_one_name']);
      print(res['data']['button_two_name']);
      print(res['data']['Title']);
      print(res['data']['Message']);
        if(res['data']['check_error'] == true){
      print("deva");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          
           barrierDismissible: false, 
          context: context,
          builder: (BuildContext context) {
            
            return GestureDetector(
                onTap: (){
            
                },
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
                  title: Text('${res['data']['Title']}' ,style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18)),
                  content: Text('${res['data']['Message']}' ,style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 14)),
                  actions: [
                   Container(
                    
                      child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                                height: 500,
                                width: 600,
                                alignment: AlignmentDirectional.center,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Lottie.asset(
                                        "assets/loading/updateapp.json",
                                      ),
                                    ),
                                    
                                    
                                   
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30, left: 35),
                                      child:  Row(
                        children: [
                          if(res['data']['button_one'] == true)...[
                            Center(
                              child: InkWell(
                              onTap: (){
                                Get.back();
                                // launchPlayStore(value.appURL.toString());
                              },
                              child: Center(
                                child: Container(
                                            width: 100,
                                            padding: EdgeInsets.symmetric(vertical: 13),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                              border: Border.all(color: Color(0xFF134FAF), width: 2),
                                              color: Colors.white
                                            ),
                                            child: Text(
                                              '${res['data']['button_one_name']}',style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 15),
                                            ),
                                ),
                              ),
                          ),
                            ),
                          ]else...[
                            Container(),
                          ],
                          
                          SizedBox(width: 30,),
                          if(res['data']['button_two'] == true)...[
                            InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Center(
                              child: Container(
                                          width: 100,
                                          padding: EdgeInsets.symmetric(vertical: 13),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            border: Border.all(color: Color(0xFF134FAF), width: 2),
                                            color: Colors.white
                                          ),
                                          child: Text(
                                            '${res['data']['button_two_name']}',style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 15),
                                          ),
                              ),
                            ),
                          ),
                          ]else...[
                            Container(),
                          ],
                          
                        ],
                      ),
                    ),
                  
                                    
                                  ],
                                )
                                
                                ),
                                
                    ),
                      
                      
                    ),
                  ],
                ),
              );
          },
          
      );
      });
      
  
    }else{
      print("TamilViavaham");
    }


      }});
    
    
  }

   getProfile() {
    http.get(
      RestApiClient().detailedPage,
      headers: {
        // appPreference.accessToken!
        "x-access-token": appPreference.accessToken!
      },
    ).then((value) {
      Map<String, dynamic> res = jsonDecode(value.body);
      print("getProfile Response: ${res.toString()}");
      if (res != null) {
        appPreference.userId = res["data"]["customerDetails"]["user_obj_id"];
        Get.toNamed(RouteNames.homePage);
      }
    });
  }
  buildNavigationDrawer(context) {
    print(controller.profileattachemnts.value);
    return Drawer(
      
        backgroundColor: Color(0xFF134FAF),
        child: ListView(

            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 270,
                child: Obx(() => controller.DetailedPage.value ? DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color(0xFF134FAF),
                      ),
                      child: Column(
                        children: [
                          Text("data")
                        ]),
                      ) : 
                   DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color(0xFF134FAF),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(29),
                                      child: Image(
                                        image: NetworkImage(
                                            wishcontroller.profilePicUrl.value),
                                        fit: BoxFit.cover,
                                        width: 140,
                                        height: 170,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('${controller.name.value} ${controller.name1.value}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Raleway",
                                          color: Colors.white)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text('${controller.customer.value}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Raleway",
                                              color: Colors.white)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'profile_completed'.tr,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Obx(() => controller.DetailedPage.value ? Container() :
                                      Text(
                                        "${controller.percent.value} %",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Obx(() => controller.DetailedPage.value ? Container() :
                                    LinearPercentIndicator(
                                      padding: EdgeInsets.only(right: 10),
                                      width: 200,
                                      animation: true,
                                      lineHeight: 15.0,
                                      barRadius: Radius.circular(25),
                                      animationDuration: 2500,
                                      percent: controller.percent.value / 100,
                                      center: Text(
                                        "${controller.percent.value}%",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      linearStrokeCap: LinearStrokeCap.roundAll,
                                      progressColor: Color(0xffEAF12D),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [],
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
              Container(
                height: 3,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 25,
                ),
                title: Text(
                  'dashboard'.tr,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
                  getProfile();
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              ListTile(
                leading: Icon(
                  Icons.photo,
                  color: Colors.white,
                  size: 25,
                ),
                title: Text(
                  'story'.tr,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
                  Get.toNamed(RouteNames.storyPost);
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              ListTile(
                leading: Icon(
                  Icons.chat,
                  color: Colors.white,
                  size: 25,
                ),
                title: Text(
                  'chat'.tr,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
                  Get.toNamed(RouteNames.chat);
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              ListTile(
                leading: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 25,
                ),
                title: Text(
                  'sent_proposal'.tr,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
                  Get.toNamed(RouteNames.sendProposal);
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              ListTile(
                leading: Icon(
                  Icons.person_add,
                  color: Colors.white,
                  size: 25,
                ),
                title: Text(
                  'recevied_proposal'.tr,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
                  
                  Get.toNamed(RouteNames.receiviedProprosal);
    //            
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              ListTile(
                leading: Icon(
                  Icons.list,
                  color: Colors.white,
                  size: 25,
                ),
                title: Text(
                  'Connected Peoples',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
                  Get.toNamed(RouteNames.connectedPeoples);
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              ListTile(
                leading: Icon(
                  Icons.list,
                  color: Colors.white,
                  size: 25,
                ),
                title: Text(
                  'Proposal',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
                  Get.toNamed(RouteNames.detailedFilter);
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 25,
                ),
                title: Text(
                  'logout'.tr,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
                 
                  // Get.toNamed(RouteNames.login);
                  appPreference.removePreference();
                  Get.offAllNamed('/login_page');
                },  
              ),
              Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
            ]));
  }

  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to previous screen instead of closing the app
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        appBar: AppBar(
          // leading: Icon(
          //   Icons.menu,
          //   color: AppColors.white,
          // ),
          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF134FAF), Color(0xFF134FAF)]),
            ),
          ),
          // backgroundColor: AppColors.primaryColor,
          elevation: 0,
          title: Text(
            'find_partner'.tr,
            style: TextStyle(
                color: AppColors.white,
                fontSize: AppDimen.appbarTitle,
                fontFamily: AppFont.font),
          ),
        ),
        drawer: buildNavigationDrawer(context),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
    
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 300,
                  padding: EdgeInsets.symmetric(horizontal: AppDimen.screenPadding,
                  vertical: 20),
                  // color: AppColors.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Get.toNamed(RouteNames.search),
                        child: Container(
                            // padding: const EdgeInsets.only(right: 8, left: 8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffdcdcdc)),
                                color: const Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top:14),
                              hintText: "Search for Partner",
                              hintStyle: TextStyle(color: Colors.grey),
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    left: 0, right: 0, top: 3),
                                child: Icon(Icons.search,
                                    color: Colors.grey),
                              ),
                            ),
                          )
                        ),
                      ),
                      SizedBox(height: 16,),
                    ],
                  ),
                ),
                Obx(() => Column(
                  children: [
    
                    controller.isLoading.value ?
                    Center(
                      child: Container(
                          height: 80,
                          width: 80,
                          alignment: AlignmentDirectional.center,
                          child: Lottie.asset(
                            "assets/loading/heart.json",
                          )),
                    )
                        : Column(
                      children: [
                        for(int i = 0; i< controller.itemList.length ;i++)
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: HomeProfileCard(
                              title: controller.itemList[i].title,
                              // title: controller.allUserModel.value.data![i].personalDetails?.firstName,
                              dataModel: controller.itemList[i].itemList,
                              controller: controller,
                              catIndex: i,
                              onViewAllClicked: () => Get.toNamed(RouteNames.search),
                            ),
                          )
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
