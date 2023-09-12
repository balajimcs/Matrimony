import 'dart:convert';
import 'dart:io';
import 'package:getwidget/components/dropdown/gf_multiselect.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:multiselect/multiselect.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:thirumanam/controller/address_register_controller.dart';
import 'package:thirumanam/controller/carrier_deatils_controller.dart';
import 'package:thirumanam/controller/detailed_page_controller.dart';
import 'package:thirumanam/controller/dropdown_controller.dart';
import 'package:thirumanam/controller/family_details_controller.dart';
import 'package:thirumanam/controller/post_feed_controller.dart';
import 'package:thirumanam/controller/update_controllers/carrier_update.dart';
import 'package:thirumanam/controller/update_controllers/jathagam_update.dart';
import 'package:thirumanam/controller/update_controllers/personal_update.dart';
import 'package:thirumanam/models/data_model.dart';
import 'package:thirumanam/models/my_post_feed_model.dart';
import 'package:thirumanam/preferences/app_preference.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/views/auth/my_profile_page.dart';
import 'package:thirumanam/views/profile/commons/my_info.dart';
import 'package:thirumanam/views/profile/commons/opaque_image.dart';
import 'package:thirumanam/views/profile/commons/profile_info_card.dart';
import 'package:thirumanam/views/profile/commons/radial_progress.dart';
import 'package:thirumanam/views/profile/commons/rounded_image.dart';
import 'package:thirumanam/views/profile/styleguide/text_style.dart';

import '../../controller/communication_register.dart';
import '../../controller/dashboard_controller.dart';
import '../../controller/jathagam_details_controller.dart';
import '../../controller/personal_details_controller.dart';
import '../../controller/stepper_register_controller.dart';
import '../../controller/update_controllers/address_update.dart';
import '../../controller/update_controllers/communication_update.dart';
import '../../controller/update_controllers/family_update.dart';
import '../../controller/update_controllers/horoscopic_controller.dart';
import '../../controller/update_controllers/permement_address_update.dart';

class MyPostFeed extends StatefulWidget {
  @override
  State<MyPostFeed> createState() => MyPostFeedState();
}

