import 'package:flutter/services.dart';

import 'dart:convert';
import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:coolicons/coolicons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:thirumanam/app_localization.dart';
import 'package:thirumanam/controller/received_proposal_controller.dart';
import 'package:thirumanam/controller/wishlist_controller.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/received_proprosal_model.dart';
import 'package:thirumanam/preferences/app_preference.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/views/auth/detailed_page.dart';
import 'package:thirumanam/views/profile_user/profile_menu.dart';
import 'package:getwidget/getwidget.dart';
import 'package:multiselect/multiselect.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../controller/dashboard_controller.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_dimen.dart';
import '../../resources/app_font.dart';

class ProfileScreen extends StatefulWidget {
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  
  final AppPreference appPreference = Get.find();
  final controller1 = Get.find<DashboardController>();
  final wishcontroller = Get.find<WishListController>();
  final List<String> languages = ['english', 'tamil'];
  final controller2 = Get.find<LocalizationService>();
  buildNavigationDrawer(context) {
    print(controller1.profileattachemnts.value);
    return Drawer(
      
        backgroundColor: Color(0xFF134FAF),
        child: ListView(

            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 270,
                child: Obx(() => controller1.DetailedPage.value ? DrawerHeader(
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
                                  Text('${controller1.name.value} ${controller1.name1.value}',
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
                                      Text('${controller1.customer.value}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Raleway",
                                              color: Colors.white)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("|",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Raleway",
                                              color: Colors.white)),
                                      
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Profile Completed",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Obx(() => controller1.DetailedPage.value ? Container() :
                                      Text(
                                        "${controller1.percent.value} %",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Obx(() => controller1.DetailedPage.value ? Container() :
                                  LinearPercentIndicator(
                                    padding: EdgeInsets.only(right: 10),
                                    width: 200,
                                    animation: true,
                                    lineHeight: 15.0,
                                    barRadius: Radius.circular(25),
                                    animationDuration: 2500,
                                    percent: controller1.percent.value / 100,
                                    center: Text(
                                      "${controller1.percent.value}%",
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
                title: const Text(
                  'Dashboard',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
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
                title: const Text(
                  'Story',
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
                title: const Text(
                  'Chat',
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
                title: const Text(
                  'Sent Proposals',
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
                title: const Text(
                  'Recevied Proposals',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
                  Get.toNamed(RouteNames.receiviedProprosal);
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
                title: const Text(
                  'Logout',
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
  Future<Map<String, dynamic>> fetchMyDetailedPage() async {
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
      
      print("balaji");
    }
    print(body);

    // isLoading.value = false;
    // return body.map<receiviedProprosalModel>((data) => receiviedProprosalModel.fromJson(data)).toList();
    return body;
  }
     void _showPopupMenu() async {
      await showMenu(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xFF134FAF),
        context: context,
        
        position: RelativeRect.fromLTRB(150, 270, 50, 50),
        items: [
          
          PopupMenuItem(
           
            value: 1,
            child: InkWell(
              onTap: (){
                Get.toNamed(RouteNames.basicInfo);
              },
              child: Text('change_ph'.tr, style: TextStyle(
                          color: Colors.white, fontSize: 18, fontFamily: "Raleway"),),
            ),
          ),
          PopupMenuItem(
            
             value: 2,
            child: InkWell(
              onTap: (){
                Get.toNamed(RouteNames.basicEmailInfo);
              },
              child: Text('change_email'.tr,style: TextStyle(
                          color: Colors.white, fontSize: 18, fontFamily: "Raleway"),),
            ),
          ),
          
        ],
        elevation: 8.0,
      ).then((value){

// NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null 


      if(value!=null)
       print(value);

       });
    }
  
  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () async {
        // Navigate to previous screen instead of closing the app
        SystemNavigator.pop();
        return false;
      },
      child: MaterialApp(
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: MyCustomPageTransitionBuilder(),
              TargetPlatform.iOS: MyCustomPageTransitionBuilder(),
            },
          ),
        ),
        home: FutureBuilder<Map<String, dynamic>>(
            future: fetchMyDetailedPage(),
            builder: (context, snapshot) {
              final users = snapshot.data.toString();
      
              // final user = users;
      
              print(users);
      
              // print(snapshot);
      
              if (snapshot.connectionState == ConnectionState.done) {
                // print(snapshot.data);
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child:  Center(
              child: Container(
                  height: 80,
                  width: 80,
                  alignment: AlignmentDirectional.center,
                  child: Image.asset(
                    "assets/images/logo.png",
                  )),
            ),);
                default:
                  if (snapshot.hasError) {
                    return Center(child: Text('Some error occurred!'));
                  } else {
                    print("snapshot.data");
                    print(snapshot.data);
                    return _buildProductCard(snapshot.data);
                  }
              }
            }),
      ),
    );
  }
   Widget _buildProductCard(product) {
    var profile = product["data"] != null && product["data"]['customerDetails'] != null && product["data"]['customerDetails']["attachments"]!.length != 0 ? product["data"]['customerDetails']["attachments"].last : [];
       return Scaffold(
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
        title: Row(
          children: [
            Text(
              "Profile",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: AppDimen.appbarTitle,
                  fontFamily: AppFont.font),
            ),
             SizedBox(width: 20,),
                   SizedBox(
                                              height: 70,
                                              width: 160,
                                              child: DropdownButtonFormField(
                      isExpanded: true,
                      style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Language',
                        // hintText: "aa",
                        enabledBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.white, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white, width: 1.5),
                        ),
                        prefixIcon: Icon(Icons.language, color: Colors.white),
                        
                        filled: true,
                        // fillColor: Colors.white,
                        fillColor: Colors.transparent,
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.white,
                      ),
                      dropdownColor: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                      value: Get.locale?.languageCode,
                      onChanged: (lang) async {
                        controller2.changeLocale(lang!);
                      },
                      items: languages.map<DropdownMenuItem<String>>((String lang) {
                        return DropdownMenuItem(
                         value: lang,
                        child: Text(lang.toUpperCase()),
                        );
                      }).toList(),
                    ),
                                            ),
                  SizedBox(width: 7,),
                  InkWell(
                    onTap: (){
                       Get.toNamed(RouteNames.profile);
                    },
                    child: Row(
                      children: [
                        
                        
                        Text(
                          "Edit",
                          style: TextStyle(
                              color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
                        ),
                        SizedBox(width: 2,),
                        Icon(Icons.mode_edit_rounded, color: Colors.white,),
                      ],
                    ),
                  ),
          ],
        ),
      ),
      drawer: buildNavigationDrawer(context),
      body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 4 / 7,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF134FAF), Colors.black],
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4.0),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white),
            ),
           
