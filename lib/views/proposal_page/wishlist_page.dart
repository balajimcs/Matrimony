import 'package:flutter/services.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:coolicons/coolicons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:thirumanam/controller/received_proposal_controller.dart';
import 'package:thirumanam/controller/wishlist_controller.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/received_proprosal_model.dart';
import 'package:thirumanam/models/wishList_model.dart';
import 'package:thirumanam/preferences/app_preference.dart';
import 'package:thirumanam/resources/app_dimen.dart';
import 'package:thirumanam/resources/app_font.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/views/auth/detailed_page.dart';
import 'package:thirumanam/widget/search_recevied.dart';
import 'package:http/http.dart' as http;
import '../../controller/dashboard_controller.dart';
import '../../controller/search_detailed_filter_controller.dart';
import '../../resources/app_colors.dart';
import '../../utils/api_config.dart';


class WishListReceived extends StatefulWidget {
   @override
  WishListReceivedState createState() => WishListReceivedState();
}

class WishListReceivedState extends State<WishListReceived> {
  List<wishListProprosalModel> books = [];
  String query = '';
  Timer? debouncer;
    TextEditingController SearchController = TextEditingController(text: '');
    final controller = Get.find<WishListController>();
    final AppPreference appPreference = Get.find();
    final controller1 = Get.find<DashboardController>();
    final wishcontroller = Get.find<WishListController>();
    
    List<ProposalProfileModel>? dataModel;
 
