import 'dart:async';
import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:coolicons/coolicons.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:like_button/like_button.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multiselect/multiselect.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:thirumanam/controller/connected_people_controller.dart';
import 'package:thirumanam/controller/detailed_filter_controller.dart';
import 'package:thirumanam/controller/post_feed_controller.dart';
import 'package:thirumanam/controller/received_proposal_controller.dart';
import 'package:thirumanam/controller/search_controller.dart';
import 'package:thirumanam/controller/search_controller.dart';
import 'package:thirumanam/controller/search_controller.dart';
import 'package:thirumanam/controller/sent_proposal_controller.dart';
import 'package:thirumanam/controller/wishlist_controller.dart';
import 'package:thirumanam/models/data_model.dart';
import 'package:thirumanam/models/detailed_filter_model.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/received_proprosal_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:thirumanam/preferences/app_preference.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/views/auth/detailed_page.dart';

import '../../controller/dropdown_controller.dart';
import '../../controller/search_controller.dart';
import '../../models/getConnectedModel.dart';
import '../../models/getConnectedModel.dart';
import '../../resources/app_colors.dart';
import '../auth/country2.dart';

class GetConnentedPeoples extends StatefulWidget {
  @override
  State<GetConnentedPeoples> createState() => GetConnentedPeoplesState();
}

class GetConnentedPeoplesState extends State<GetConnentedPeoples> {
final AppPreference appPreference = Get.find();
List<FilterOptions> _selectedOccupations = [];
List<FilterOptions> selectedItems = [];
   TextEditingController SearchController = TextEditingController(text: '');
  final controller = Get.find<GetConnectedController>();
  final newfilter = Get.find<DropDownController>();
  TextEditingController SearchController1 = TextEditingController(text: '');
  // final controller1 = Get.find<WishListController>();

  int numberOfLikes = 10;

  int pageIndex = 0;

  bool status = false;

  List<Widget> _demo = [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      height: 100,
      width: 100,
      child: Image(
          image: NetworkImage(
              "https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4909.jpg?w=740&t=st=1674053514~exp=1674054114~hmac=85d2834dbc328dd5a71b3e2b18cf10c698d59f134867fcbe4b64ac8c0f7412d5")),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      height: 100,
      width: 100,
      child: Image(
          image: NetworkImage(
              "https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4909.jpg?w=740&t=st=1674053514~exp=1674054114~hmac=85d2834dbc328dd5a71b3e2b18cf10c698d59f134867fcbe4b64ac8c0f7412d5")),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      height: 100,
      width: 100,
      child: Image(
          image: NetworkImage(
              "https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4909.jpg?w=740&t=st=1674053514~exp=1674054114~hmac=85d2834dbc328dd5a71b3e2b18cf10c698d59f134867fcbe4b64ac8c0f7412d5")),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      height: 100,
      width: 100,
      child: Image(
          image: NetworkImage(
              "https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4909.jpg?w=740&t=st=1674053514~exp=1674054114~hmac=85d2834dbc328dd5a71b3e2b18cf10c698d59f134867fcbe4b64ac8c0f7412d5")),
    ),
  ];

  // late File _image;

  // Future getImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     _image = image;
  //   });
  // }
  String details = "";
  @override
  void initState(){
    super.initState();
    controller.fetchDetailedFilter();
    String token = appPreference.accessToken!;

    Map<String, dynamic> payload = Jwt.parseJwt(token);
    details = payload['details'];
    print(payload);
    print(details);
  }
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

  DateTime time1 = DateTime.now();

  
  int aa = 0;
  int bb = 1;
  int cc = 0;
  int dd = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.white,