            Positioned(
                top: 15,
                left: 20,
                child: Column(
                  children: [
                   Row(
                    children: [
                      Container(

                                                                height: 150,
                                                                width: 140,
                                                                child: ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              29),
                                                                  child: Image(
                                                                    image: NetworkImage(
                                                                        wishcontroller.profilePicUrl.value),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    width: 140,
                                                                    height: 170,
                                                                  ),
                                                                  
                                                                ),
                                                              ),
                                                              SizedBox(width: 20,),
                                                              Padding(
                                                                padding: const EdgeInsets.only(bottom: 10),
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text("${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["first_name"] : "----"} ${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["last_name"] : "----"}",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Raleway",
                                  color: Colors.white)),
                                  SizedBox(height: 15,),
                                  Text("${product['data']['customerDetails'] != null ? product['data']['customerDetails']["member_type"] : ""} Category",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Raleway",
                                  color: Colors.white)),
                                  SizedBox(height: 20,),
                                   InkWell(
                                                                          onTap:
                                                                              () {
                                                                                Get.toNamed(RouteNames.PricingPendingEdit);
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                125,
                                                                            height:
                                                                                35,
                                                                            alignment:
                                                                                Alignment.center,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                                    borderRadius: BorderRadius.all(Radius.circular(
                                                                                        25)),
                                                                                    
                                                                                    gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                                                                                      Color(0xffEAF12D), Color(0xffEAF12D)
                                                                                    ])),
                                                                            child:
                                                                                Text(
                                                                              'upgrade'.tr,
                                                                              style: TextStyle(
                                                                                  fontSize: 14,
                                                                                  fontFamily: "Raleway",
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color: Color(0xFF134FAF)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        
                                                                  ],
                                                                ),
                                                              )
                    ],
                   )
                  
                  ],
                )),
          
      
            Positioned(
              top: 220,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                       
                        InkWell(
                          onTap: (){
                            print("aa");
                            Get.toNamed(RouteNames.basicInfo);
                          },
                          child: ProfileMenu(
                                    text: 'basic_info'.tr,
                                    icon: "assets/icons/Security-Pass_1.svg",
                                    press: () => {
                                     _showPopupMenu()
                                      // Get.toNamed(RouteNames.basicInfo)
                                    }
                                  ),
                        ),
                            ProfileMenu(
                              text: 'privacy'.tr,
                              icon: "assets/icons/Secure_1.svg",
                              press: () {
                                Get.toNamed(RouteNames.privacy);
                              },
                            ),
                            ProfileMenu(
                              text: 'contact'.tr,
                              icon: "assets/icons/Call-male_1.svg",
                              press: () {
                                Get.toNamed(RouteNames.contactUs);
                              },
                            ),
                            ProfileMenu(
                              text: 'account_info'.tr,
                              icon: "assets/icons/User-Account_1.svg",
                              press: () {
                                Get.toNamed(RouteNames.accountInfo);
                              },
                            ),
                            ProfileMenu(
                              text: 'logout'.tr,
                              icon: "assets/images/bell.svg",
                              press: () {
                                appPreference.removePreference();
                    Get.offAllNamed('/login_page');
                              },
                            ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      
    );
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
}