  @override
  void initState(){
    super.initState();
    controller.fetchWishListProposal();
  }
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
                                      )),
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to previous screen instead of closing the app
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
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
            "WishList",
            style: TextStyle(
                color: AppColors.white,
                fontSize: AppDimen.appbarTitle,
                fontFamily: AppFont.font),
          ),
        ),
        drawer: buildNavigationDrawer(context),
        body: RefreshIndicator(
           color: Colors.white,
    backgroundColor: Colors.orangeAccent,
    displacement: 200,
    strokeWidth: 4,
    triggerMode: RefreshIndicatorTriggerMode.onEdge,
          onRefresh: () { 
              
            return controller.fetchWishListProposal();
              
           },
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*4/7,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF134FAF), Colors.black],
                    ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/7.7),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white.withOpacity(0.9)
                ),
              ),
             
               Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
            width: 350,
            height: 40,
            decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: TextField(
                                    
                                     controller: controller.searchController,
                                 onChanged: (v) {
                              if (controller.timer?.isActive ?? false)
                                controller.timer?.cancel();
                              controller.timer = Timer(
                                  const Duration(
                                      seconds: 1),
                                      () {
                                    controller.fetchWishListProposal();
                                  });
                            },
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color: Color(0xFF134FAF),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: controller.searchController.clear,
                                        ),
                                        hintText: 'Search Proposal',
                                        hintStyle: TextStyle(color: Color(0xFF134FAF)),
                                        border: InputBorder.none),
                                  ),
            ),
          ),
        
                  ],
                )
              ),
        
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  // margin: EdgeInsets.only(bottom: 100),
            child: StreamBuilder<List<wishListProprosalModel>>(
              stream: controller.getFilteredModel(),
              initialData: [],
              builder: (context, snapshot){
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
              
              List<wishListProprosalModel> foodList = snapshot.data!
                              .where((item) =>
                item.firstName.toLowerCase().contains(controller.searchController.text.toLowerCase()) || 
                item.lastName.toLowerCase().contains(controller.searchController.text.toLowerCase()))
            .toList();
              print(foodList);
              print("foodList");
              return foodList.length == 0 ? Container(child: Center(child: Text("You didn't add any wishlist", style: TextStyle(fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.grey),),),): 
              
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: foodList.length,
                // physics: ScrollPhysics(),
                // shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  var food = foodList[index];
                  String convertToAgo(DateTime input) {
      Duration diff = DateTime.now().difference(input);
    
      if (diff.inDays >= 1) {
        return '${diff.inDays} day(s) ago';
      } else if (diff.inHours >= 1) {
        return '${diff.inHours} hour(s) ago';
      } else if (diff.inMinutes >= 1) {
        return '${diff.inMinutes} minute(s) ago';
      } else if (diff.inSeconds >= 1) {
        return '${diff.inSeconds} second(s) ago';
      } else {
        return 'just now';
      }
      }
    
      DateTime time1 = DateTime.parse("${food.time}");
                return  
                  InkWell(
                    onTap: (){
                      Navigator.push(  
      context,  
      MaterialPageRoute(builder: (context) => DetailPage(idMatch: food.userId,)));
                    },
                    child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25, left: 13, right: 13),
                      child: Card(
                           elevation: 50,
                              shadowColor: Colors.white,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: SizedBox(
                            width: 380,
                            height: 120,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                              // height: 80,  
                                child: Row(
                                  
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 18, left: 10),
                                      child: CircleAvatar(
                              // backgroundColor: Colors.black,
                              radius: 30,
                              child: CircleAvatar(
                                radius: 30,
                               backgroundImage: NetworkImage("${food.attachements != null && food.attachements?.length != 0 ? food.attachements![0].url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}"))),
                                    ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 22, left: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("${food.firstName} ${food.lastName}",  overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),)),
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text("Age ${food.age.toInt()}", style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.bold, fontFamily: "Raleway"),)),
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(convertToAgo(time1), style: TextStyle(fontSize: 13,color: Colors.grey, fontWeight: FontWeight.bold, fontFamily: "Raleway"),)),
                                          ],
                                        ),
                                    ),
                                  ),
                                  
                                 Spacer(),
                                  Padding(
                                    
                                    padding: const EdgeInsets.only(top: 4, right: 10),
                                    child: Container(
                                      
                                      child: InkWell(
                                          onTap: (){
                                            print("object");
                                          },
                                          child: IconButton(onPressed: (){
                                             print("aa");
                                             Dialogs.materialDialog(
                                      useSafeArea: true,
                                      msg: "WishList",
                                      msgStyle: TextStyle(fontFamily: "Raleway",
                                                          fontWeight: FontWeight.w500,
                                                          color: Color(0xFF134FAF), fontSize: 25),
                                      color: Color(0xffEAF12D),
                                      context: context,
                                      dialogWidth: kIsWeb ? 0.3 : null,
                                      onClose: (value) =>
                                          print("returned value is '$value'"),
                                      actions: [
                                        SizedBox(
                                            height: 120,
                                            child: SingleChildScrollView(
                                              child: Column(children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  child: Text("Did you want to remove the wishlist", textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black, fontSize: 17),),
                                                ),
                                                 SizedBox(
                                                  height: 25,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 50),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              primary: Color(0xFF134FAF),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(10))),
                                                            ),
                                                            child: Text("Cancel"),
                                                            onPressed: (){
                                                            
                                                             Navigator.pop(context);
                                                              
                                                              
                                                             
                                                              // fetchWishListProposal("");
                                                            },
                                                          ),
                                                            SizedBox(width: 35),
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              primary: Color(0xFF134FAF),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(10))),
                                                            ),
                                                            child: Text("Okay"),
                                                            onPressed: (){
                                                             
                                             controller.removeWishListProposal(food.id, context);
                                                        print(controller.removeWishListProposal(food.id, context));
                                                              
             
                                                                 
                                                              Navigator.pop(context);
                                                              
                                                              
                                                             
                                                              // fetchWishListProposal("");
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                            ))
                                      ]);
                                                 
                                                }, icon: Image.asset("assets/icons/Romance.png", ),iconSize: 65, )
                                                
                                                
                                              
                                          ),
                                    ),
                                      ),
                                  
                                  
                                  
                             
                                  
                                  ],
                                ),
                              ),
                            ),
                          ),
                        
                      ),
                    ),
                              
                                ),
                  );
              }); 
               }
                          }
            
              }
        
              
            )),
              )
            ],
          ),
        ),
        
      ),
    );
    
  }
}