backgroundColor: Colors.orangeAccent,
displacement: 200,
strokeWidth: 4,
triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () { 
            
          
           return controller.fetchDetailedFilter();
            
          
    
         },
        child: Stack(
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
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4.6),
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
                    'Connected Peoples',
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    width: 500,
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: TextField(
                                
                               controller: controller.searchController,
                               onChanged: (v) {
                            if (controller.timer?.isActive ?? false)
                              controller.timer?.cancel();
                            controller.timer = Timer(
                                const Duration(
                                    milliseconds: 500),
                                    () {
                                  controller.fetchDetailedFilter();
                                });
                          },
  //            onChanged: (text) {
  //             List<DetailedFilterModel> foodList =  controller.fetchDetailedFilter().where((item) => item.firstName.toLowerCase().contains(text.toLowerCase())); // Replace with your list source
  // },
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Color(0xFF134FAF),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed:  controller.searchController.clear
                                    ),
                                    hintText: 'Search Proposal',
                                    hintStyle:
                                        TextStyle(color: Color(0xFF134FAF)),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text('sort_by'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway",
                              color: Colors.white)),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          _settingModalBottomSheet(context);
                        },
                        child: Row(
                          children: [
                            Text('search_filter'.tr,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Raleway",
                                    color: Colors.white)),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
      
            // Positioned(
            //   top: 135,
            //   left: 20,
            //   child: Container(
            //     height: 100,
            //     width: MediaQuery.of(context).size.width,
            //     child: Text("dd"),
            //   ),
            // ),
      
            Padding(
              padding: const EdgeInsets.only(top: 160),
              child: Container(
                child: StreamBuilder<List<GetConnectedModel>>(
                    stream: controller.getFilteredModel(),
                    initialData: [],
                    builder: (context, snapshot) {
                     
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
      
                            List<GetConnectedModel> foodList = snapshot.data!
                            .where((item) =>
              item.firstName!.toLowerCase().contains(controller.searchController.text.toLowerCase()) || 
              item.lastName!.toLowerCase().contains(controller.searchController.text.toLowerCase()) || 
              item.customer_id!.toLowerCase().contains(controller.searchController.text.toLowerCase()) ||
              item.caste!.toLowerCase().contains(controller.searchController.text.toLowerCase()) ||
              item.category!.toLowerCase().contains(controller.searchController.text.toLowerCase()) ||
              item.city!.toLowerCase().contains(controller.searchController.text.toLowerCase()))
          .toList();
                            print(foodList);
                            print("foodList");

                            return foodList.length == 0
                                ? Container(
                                    child: Center(
                                      child: Text(
                                        'proposal_empty'.tr,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: foodList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var food = foodList[index];
                                      
                                      final isMe = food.userId != details;
                                      final isMe1 = food.userId1 != details;
                                      
                                       print(food.userId != details);
                                       print("vijay ${food.userId}");
                                       print("Priya ${details}");
                                       if(food.userId != details){
                                           return InkWell(
                                        onTap: (){
                                          Navigator.push(  
    context,  
    MaterialPageRoute(builder: (context) => DetailPage(idMatch: food.userId.toString(),)));  
                                        },
                                        
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            elevation: 50,
                                            shadowColor: Colors.white,
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: SizedBox(
                                              width: 380,
                                              height: 240,
                                              child: Column(
                                                children: [
                                                  // food.userId != details && !(food.userId1 == details)
                                                    Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 8, left: 320),
                                                    child: InkWell(
                                                        onTap: () {
                                                        },
                                                        child: Icon(
                                                          CupertinoIcons.heart_fill,
                                                          color: Colors.grey,
                                                        ))
                                                  ),
                                                  Container(
                                                    child: Row(
                                                        
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.only(
                                                                    left: 15,
                                                                    right: 10),
                                                            child: Align(
                                                              alignment:
                                                                  Alignment.topLeft,
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    height: 170,
                                                                    width: 140,
                                                                    child: ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  29),
                                                                      child: Image(
                                                                        image: NetworkImage(
                                                                            "${food.attachements!.length != 0 ? food.attachements![0].url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}"),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        width: 140,
                                                                        height: 170,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 6,
                                                                  ),
                                                                  Align(
                                                                    alignment: Alignment
                                                                        .centerLeft,
                                                                    child: Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                                  .only(
                                                                              right:
                                                                                  35),
                                                                      child: Row(
                                                                        children: [
                                                                          Icon(
                                                                            Icons
                                                                                .verified_rounded,
                                                                            color: Colors
                                                                                .green,
                                                                          ),
                                                                          SizedBox(
                                                                            width: 6,
                                                                          ),
                                                                          Text(
                                                                            'verified'.tr,
                                                                            style: TextStyle(
                                                                                fontSize:
                                                                                    13,
                                                                                fontWeight:
                                                                                    FontWeight
                                                                                        .bold,
                                                                                fontFamily:
                                                                                    "Raleway",
                                                                                color: Colors
                                                                                    .grey),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: 11, bottom: 10),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                   Text(
                                                                          
                                                                          "${food.firstName == null ? "----" : food.firstName} ${food.lastName == null ? "----" : food.lastName}",
                                                                          overflow: TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                            fontSize: 17,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                            fontFamily:
                                                                                "Raleway",
                                                                          ),
                                                                        ),
                                                                      
                                                                  Padding(
                                                                      padding:
                                                                          EdgeInsets.only(
                                                                              top: 9),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child: Row(
                                                                          children: [
                                                                            Text(
                                                                              "${food.customer_id == null ? "----" : food.customer_id} | ${food.age == null ? "----" : food.age}, \'${food.height == null ? "----" : food.height}\'",
                                                                              style: TextStyle(
                                                                                  fontSize:
                                                                                      13,
                                                                                  fontWeight:
                                                                                      FontWeight
                                                                                          .bold,
                                                                                  fontFamily:
                                                                                      "Raleway",
                                                                                  color: Colors
                                                                                      .grey),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.only(
                                                                            top: 9),
                                                                    child: Text(
                                                                      "${food.city == null ? "----" : food.city}",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          fontSize: 13,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                          fontFamily:
                                                                              "Raleway",
                                                                          color: Colors
                                                                              .grey),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.only(
                                                                            top: 9),
                                                                    child: Text(
                                                                      "${food.category == null ? "----" : food.category} Category",
                                                                      style: TextStyle(
                                                                          fontSize: 13,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                          fontFamily:
                                                                              "Raleway",
                                                                          color: Colors
                                                                              .grey),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.only(
                                                                            top: 9),
                                                                    child: Text(
                                                                      "${food.job != null ? food.job : "----"} | ${food.salary == null ? "----" : food.salary} PA",
                                                                      style: TextStyle(
                                                                          fontSize: 13,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                          fontFamily:
                                                                              "Raleway",
                                                                          color: Colors
                                                                              .grey),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.only(
                                                                            top: 18),
                                                                    child: Column(
                                                                      children: [
                                                                            InkWell(
                                                                                onTap:
                                                                                    () { 
                                                                                },
                                                                                child:
                                                                                    Container(
                                                                                  width:
                                                                                      100,
                                                                                  height:
                                                                                      35,
                                                                                  alignment:
                                                                                      Alignment.center,
                                                                                  decoration:
                                                                                      BoxDecoration(
                                                                                          borderRadius: BorderRadius.all(Radius.circular(
                                                                                              25)),
                                                                                          boxShadow: <
                                                                                              BoxShadow>[
                                                                                            BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                          ],
                                                                                          gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                                                                                            Color(0xffEAF12D),
                                                                                            Color(0xffEAF12D)
                                                                                          ])),
                                                                                  child:
                                                                                      Text(
                                                                                    'Connected',
                                                                                    style: TextStyle(
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        color: Color(0xFF134FAF)),
                                                                                  ),
                                                                                ),
                                                                              )
                                                                       
                                                                      
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ),
                                                 
                                                  
                                                 
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                   
                                       }else{
                                       return Container();
                                       }
                                    });
                          }
                      }
                     
                    }),
              ),
            ),
          ],
        ),
      ),
    );
    
  }


   void _settingModalBottomSheet(context) {
    Dialogs.materialDialog(
        useSafeArea: true,
        msg: 'Detailed Filter Search',
        msgStyle: TextStyle(color: Color(0xFF134FAF)),
        // title: "Delete",
        color: Colors.white,
        context: context,
        dialogWidth: kIsWeb ? 0.3 : null,
        onClose: (value) => print("returned value is '$value'"),
        actions: [
          SizedBox(
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Text('category'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway",
                              color: Color(0xFF134FAF))),
                    ),
                  ),

                  CustomDropdown(
                    selectedStyle: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 15,
                    ),
                    fillColor: Colors.grey.withOpacity(0.2),
                    fieldSuffixIcon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                      size: 16,
                    ),
                    hintText: 'Select Category',
                    hintStyle: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    items: const ['PREMIUM', 'VIP'],
                    controller: controller.memberController,
                    onChanged: (value) {
                      controller.member = value;
                      print(value);
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Text('horoscopic_details'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway",
                              color: Color(0xFF134FAF))),
                    ),
                  ),
                  Obx(
                    () => newfilter.isLoading.value
                        ? Container()
                        : SizedBox(
                            height: 57,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Raleway",
                                  fontSize: 15),
                              decoration: InputDecoration(
                                // hintText: "aa",
                                enabledBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),

                                filled: true,
                                // fillColor: Colors.white,
                                fillColor: Colors.grey.withOpacity(0.2),
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down_circle,
                                color: Color(0xFF134FAF),
                                size: 17,
                              ),
                              dropdownColor: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                              // value: newfilter.filterCatList.value[6].filterOptions![0],
                              // validator: (value) => value == null
                              //                           ? 'field required'
                              //                           : null,
                              // hint: Text('Enter team'),
                              hint: Text('rasi'.tr,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Raleway",
                                      color: Colors.grey)),
                              onChanged: (newValue) async {
                                print(newValue!.options);
                                controller.rasi = newValue.options!;
                                int? ind;
                                List<FilterOptions>? temp = newfilter
                                    .filterCatList.value[11].filterOptions
                                    ?.where((element) => element.isSelected!)
                                    .toList();
                                if (temp!.length > 0) {
                                  ind = newfilter
                                      .filterCatList.value[11].filterOptions
                                      ?.indexOf(temp.first);
                                  temp.first.isSelected = false;
                                  newfilter
                                      .filterCatList.value[11].filterOptions
                                      ?.removeAt(ind!);
                                  newfilter
                                      .filterCatList.value[11].filterOptions
                                      ?.insert(ind!, temp.first);
                                }
                                ind = newfilter
                                    .filterCatList.value[11].filterOptions
                                    ?.indexOf(newValue);
                                newfilter.filterCatList.value[11]
                                    .filterOptions?[ind!].isSelected = true;
                                newfilter.filterCatList.refresh();
                              },
                              items: newfilter.filterCatList.value
                                  .where(
                                      (element) => element.category == "Rasi")
                                  .first
                                  .filterOptions!
                                  .map((FilterOptions option) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    option.options!,
                                  ),
                                  value: option,
                                );
                              }).toList(),
                            ),
                          ),
                  ),