// Dialogs.materialDialog(
//                               useSafeArea: true,
//                                 msg: 'Detailed Filter Search',
//                                 msgStyle: TextStyle(color: Color(0xFF134FAF)),
//                                 // title: "Delete",
//                                 color: Colors.white,
                                
//                                 context: context,
//                                 dialogWidth: kIsWeb ? 0.3 : null,
//                                 onClose: (value) =>
//                                     print("returned value is '$value'"),
//                                 actions: [
//                                   SizedBox(
//                                     height: 500,
//                                     child: SingleChildScrollView(
//                                       child: Column(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.only(bottom: 10, top: 5, right: 180),
//                                             child: Text("Search by ID", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),),
//                                           ),
//                                           TextFormField(
//                     controller: SearchController,
//                     style: TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(10),
//                       fillColor: Colors.grey.withOpacity(0.2),
//                       filled: true,
//                       hintText: "Enter Matrimony ID",
//                       hintStyle: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                       // labelStyle: TextStyle(fontFamily: "nunto"),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none
//                       ),
                    
                     
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: Color(0xFF134FAF),
//                       shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20))),
//                     ),
//                             child: Text("Search"),
//                             onPressed: () {
                              
//                             },
//                           ),
//                    Container(
//                                           margin: EdgeInsets.symmetric(
//                                               vertical: 10),
//                                           child: Row(
//                                             children: <Widget>[
//                                               SizedBox(
//                                                 width: 20,
//                                               ),
//                                               Expanded(
//                                                 child: Padding(
//                                                   padding: EdgeInsets.symmetric(
//                                                       horizontal: 10),
//                                                   child: Divider(
//                                                     thickness: 1,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Text('or'),
//                                               Expanded(
//                                                 child: Padding(
//                                                   padding: EdgeInsets.symmetric(
//                                                       horizontal: 10),
//                                                   child: Divider(
//                                                     thickness: 1,
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 20,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Marital Status',
//                                             items: const [
//                                               'Never Married',
//                                               'Married'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Religion',
//                                             items: const [
//                                               'Hindu',
//                                               'Muslim',
//                                               'Christian'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Mother Tongue',
//                                             items: const [
//                                               'Tamil',
//                                               'Malayalam',
//                                               'Hindi'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Caste',
//                                             items: const [
//                                               'All',
//                                               'Vannar',
//                                               'Kammalar'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Physical Status',
//                                             items: const [
//                                               'Doesn\'t matter',
//                                               'Normal',
//                                               'Physically Challenged'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                            Padding(
//                                             padding: const EdgeInsets.only(bottom: 10, top: 10),
//                                             child: Align(
//                                               alignment: Alignment.centerLeft,
//                                               child: Text("Location Details", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),)),
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Country',
//                                             items: const ['India', 'US', 'Uk'],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
                                          
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'State',
//                                             items: const [
//                                               'TamilNadu',
//                                               'Kerala'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'District',
//                                             items: const [
//                                               'Madurai',
//                                               'Salem',
//                                               'Chennai'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'City',
//                                             items: const [
//                                               'Madurai',
//                                               'Salem',
//                                               'Chennai'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Resident Status',
//                                             items: const [
//                                               'Any',
//                                               'Citizen',
//                                               'Permanent Resident',
//                                               'Work Permit',
//                                               'Student Visa ',
//                                               'Temporary Visa '
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(bottom: 10, top: 10),
//                                             child: Align(
//                                               alignment: Alignment.centerLeft,
//                                               child: Text("Education / Occupation / Annual Income Details", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),)),
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Education',
//                                             items: const [
//                                               'Any',
//                                               'Any Bachelors thirumanam Engineering / Computer',
//                                               'Any Masters thirumanam Engineering / Computer',
//                                               'Any Bachelors thirumanam management',
//                                               'Any masters thirumanam management'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Employed In',
//                                             items: const [
//                                               'All',
//                                               'Government / PSU',
//                                               'private',
//                                               'Business',
//                                               'Defence',
//                                               'Self Employed',
//                                               'Not  Working'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Occupation',
//                                             items: const [
//                                               'Any',
//                                               'Administration',
//                                               'Agriculture',
//                                               'Airline',
//                                               'Banking & Finance'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Annual Income',
//                                             items: const [
//                                               '100000',
//                                               '200000',
//                                               '300000 ',
//                                               '400000',
//                                               '500000',
//                                               '600000',
//                                               '700000',
//                                               '800000',
//                                               '900000',
//                                               '1000000'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                            Padding(
//                                             padding: const EdgeInsets.only(bottom: 10, top: 10),
//                                             child: Align(
//                                               alignment: Alignment.centerLeft,
//                                               child: Text("Horoscope Details", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),)),
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Star',
//                                             items: const ['Any'],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Chevvai Dosham',
//                                             items: const [
//                                               'Yes',
//                                               'No',
//                                               'Doesn’t Matter'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(bottom: 10, top: 5, right: 220),
//                                             child: Text("Habits", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),),
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Eating habits',
//                                             items: const [
//                                               'Any',
//                                               'vegetarian',
//                                               'Non-vegetarian',
//                                               'Eggetarian'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Drinking',
//                                             items: const [
//                                               'Any',
//                                               'Non-drinker',
//                                               'light/social drinker',
//                                               'Regular drinker'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Smoking',
//                                             items: const [
//                                               'Any',
//                                               'Non-smoker',
//                                               'light/social smoker',
//                                               'Regular smoker'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                   //                         Padding(
//                   //                           padding: const EdgeInsets.only(bottom: 10, top: 10),
//                   //                           child: Align(
//                   //                             alignment: Alignment.centerLeft,
//                   //                             child: Text("Search using keywords", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),)),
//                   //                         ),
//                   //                          Padding(
//                   //                           padding: const EdgeInsets.only(bottom: 10),
//                   //                           child: Align(
//                   //                             alignment: Alignment.centerLeft,
//                   //                             child: Text("keywords are searched against the profile description of a member", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.black),)),
//                   //                         ),
//                   //                         TextFormField(
//                   //   controller: SearchController,
//                   //   style: TextStyle(color: Colors.black),
//                   //   decoration: InputDecoration(
//                   //     contentPadding: EdgeInsets.only(right: 10, left: 10),
//                   //     fillColor: Colors.grey.withOpacity(0.2),
//                   //     filled: true,
//                   //     hintText: "Enter Keywords",
//                   //     hintStyle: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                   //     // labelStyle: TextStyle(fontFamily: "nunto"),
//                   //     border: OutlineInputBorder(
//                   //       borderRadius: BorderRadius.circular(10),
//                   //       borderSide: BorderSide.none
//                   //     ),
                    
                     
//                   //   ),
//                   // ),
//                   //                         DropDownMultiSelect(
                                              