class MyPostFeedState extends State<MyPostFeed> {
  final AppPreference appPreference = Get.find();
  final controller = Get.find<PostFeedController>();
  final controller1 = Get.find<DashboardController>();
   @override
  void initState(){
    super.initState();
    controller.fetchMyPostFeed();
  }
  @override
  Widget build(BuildContext context) {
    
      final screenHeight = MediaQuery.of(context).size.height;
     return Scaffold(
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
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.5),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white.withOpacity(0.9)),
          ),
          Positioned(
            top: 20,
            left: 5,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                Text(
                  'my_post'.tr,
                  style: TextStyle(
                      color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90, left: 20),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                             
                            },
                            child: RadialProgress(
                              width: 4,
                              progressColor: Color(0xfff79c4f),
                              goalCompleted: 0.9,
                              child: ClipOval(
      child: Image(image:NetworkImage(controller1.profileattachemnts.value,
        ),
        width: 80,
        height: 80,
        fit: BoxFit.fill,
      ),
    ),
                              
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 15, left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${controller1.name.value} ${controller1.name1.value}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
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
                                      Text(
                                        "50 %",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                LinearPercentIndicator(
                                  width: 200,
                                  animation: true,
                                  lineHeight: 15.0,
                                  barRadius: Radius.circular(25),
                                  animationDuration: 2500,
                                  percent: 50 / 100,
                                  center: Text(
                                    "50.0%",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Color(0xfff79c4f),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


            Padding(
            padding: const EdgeInsets.only(top: 230),
            child: Container(
              child: StreamBuilder<List<myPostFeedModel>>(
                  
                  stream: controller.getMyPostModel(),
                   initialData: [],
                  builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.done) {
                            // print(snapshot.data);
                          }
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(
                                child: Center(
                                  child: Container(
                                      height: 80,
                                      width: 80,
                                      alignment: AlignmentDirectional.center,
                                      child: Lottie.asset(
                                        "assets/loading/heart.json",
                                      )),
                                ),
                              );
                            default:
                              if (snapshot.hasError) {
                                return Center(child: Text('some_error'.tr));
                              } else {
                                print("snapshot.data");
                                print(snapshot.data);
      
                  var foodList = snapshot.data;
                  print(foodList);
                  print("foodList");
                return  foodList!.length == 0
                                  ? Container(
                                      child: Center(
                                        child: Text('my_post_didnt'.tr,  style: TextStyle(fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.grey),),
                                      ),
                                    )
                                  : ListView.builder(
                    itemCount: foodList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var food = foodList[index];
                       var count = food.liked!.length;
                       print("aaaaaaaa: ${count}"); 
      
                       String convertToAgo(DateTime input) {
          Duration diff = DateTime.now().difference(input);
      
          if (diff.inDays >= 1) {
        return '${diff.inDays} day ago';
          } else if (diff.inHours >= 1) {
        return '${diff.inHours} hour ago';
          } else if (diff.inMinutes >= 1) {
        return '${diff.inMinutes} minute ago';
          } else if (diff.inSeconds >= 1) {
        return '${diff.inSeconds} second ago';
          } else {
        return 'just now';
          }
        }
        DateFormat format = DateFormat("yyyy-MM-dd");
        DateTime time1 = format.parse("${food.time}");
        print(time1);
        // print("${food.customerDetails![0].userAttachements!.length != 0 ? food.customerDetails![0].userAttachements![0].url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}");
                        return InkWell(
                          onTap: (){
                            Navigator.push(  
          context,  
          MaterialPageRoute(builder: (context) => MyDetailPage()));
                          },
                          child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 50,
                            shadowColor: Colors.white,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: SizedBox(
                              width: 380,
                              height: 500,
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20, right: 20),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: CircleAvatar(
                                                radius: 25,
                                                backgroundImage: NetworkImage(
                                                    controller1.profileattachemnts.value)),
                                          // && food.customerDetails![0].userAttachements!.length != 0
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20, right: 180),
                                          child:  Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  // food.attachements![0].attachement_type
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    maxLines: 2, 
                                                    '${controller1.name.value} ${controller1.name1.value}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),)),
                                                  SizedBox(height: 7,),
                                                Row(
                                                  children: [
                                                    Text(convertToAgo(time1), style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),),
                                                    
                                                    
                                        
                                                  ],
                                                ),
                                                
                                              ],
                                            ),
                                          ),
                                        
                                         
                                      ],
                                    ),
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 23, right: 23),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                strutStyle: StrutStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: "Raleway"),
                                                text: TextSpan(
                                                    style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Raleway",
                                          color: Colors.black),
                                                    text: "${food.content != null ? food.content : ""}"),
                                              ),
                              ),
                            ),
                                      
                                  //  Text(convertToAgo(time1), style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: InkWell(
                                      onTap: (){
                                         Dialogs.materialDialog(
                                              color: Colors.white,
                                              context: context,
                                              dialogWidth: kIsWeb ? 0.3 : null,
                                              onClose: (value) => print(
                                                  "returned value is '$value'"),
                                              actions: [
                                                SizedBox(
                                                  height: 300,
                                                  child: Container(
                                                            
                                                            width: double.infinity,
                                                            height: 250.0,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(25.0),
                                                              
                                                              image: DecorationImage(
                                                                image: NetworkImage('${food.attachements != null && food.attachements!.length != 0 ? food.attachements![0].attachement_url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}'),
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                              ),
                                                  )]);
      //                                       PopupBanner(
                                          
      //                                         height: 300,
                                          
      //   context: context,
      //   images: [
      //    '${food.attachements!.length != 0 ? food.attachements![0].attachement_url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}'
      //   ],
      //   dotsAlignment: Alignment.bottomCenter,
        
      //   dotsColorActive: Colors.blue,
      //   dotsColorInactive: Colors.grey.withOpacity(0.5),
      //   onClick: (index) {
      //     debugPrint("CLICKED $index");
      //   },
      // ).show();
                                      },
                                      child: Container(
                                                            margin: EdgeInsets.all(10.0),
                                                            width: double.infinity,
                                                            height: 250.0,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(25.0),
                                                              
                                                              image: DecorationImage(
                                                                image: NetworkImage('${food.attachements != null && food.attachements!.length != 0 ? food.attachements![0].attachement_url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}'),
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                              ),
                                    ),
                                  ),
                                          
                        
                                  // Padding(
                                  //   padding: const EdgeInsets.only(bottom: 10),
                                  //   child: Align(
                                  //     alignment: Alignment.centerLeft,
                                  //     child: Text("content", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),)),
                                  // ),
                                  
                                //                       Padding(
                                //                         padding: const EdgeInsets.only(bottom: 40),
                                //                         child: Container(
                                //                           decoration: BoxDecoration(
                                //                             borderRadius: BorderRadius.all(Radius.circular(50)),
                                //                           ),
                                //   height: 300,
                                //   width: 320,
                                //   child: Image(image: NetworkImage("${
                                //     food.attachements! == 0 ? Container(child: Center(child: Text("Proposal didn't add any images", style: TextStyle(fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.grey),),),):
                                //     food.attachements![0].attachement_url }")),
                                //   // child: PageView(
                                    
                                //   //   children: _demo,
                                    
                                //   //   onPageChanged: (index){
                                //   //       setState(() {
                                //   //         pageIndex=index;
                                //   //       });
                                //   //   },
                                //   // ),
                                // ),
                                //                       ),
                                // CarouselIndicator(
                                //   color: Colors.blue,
                                //   activeColor: Colors.black,
                                //   count: _demo.length,
                                //   index: pageIndex,
                                // ),
                                
                                Padding(
                                  padding: const EdgeInsets.only(top:25), 
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                        Row(
                                          children: [
                                            Padding(
                          padding: const EdgeInsets.only(left: 25, top:10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child:Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                   controller.addLike(food.id, context);
                                  },
                                  child: Icon(CupertinoIcons.hand_thumbsup_fill, color: Color(0xFF134FAF),)
                                ),
                                SizedBox(width: 5,),
                                Text(count.toString(),style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Raleway",color: Colors.grey ),)
                              // 
                              ],
                            ),
                          ),
                                            ),
                                            SizedBox(width: 140,),
                                            Padding(
                          padding: const EdgeInsets.only(top:10),
                          child:Row(
                            children: [
                              Icon(CupertinoIcons.hand_thumbsup, color: Color(0xFF134FAF),),
                              SizedBox(width: 5,),
                              Text("Liked by ${food.liked!.length != 0 ? food.liked![0].firstName : "😔😔😔"}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Raleway",color: Colors.grey ),),
                            // 
                            ],
                          )),
                                            
                                          ],
                                        )
                                  
                                ],
                              ),
                            ),
                          ),
                          
                                            ),
                        );
                      
                     
                    });
                              }
                          }
                  }
                )
            ),
          ),
        ],
      ),
    );
  }
}