//                 SizedBox(height: 10,),
//                 DropdownButtonFormField(
//   decoration: InputDecoration(
//     labelText: 'Select options',
//     border: OutlineInputBorder(),
//   ),
//   value: selectedOptions,
//   items: filterOptionsList.map((FilterOptions option) {
//     return DropdownMenuItem(
//       value: option,
//       child: CheckboxListTile(
//         title: Text(option.options),
//         value: option.isSelected,
//         onChanged: (newValue) {
//           setState(() {
//             option.isSelected = newValue!;
//             if (filterOptionsList.any((option) => option.isSelected)) {
//               selectedOptions = filterOptionsList.firstWhere((option) => option.isSelected);
//             } else {
//               selectedOptions = null;
//             }
//           });
//         },
//       ),
//     );
//   }).toList(),
//   onChanged: (newValue) {
//     setState(() {
//       selectedOptions = newValue as FilterOptions?;
//     });
//   },
// );
                  SizedBox(height: 10),
                  Obx(
                    () => newfilter.isLoading.value
                        ? Container()
                        : SizedBox(
                            height: 57,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Raleway",
                                  fontSize: 15),
                              decoration: InputDecoration(
                                // hintText: "aa",
                                enabledBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),

                                filled: true,
                                // fillColor: Colors.white,
                                fillColor: Colors.grey.withOpacity(0.2),
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down_circle,
                                color: Color(0xFF134FAF),
                                size: 17,
                              ),
                              dropdownColor: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                              // value: newfilter.filterCatList.value[6].filterOptions![0],
                              // validator: (value) => value == null
                              //                           ? 'field required'
                              //                           : null,
                              // hint: Text('Enter team'),
                              hint: Text('nactchathiram'.tr,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Raleway",
                                      color: Colors.grey)),
                              onChanged: (newValue) async {
                                print(newValue!.options);
                                controller.Natchathiram = newValue.options!;
                                int? ind;
                                List<FilterOptions>? temp = newfilter
                                    .filterCatList.value[13].filterOptions
                                    ?.where((element) => element.isSelected!)
                                    .toList();
                                if (temp!.length > 0) {
                                  ind = newfilter
                                      .filterCatList.value[13].filterOptions
                                      ?.indexOf(temp.first);
                                  temp.first.isSelected = false;
                                  newfilter
                                      .filterCatList.value[13].filterOptions
                                      ?.removeAt(ind!);
                                  newfilter
                                      .filterCatList.value[13].filterOptions
                                      ?.insert(ind!, temp.first);
                                }
                                ind = newfilter
                                    .filterCatList.value[13].filterOptions
                                    ?.indexOf(newValue);
                                newfilter.filterCatList.value[13]
                                    .filterOptions?[ind!].isSelected = true;
                                newfilter.filterCatList.refresh();
                              },
                              items: newfilter.filterCatList.value
                                  .where((element) =>
                                      element.category == "Natchathiram")
                                  .first
                                  .filterOptions!
                                  .map((FilterOptions option) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    option.options!,
                                  ),
                                  value: option,
                                );
                              }).toList(),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => newfilter.isLoading.value
                        ? Container()
                        : SizedBox(
                            height: 57,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Raleway",
                                  fontSize: 15),
                              decoration: InputDecoration(
                                // hintText: "aa",
                                enabledBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),

                                filled: true,
                                // fillColor: Colors.white,
                                fillColor: Colors.grey.withOpacity(0.2),
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down_circle,
                                color: Color(0xFF134FAF),
                                size: 17,
                              ),
                              dropdownColor: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                              // value: newfilter.filterCatList.value[6].filterOptions![0],
                              // validator: (value) => value == null
                              //                           ? 'field required'
                              //                           : null,
                              // hint: Text('Enter team'),
                              hint: Text('laknam'.tr,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Raleway",
                                      color: Colors.grey)),
                              onChanged: (newValue) async {
                                print(newValue!.options);
                                controller.laknam = newValue.options!;
                                int? ind;
                                List<FilterOptions>? temp = newfilter
                                    .filterCatList.value[12].filterOptions
                                    ?.where((element) => element.isSelected!)
                                    .toList();
                                if (temp!.length > 0) {
                                  ind = newfilter
                                      .filterCatList.value[12].filterOptions
                                      ?.indexOf(temp.first);
                                  temp.first.isSelected = false;
                                  newfilter
                                      .filterCatList.value[12].filterOptions
                                      ?.removeAt(ind!);
                                  newfilter
                                      .filterCatList.value[12].filterOptions
                                      ?.insert(ind!, temp.first);
                                }
                                ind = newfilter
                                    .filterCatList.value[12].filterOptions
                                    ?.indexOf(newValue);
                                newfilter.filterCatList.value[12]
                                    .filterOptions?[ind!].isSelected = true;
                                newfilter.filterCatList.refresh();
                              },
                              items: newfilter.filterCatList.value
                                  .where(
                                      (element) => element.category == "Laknam")
                                  .first
                                  .filterOptions!
                                  .map((FilterOptions option) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    option.options!,
                                  ),
                                  value: option,
                                );
                              }).toList(),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  CustomDropdown(
                    selectedStyle: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 15,
                    ),
                    fillColor: Colors.grey.withOpacity(0.2),
                    // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    fieldSuffixIcon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                      size: 16,
                    ),
                    hintText: 'Dosham',
                    hintStyle: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    items: const ['No', 'Yes', 'Doesn\'t Matter'],
                    controller: controller.DoshamController,
                    onChanged: (value) {
                      controller.Dosham = value;
                      print(value);
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Text('profile_type'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway",
                              color: Color(0xFF134FAF))),
                    ),
                  ),
                  CustomDropdown(
                    selectedStyle: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 15,
                    ),
                    fillColor: Colors.grey.withOpacity(0.2),
                    // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    fieldSuffixIcon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                      size: 16,
                    ),
                    hintText: 'show profiles created',
                    hintStyle: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    items: const [
                      'within_a_day',
                      'within_a_week',
                      'Within a month'
                    ],
                    controller: controller.showProfileController,
                    onChanged: (value) {
                      controller.showProfile = value;
                      print(value);
                    },
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 52,
                    child: DropDownMultiSelect(
                      onChanged: (selectedValues) {
                        setState(() {
                          controller.Profile = selectedValues.join(',');
                          print(selectedValues.toString());
                          print(controller.Profile);
                        });
                      },
                      options: [
                        'with_photo',
                        'with_horoscope',
                        'premium_members'
                      ],
                      selectedValues: controller.Profile.isNotEmpty
                          ? controller.Profile.split(',')
                          : [],
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        filled: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Icon(Icons.arrow_drop_down_circle,
                              color: Color(0xFF134FAF), size: 16),
                        ),
                        
                        hintStyle: TextStyle(
                          fontSize: 21,
                          fontFamily: "Raleway",
                          color: Colors.black,
                        ),
                        
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.2),
        width: 0.0,
      ),
    ),
                         focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      whenEmpty: 'Profiles',
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Text('basic_details'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway",
                              color: Color(0xFF134FAF))),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Text('age_in'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway",
                              color: Color(0xFF134FAF))),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => newfilter.isLoading.value
                              ? Container()
                              : SizedBox(
                                  height: 57,
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Raleway",
                                        fontSize: 15),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        //<-- SEE HERE
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        //<-- SEE HERE
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),

                                      filled: true,
                                      // fillColor: Colors.white,
                                      fillColor: Colors.grey.withOpacity(0.2),
                                    ),
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle,
                                      color: Color(0xFF134FAF),
                                      size: 17,
                                    ),
                                    dropdownColor: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(20),

                                    // value: newfilter.filterCatList.value[1].filterOptions![0],
                                    // validator: (value) => value == null
                                    //                           ? 'field required'
                                    //                           : null,
                                    hint: Text('min_age'.tr,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.grey)),

                                    onChanged: (newValue) async {
                                      print(newValue!.options);
                                      controller.ageMin = newValue.options!;
                                      int? ind;
                                      List<FilterOptions>? temp = newfilter
                                          .filterCatList.value[1].filterOptions
                                          ?.where(
                                              (element) => element.isSelected!)
                                          .toList();
                                      if (temp!.length > 0) {
                                        ind = newfilter.filterCatList.value[1]
                                            .filterOptions
                                            ?.indexOf(temp.first);
                                        temp.first.isSelected = false;
                                        newfilter.filterCatList.value[1]
                                            .filterOptions
                                            ?.removeAt(ind!);
                                        newfilter.filterCatList.value[1]
                                            .filterOptions
                                            ?.insert(ind!, temp.first);
                                      }
                                      ind = newfilter
                                          .filterCatList.value[1].filterOptions
                                          ?.indexOf(newValue);
                                      newfilter
                                          .filterCatList
                                          .value[1]
                                          .filterOptions?[ind!]
                                          .isSelected = true;
                                      newfilter.filterCatList.refresh();
                                    },
                                    items: newfilter.filterCatList.value
                                        .where((element) =>
                                            element.category == "Age")
                                        .first
                                        .filterOptions!
                                        .map((FilterOptions option) {
                                      return DropdownMenuItem(
                                        child: new Text(
                                          option.options!,
                                        ),
                                        value: option,
                                      );
                                    }).toList(),
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text("To",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway",
                              color: Colors.grey)),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Obx(
                          () => newfilter.isLoading.value
                              ? Container()
                              : SizedBox(
                                  height: 57,
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Raleway",
                                        fontSize: 15),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        //<-- SEE HERE
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        //<-- SEE HERE
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),

                                      filled: true,
                                      // fillColor: Colors.white,
                                      fillColor: Colors.grey.withOpacity(0.2),
                                    ),
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle,
                                      color: Color(0xFF134FAF),
                                      size: 17,
                                    ),
                                    dropdownColor: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                    // value: newfilter.filterCatList.value[1].filterOptions![10],
                                    // validator: (value) => value == null
                                    //                           ? 'field required'
                                    //                           : null,
                                    // hint: Text('Enter team'),
                                    hint: Text('max_age'.tr,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.grey)),
                                    onChanged: (newValue) async {
                                      print(newValue!.options);
                                      controller.ageMax = newValue.options!;
                                      int? ind;
                                      List<FilterOptions>? temp = newfilter
                                          .filterCatList.value[1].filterOptions
                                          ?.where(
                                              (element) => element.isSelected!)
                                          .toList();
                                      if (temp!.length > 0) {
                                        ind = newfilter.filterCatList.value[1]
                                            .filterOptions
                                            ?.indexOf(temp.first);
                                        temp.first.isSelected = false;
                                        newfilter.filterCatList.value[1]
                                            .filterOptions
                                            ?.removeAt(ind!);
                                        newfilter.filterCatList.value[1]
                                            .filterOptions
                                            ?.insert(ind!, temp.first);
                                      }
                                      ind = newfilter
                                          .filterCatList.value[1].filterOptions
                                          ?.indexOf(newValue);
                                      newfilter
                                          .filterCatList
                                          .value[1]
                                          .filterOptions?[ind!]
                                          .isSelected = true;
                                      newfilter.filterCatList.refresh();
                                    },
                                    items: newfilter.filterCatList.value
                                        .where((element) =>
                                            element.category == "Age")
                                        .first
                                        .filterOptions!
                                        .map((FilterOptions option) {
                                      return DropdownMenuItem(
                                        child: new Text(
                                          option.options!,
                                        ),
                                        value: option,
                                      );
                                    }).toList(),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Text('height'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway",
                              color: Color(0xFF134FAF))),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          selectedStyle: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 15,
                          ),
                          fillColor: Colors.grey.withOpacity(0.2),
                          // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                          fieldSuffixIcon: Icon(
                            Icons.arrow_drop_down_circle,
                            color: Color(0xFF134FAF),
                            size: 16,
                          ),
                          hintText: 'Min Height',
                          hintStyle: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          items: const [
                            '140',
                            '145',
                            '150',
                            '155',
                            '160',
                            '165',
                            '170',
                            '175',
                            '180',
                            '185',
                            '190',
                            '195',
                            '200',
                            '205'
                          ],
                          controller: controller.heightMinController,
                          onChanged: (value) {
                            controller.heightMin = value;
                            print(value);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text("To",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway",
                              color: Colors.grey)),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: CustomDropdown(
                          selectedStyle: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 15,
                          ),
                          fillColor: Colors.grey.withOpacity(0.2),
                          // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                          fieldSuffixIcon: Icon(
                            Icons.arrow_drop_down_circle,
                            color: Color(0xFF134FAF),
                            size: 16,
                          ),
                          hintText: 'Max Height',
                          hintStyle: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          items: const [
                            '140',
                            '145',
                            '150',
                            '155',
                            '160',
                            '165',
                            '170',
                            '175',
                            '180',
                            '185',
                            '190',
                            '195',
                            '200',
                            '205'
                          ],
                          controller: controller.heightMaxController,
                          onChanged: (value) {
                            controller.heightMax = value;
                            print(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Obx(
                    () => newfilter.isLoading.value
                        ? Container()
                        : SizedBox(
                            height: 57,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Raleway",
                                  fontSize: 15),
                              decoration: InputDecoration(
                                // hintText: "aa",
                                enabledBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),

                                filled: true,
                                // fillColor: Colors.white,
                                fillColor: Colors.grey.withOpacity(0.2),
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down_circle,
                                color: Color(0xFF134FAF),
                                size: 17,
                              ),
                              dropdownColor: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                              // value: newfilter.filterCatList.value[6].filterOptions![0],
                              // validator: (value) => value == null
                              //                           ? 'field required'
                              //                           : null,
                              // hint: Text('Enter team'),
                              hint: Text('mother_tongue'.tr,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Raleway",
                                      color: Colors.grey)),
                              onChanged: (newValue) async {
                                print(newValue!.options);
                                controller.MotherTongue = newValue.options!;
                                int? ind;
                                List<FilterOptions>? temp = newfilter
                                    .filterCatList.value[6].filterOptions
                                    ?.where((element) => element.isSelected!)
                                    .toList();
                                if (temp!.length > 0) {
                                  ind = newfilter
                                      .filterCatList.value[6].filterOptions
                                      ?.indexOf(temp.first);
                                  temp.first.isSelected = false;
                                  newfilter.filterCatList.value[6].filterOptions
                                      ?.removeAt(ind!);
                                  newfilter.filterCatList.value[6].filterOptions
                                      ?.insert(ind!, temp.first);
                                }
                                ind = newfilter
                                    .filterCatList.value[6].filterOptions
                                    ?.indexOf(newValue);
                                newfilter.filterCatList.value[6]
                                    .filterOptions?[ind!].isSelected = true;
                                newfilter.filterCatList.refresh();
                              },
                              items: newfilter.filterCatList.value
                                  .where((element) =>
                                      element.category == "MotherTongue")
                                  .first
                                  .filterOptions!
                                  .map((FilterOptions option) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    option.options!,
                                  ),
                                  value: option,
                                );
                              }).toList(),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                   SizedBox(
                    height: 52,
                     child: DropDownMultiSelect(
                      onChanged: (selectedValues) {
                        setState(() {
                          controller.MaritalStatus = selectedValues.join(',');
                          print(selectedValues.toString());
                          print(controller.MaritalStatus);
                        });
                      },
                      options: [
                        'Never Married',
                        'Awaiting Divorce',
                        'Widowed',
                        'Divorced'
                      ],
                      selectedValues: controller.MaritalStatus.isNotEmpty
                          ? controller.MaritalStatus.split(',')
                          : [],
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        filled: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Icon(Icons.arrow_drop_down_circle,
                              color: Color(0xFF134FAF), size: 16),
                        ),
                        
                        hintStyle: TextStyle(
                          fontSize: 21,
                          fontFamily: "Raleway",
                          color: Colors.black,
                        ),
                        
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.2),
        width: 0.0,
      ),
    ),
                         focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      whenEmpty: 'Marital Status',
                  ),
                   ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, top: 5, right: 180),
                    child: Text(
                      'religion_details'.tr,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF134FAF)),
                    ),
                  ),
                  Obx(
                    () => newfilter.isLoading.value
                        ? Container()
                        : SizedBox(
                            height: 57,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Raleway",
                                  fontSize: 15),
                              decoration: InputDecoration(
                                // hintText: "aa",
                                enabledBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),

                                filled: true,
                                // fillColor: Colors.white,
                                fillColor: Colors.grey.shade100,
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down_circle,
                                color: Color(0xFF134FAF),
                                size: 17,
                              ),
                              dropdownColor: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                              // value: newfilter.filterCatList.value[2].filterOptions![1],
                              // validator: (value) => value == null
                              //                           ? 'field required'
                              //                           : null,
                              // hint: Text('Enter team'),
                              hint: Text('religion'.tr,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Raleway",
                                      color: Colors.grey)),
                              onChanged: (newValue) async {
                                print(newValue!.options);
                                controller.Religion = newValue.options!;
                                int? ind;
                                List<FilterOptions>? temp = newfilter
                                    .filterCatList.value[2].filterOptions
                                    ?.where((element) => element.isSelected!)
                                    .toList();
                                if (temp!.length > 0) {
                                  ind = newfilter
                                      .filterCatList.value[2].filterOptions
                                      ?.indexOf(temp.first);
                                  temp.first.isSelected = false;
                                  newfilter.filterCatList.value[2].filterOptions
                                      ?.removeAt(ind!);
                                  newfilter.filterCatList.value[2].filterOptions
                                      ?.insert(ind!, temp.first);
                                }
                                ind = newfilter
                                    .filterCatList.value[2].filterOptions
                                    ?.indexOf(newValue);
                                newfilter.filterCatList.value[2]
                                    .filterOptions?[ind!].isSelected = true;
                                newfilter.filterCatList.refresh();
                              },
                              items: newfilter.filterCatList.value
                                  .where((element) =>
                                      element.category == "Religion")
                                  .first
                                  .filterOptions!
                                  .map((FilterOptions option) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    option.options!,
                                  ),
                                  value: option,
                                );
                              }).toList(),
                            ),
                          ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => newfilter.isLoading.value
                        ? Container()
                        : SizedBox(
                            height: 57,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Raleway",
                                  fontSize: 15),
                              decoration: InputDecoration(
                                // hintText: "aa",
                                enabledBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),

                                filled: true,
                                // fillColor: Colors.white,
                                fillColor: Colors.grey.shade100,
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down_circle,
                                color: Color(0xFF134FAF),
                                size: 17,
                              ),
                              dropdownColor: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                              // value: newfilter.filterCatList.value[3].filterOptions![0],
                              // validator: (value) => value == null
                              //                           ? 'field required'
                              //                           : null,
                              // hint: Text('Enter team'),
                              hint: Text('caste'.tr,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Raleway",
                                      color: Colors.grey)),
                              onChanged: (newValue) async {
                                print(newValue!.options);
                                controller.Caste = newValue.options!;
                                int? ind;
                                List<FilterOptions>? temp = newfilter
                                    .filterCatList.value[3].filterOptions
                                    ?.where((element) => element.isSelected!)
                                    .toList();
                                if (temp!.length > 0) {
                                  ind = newfilter
                                      .filterCatList.value[3].filterOptions
                                      ?.indexOf(temp.first);
                                  temp.first.isSelected = false;
                                  newfilter.filterCatList.value[3].filterOptions
                                      ?.removeAt(ind!);
                                  newfilter.filterCatList.value[3].filterOptions
                                      ?.insert(ind!, temp.first);
                                }
                                ind = newfilter
                                    .filterCatList.value[3].filterOptions
                                    ?.indexOf(newValue);
                                newfilter.filterCatList.value[3]
                                    .filterOptions?[ind!].isSelected = true;
                                newfilter.filterCatList.refresh();
                              },
                              items: newfilter.filterCatList.value
                                  .where(
                                      (element) => element.category == "Caste")
                                  .first
                                  .filterOptions!
                                  .map((FilterOptions option) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    option.options!,
                                  ),
                                  value: option,
                                );
                              }).toList(),
                            ),
                          ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, top: 5, right: 180),
                    child: Text(
                      'professional_details'.tr,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF134FAF)),
                    ),
                  ),

                  Obx(
                    () => newfilter.isLoading.value
                        ? Container()
                        : SizedBox(
                            height: 57,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Raleway",
                                  fontSize: 15),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),

                                filled: true,
                                // fillColor: Colors.white,
                                fillColor: Colors.grey.shade100,
                              ),
                              icon: Icon(Icons.arrow_drop_down_circle,
                                  color: Color(0xFF134FAF), size: 17),
                              dropdownColor: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                              // value: newfilter.filterCatList.value[10].filterOptions![0],
                              // validator: (value) => value == null
                              //                           ? 'field required'
                              //                           : null,
                              // hint: Text('Enter team'),
                              hint: Text('education'.tr,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Raleway",
                                      color: Colors.grey)),
                              onChanged: (newValue) async {
                                print(newValue!.options);
                                controller.Education = newValue.options!;
                                int? ind;
                                List<FilterOptions>? temp = newfilter
                                    .filterCatList.value[10].filterOptions
                                    ?.where((element) => element.isSelected!)
                                    .toList();
                                if (temp!.length > 0) {
                                  ind = newfilter
                                      .filterCatList.value[10].filterOptions
                                      ?.indexOf(temp.first);
                                  temp.first.isSelected = false;
                                  newfilter
                                      .filterCatList.value[10].filterOptions
                                      ?.removeAt(ind!);
                                  newfilter
                                      .filterCatList.value[10].filterOptions
                                      ?.insert(ind!, temp.first);
                                }
                                ind = newfilter
                                    .filterCatList.value[10].filterOptions
                                    ?.indexOf(newValue);
                                newfilter.filterCatList.value[10]
                                    .filterOptions?[ind!].isSelected = true;
                                newfilter.filterCatList.refresh();
                              },
                              items: newfilter.filterCatList.value
                                  .where((element) =>
                                      element.category == "Education")
                                  .first
                                  .filterOptions!
                                  .map((FilterOptions option) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    option.options!,
                                  ),
                                  value: option,
                                );
                              }).toList(),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => newfilter.isLoading.value
                        ? Container()
                        : SizedBox(
                            height: 57,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Raleway",
                                  fontSize: 15),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),

                                filled: true,
                                // fillColor: Colors.white,
                                fillColor: Colors.grey.shade100,
                              ),
                              icon: Icon(Icons.arrow_drop_down_circle,
                                  color: Color(0xFF134FAF), size: 17),
                              dropdownColor: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                              // value: newfilter.filterCatList.value[10].filterOptions![0],
                              // validator: (value) => value == null
                              //                           ? 'field required'
                              //                           : null,
                              // hint: Text('Enter team'),
                              hint: Text('occupation'.tr,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Raleway",
                                      color: Colors.grey)),
                              onChanged: (newValue) async {
                                print(newValue!.options);
                                controller.occupation = newValue.options!;
                                int? ind;
                                List<FilterOptions>? temp = newfilter
                                    .filterCatList.value[23].filterOptions
                                    ?.where((element) => element.isSelected!)
                                    .toList();
                                if (temp!.length > 0) {
                                  ind = newfilter
                                      .filterCatList.value[23].filterOptions
                                      ?.indexOf(temp.first);
                                  temp.first.isSelected = false;
                                  newfilter
                                      .filterCatList.value[23].filterOptions
                                      ?.removeAt(ind!);
                                  newfilter
                                      .filterCatList.value[23].filterOptions
                                      ?.insert(ind!, temp.first);
                                }
                                ind = newfilter
                                    .filterCatList.value[23].filterOptions
                                    ?.indexOf(newValue);
                                newfilter.filterCatList.value[23]
                                    .filterOptions?[ind!].isSelected = true;
                                newfilter.filterCatList.refresh();
                              },
                              items: newfilter.filterCatList.value
                                  .where((element) =>
                                      element.category == "occupation")
                                  .first
                                  .filterOptions!
                                  .map((FilterOptions option) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    option.options!,
                                  ),
                                  value: option,
                                );
                              }).toList(),
                            ),
                          ),
                  ),

                 
                    SizedBox(height: 10,),
                  SizedBox(
                    height: 52,
                    child: DropDownMultiSelect(
                      onChanged: (selectedValues) {
                        setState(() {
                          controller.EmployedIn = selectedValues.join(',');
                          print(selectedValues.toString());
                          print(controller.EmployedIn);
                        });
                      },
                      options: [
                        'Private',
                        'Not Working',
                        'Government/PSU',
                        'Self Employed',
                        'Business',
                        'Defence',
                      ],
                      selectedValues: controller.EmployedIn.isNotEmpty
                          ? controller.EmployedIn.split(',')
                          : [],
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        filled: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Icon(Icons.arrow_drop_down_circle,
                              color: Color(0xFF134FAF), size: 16),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 21,
                          fontFamily: "Raleway",
                          color: Colors.black,
                        ),
                        
                         enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.2),
        width: 0.0,
      ),
    ),
                         focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      whenEmpty: 'Employed In',
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  CustomDropdown(
                    selectedStyle: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 15,
                    ),
                    fillColor: Colors.grey.withOpacity(0.2),
                    // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    fieldSuffixIcon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                      size: 16,
                    ),
                    hintText: 'Annual Income',
                    hintStyle: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    items: const [
                      'Any',
                      '100000',
                      '200000',
                      '300000',
                      '400000',
                      '500000',
                      '600000',
                      '700000',
                      '800000',
                      '900000',
                      '1000000',
                      '1100000',
                      '1200000',
                      '1300000',
                    ],
                    controller: controller.annualIncomeController,
                    onChanged: (value) {
                      controller.AnnualIncome = value;
                      print(value);
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, top: 5, right: 180),
                    child: Text(
                      'location_details'.tr,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF134FAF)),
                    ),
                  ),
                  CountryStateCityPicker(
                    country: controller.CountryController,
                    state: controller.StateController,
                    distict: controller.CityController,
                    // district: controller.nickNameController,4

                    textFieldInputBorder: OutlineInputBorder(
                      gapPadding: 20,
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 52,
                    child: DropDownMultiSelect(
                      onChanged: (selectedValues) {
                        setState(() {
                          controller.residentStatus = selectedValues.join(',');
                          print(selectedValues.toString());
                          print(controller.residentStatus);
                        });
                      },
                      options: [
                        'STUDENT VISA',
                        'WORK PERMIT',
                        'CITIZEN',
                        'TEMPORARY VISA',
                        'PERMANENT RESIDENT',
                      ],
                      selectedValues: controller.residentStatus.isNotEmpty
                          ? controller.residentStatus.split(',')
                          : [],
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        filled: true,
                         suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Icon(Icons.arrow_drop_down_circle,
                              color: Color(0xFF134FAF), size: 16),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 21,
                          fontFamily: "Raleway",
                          color: Colors.black,
                        ),
                        
                         enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.2),
        width: 0.0,
      ),
    ),
                         focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      whenEmpty: 'Resident Status',
                    ),
                  ),
                SizedBox(height: 10,),
                  SizedBox(
                    height: 52,
                    child: DropDownMultiSelect(
                      onChanged: (selectedValues) {
                        setState(() {
                          controller.physicalStatus = selectedValues.join(',');
                          print(selectedValues.toString());
                          print(controller.residentStatus);
                        });
                      },
                      options: ['No', 'Yes', 'Doesn\'t Matter'],
                      selectedValues: controller.physicalStatus.isNotEmpty
                          ? controller.physicalStatus.split(',')
                          : [],
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        filled: true,
                         suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Icon(Icons.arrow_drop_down_circle,
                              color: Color(0xFF134FAF), size: 16),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 21,
                          fontFamily: "Raleway",
                          color: Colors.black,
                        ),
                       
                       enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.2),
        width: 0.0,
      ),
    ),
                         focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      whenEmpty: 'Physical Status',
                    ),
                  ),
  SizedBox(height: 10,),
                  SizedBox(
                    height: 52,
                    child: DropDownMultiSelect(
                      onChanged: (selectedValues) {
                        setState(() {
                          controller.deit = selectedValues.join(',');
                          print(selectedValues.toString());
                          print(controller.deit);
                        });
                      },
                      options: ['Vegitarian', 'Non-Vegitarian', 'Eggetarian'],
                      selectedValues: controller.deit.isNotEmpty
                          ? controller.deit.split(',')
                          : [],
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        filled: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Icon(Icons.arrow_drop_down_circle,
                              color: Color(0xFF134FAF), size: 16),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 21,
                          fontFamily: "Raleway",
                          color: Colors.black,
                        ),
                         enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.2),
        width: 0.0,
      ),
    ),
                         focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      whenEmpty: 'Eating Habits',
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 52,
                    child: DropDownMultiSelect(
                      onChanged: (selectedValues) {
                        setState(() {
                          controller.drinking = selectedValues.join(',');
                          print(selectedValues.toString());
                          print(controller.drinking);
                        });
                      },
                      options: [
                        'Non-Drinker',
                        'Light/Social-Drinker',
                        'Regular-Drinker'
                      ],
                      selectedValues: controller.drinking.isNotEmpty
                          ? controller.drinking.split(',')
                          : [],
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        filled: true,
                         suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Icon(Icons.arrow_drop_down_circle,
                              color: Color(0xFF134FAF), size: 16),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 21,
                          fontFamily: "Raleway",
                          color: Colors.black,
                        ),
                         enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.2),
        width: 0.0,
      ),
    ),
                         focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      whenEmpty: 'drinking_habits'.tr,
                    ),
                  ),