//                   //                             decoration: InputDecoration(
//                   //                               contentPadding: EdgeInsets.only(right: 10, left: 10),
//                   //                               filled: true,
//                   //                               hintText: 'Select profile',
//                   //                             hintStyle: TextStyle(color: Colors.grey),
//                   //                               border: OutlineInputBorder(

//                   //       borderRadius: BorderRadius.circular(10),
//                   //       borderSide: BorderSide.none
//                   //     ),
                      
//                   //                               fillColor:
//                   //                                 Colors.grey.withOpacity(0.2),
//                   //                                 suffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,size: 18,)
//                   //                             ),
//                   //                             onChanged: (List<String> x) {
//                   //                               setState(() {
//                   //                                 selected = x;
//                   //                               });
//                   //                             },
//                   //                             options: ['With photo', 'With Horoscope', 'Online right now', 'Premium members'],
//                   //                             selectedValues: selected,
//                   //                             whenEmpty: '',
                                              
                                              
//                   //                           ),
                                          
//                   //                         Align(
//                   //                             alignment: Alignment.topCenter,
//                   //                             child: DropDownMultiSelect(
                                                    
//                   //                                   decoration: InputDecoration(
//                   //                                     contentPadding: EdgeInsets.only(right: 10, left: 10),
//                   //                                     filled: true,
//                   //                                     hintText: 'Select don\'t show',
//                   //                                   hintStyle: TextStyle(color: Colors.grey),
//                   //                                     border: OutlineInputBorder(
                                            