SizedBox(height: 10,),
                  SizedBox(
                    height: 52,
                    child: DropDownMultiSelect(
                      onChanged: (selectedValues) {
                        setState(() {
                          controller.smoking = selectedValues.join(',');
                          print(selectedValues.toString());
                          print(controller.smoking);
                        });
                      },
                      options: [
                        'Non-Smoker',
                        'Light/Social-Smoker',
                        'Regular-Smoker'
                      ],
                      selectedValues: controller.smoking.isNotEmpty
                          ? controller.smoking.split(',')
                          : [],
                      decoration: InputDecoration(
                        
                        fillColor: Colors.grey.withOpacity(0.2),
                      filled: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Icon(Icons.arrow_drop_down_circle,
                              color: Color(0xFF134FAF), size: 16),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 21,
                          fontFamily: "Raleway",
                          color: Colors.grey,
                        ),
                        
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.2),
        width: 0.0,
      ),
    ),
                         focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 2,
                          ),
                        ),
                        
                      ),
                      whenEmpty: 'smoking_habits'.tr,
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF134FAF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                          ),
                          child: Text('Clear All'),
                          onPressed: () {
                            setState(() {
                              controller.fetchDetailedFilter();
                            });
                            Navigator.pop(context);
                          },
                        ),

                        SizedBox(width: 40,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF134FAF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                          ),
                          child: Text('search'.tr),
                          onPressed: () {
                            setState(() {
                              controller.fetchDetailedFilter();
                            });
                            controller.ageMin = '';
                            controller.ageMax = '';
                            controller.member = '';
                            controller.heightMin = '';
                            controller.heightMax = '';
                            controller.AnnualIncome = '';
                            controller.MotherTongue = '';
                            controller.MaritalStatus = '';
                            controller.Religion = '';
                            controller.Caste = '';
                            controller.Education = '';
                            controller.EmployedIn = '';
                            controller.residentStatus = '';
                            controller.physicalStatus = '';
                            controller.deit = '';
                            controller.drinking = '';
                            controller.smoking = '';
                            controller.showProfile = '';
                            controller.Profile = '';
                            controller.rasi = '';
                            controller.Dosham = '';
                            controller.Natchathiram = '';
                            controller.laknam = '';
                            controller.occupation = '';
                            controller.CountryController.clear();
                            controller.StateController.clear();
                            controller.CityController.clear();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}