//                   //                                                   borderRadius: BorderRadius.circular(10),
//                   //                                                   borderSide: BorderSide.none
//                   //                                                 ),
                                                                  
//                   //                                     fillColor:
//                   //                                       Colors.grey.withOpacity(0.2),
//                   //                                       suffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,size: 18,)
//                   //                                   ),
//                   //                                   onChanged: (List<String> x) {
//                   //                                     setState(() {
//                   //                                       selected = x;
//                   //                                     });
//                   //                                   },
//                   //                                   options: ['Ignored Profiles', 'Profiles already contacted', 'Viewed Profile', 'Shortlisted profiles'],
//                   //                                   selectedValues: selected,
//                   //                                   whenEmpty: '',
                                                    
                                                    
//                   //                                 ),
//                   //                           ),
                                          
                                          
//                                              SizedBox(height: 10,),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: Color(0xFF134FAF),
//                       shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20))),
//                     ),
//                             child: Text("Search"),
//                             onPressed: () {
                              
//                             },
//                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ]);



class RazorpayOrderResponse {
/*
{
  "id": "order_HqIiXEtwbi6Cge",
  "entity": "order",
  "amount": 4000,
  "amount_paid": 0,
  "amount_due": 4000,
  "currency": "INR",
  "receipt": "1",
  "offer_id": null,
  "status": "created",
  "attempts": 0,
  "notes": [
    null
  ],
  "created_at": 1630084475
}
*/
 
  String? id;
  String? entity;
  int? amount;
  int? amountPaid;
  int? amountDue;
  String? currency;
  String? receipt;
  String? offerId;
  String? status;
  int? attempts;
  int? createdAt;
 
  RazorpayOrderResponse({
    this.id,
    this.entity,
    this.amount,
    this.amountPaid,
    this.amountDue,
    this.currency,
    this.receipt,
    this.offerId,
    this.status,
    this.attempts,
    this.createdAt,
  });
  RazorpayOrderResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    entity = json["entity"]?.toString();
    amount = json["amount"]?.toInt();
    amountPaid = json["amount_paid"]?.toInt();
    amountDue = json["amount_due"]?.toInt();
    currency = json["currency"]?.toString();
    receipt = json["receipt"]?.toString();
    offerId = json["offer_id"]?.toString();
    status = json["status"]?.toString();
    attempts = json["attempts"]?.toInt();
    createdAt = json["created_at"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["entity"] = entity;
    data["amount"] = amount;
    data["amount_paid"] = amountPaid;
    data["amount_due"] = amountDue;
    data["currency"] = currency;
    data["receipt"] = receipt;
    data["offer_id"] = offerId;
    data["status"] = status;
    data["attempts"] = attempts;
    data["created_at"] = createdAt;
    return data;
  }
}