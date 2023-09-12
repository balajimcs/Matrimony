import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:multiselect/multiselect.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:thirumanam/controller/detailed_filter_controller.dart';
// import 'package:thirumanam/controller/detailed_page_controller.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/views/profile/commons/profile_info_card.dart';
import 'package:thirumanam/views/profile/styleguide/text_style.dart';

import '../../controller/register_controller.dart';
import '../../controller/update_controllers/horoscopic_controller.dart';
import '../../preferences/app_preference.dart';
import '../../resources/app_routes.dart';
import '../profile/commons/my_info.dart';
import '../profile/commons/opaque_image.dart';

class MyDetailPage extends StatefulWidget {
  @override
  _MyDetailPageState createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  final AppPreference appPreference = Get.find();
  loginToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor:
            toast == "Login Sucessfull" ? Colors.green : Colors.green,
        textColor: Colors.white);
  }

// final controller = Get.find<DetailedPageController>();
  final controller7 = Get.find<HoroScopicController>();
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
      // appPreference.accessToken = body["data"];
      print("balaji");
    }
    print(body);

    // isLoading.value = false;
    // return body.map<receiviedProprosalModel>((data) => receiviedProprosalModel.fromJson(data)).toList();
    return body;
  }

  @override
  Widget build(BuildContext context) {
    // final  = TextEditingController();

    return FutureBuilder<Map<String, dynamic>>(
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
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text('some_error'.tr));
              } else {
                print("snapshot.data");
                print(snapshot.data);
                return _buildProductCard(snapshot.data);
              }
          }
        });
  }

 Widget _buildProductCard(product) {
    print(product.length.toString());
    print(
        "aaaa: ${product == null ? product["data"]['customerDetails']["attachments"][0]["url"] : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}");
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Stack(
                  children: <Widget>[
                    // ${product['data']['customerDetails']  != null ? product['data']['customerDetails']["attachments"]["url"] : ""}
                    OpaqueImage(
                      imageUrl:
                          "${product["data"]['customerDetails']["attachments"]!.length != 0 ? product["data"]['customerDetails']["attachments"][0]["url"] : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}",
                    ),
                    //             CarouselSlider(

                    //               options: CarouselOptions(autoPlay: true,
                    //   autoPlayAnimationDuration: Duration(seconds: 5),
                    //   height: MediaQuery.of(context).size.height * 0.60,),

                    //   items: <Widget>[
                    //     for (var i = 0; i < product["data"]['customerDetails']["attachments"].length; i++)
                    //       Container(
                    //           margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                    //           decoration: BoxDecoration(
                    //             image: DecorationImage(
                    //               image: NetworkImage(product["data"]['customerDetails']["attachments"][i]["url"]),
                    //               fit: BoxFit.fitHeight,
                    //             ),
                    //             // border:
                    //             //     Border.all(color: Theme.of(context).accentColor),
                    //             borderRadius: BorderRadius.circular(32.0),
                    //           ),
                    //         ),
                    //   ],
                    // ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        child: Icon(
                                          Icons.arrow_circle_left_outlined,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 110),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["first_name"] : "----"} ${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["last_name"] : "----"} | ${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["age"] : "----"}",
                                            style: TextStyle(
                                                fontFamily: "Raleway",
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.placemark,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "${product['data']['customerDetails']["permanent_address"] != null ? product['data']['customerDetails']["permanent_address"]["area"] : "----"}, ${product['data']['customerDetails']["permanent_address"] != null ? product['data']['customerDetails']["permanent_address"]["city"] : "----"}",
                                          style: TextStyle(
                                              fontFamily: "Raleway",
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
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
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.only(top: 60),
                  color: Colors.grey.withOpacity(0.5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Card(
                            elevation: 50,
                            shadowColor: Colors.white,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: SizedBox(
                              width: 85,
                              height: MediaQuery.of(context).size.height,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, right: 5, left: 5),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Dialogs.materialDialog(
                                            msg:
                                                'Proposal Community detailed view',
                                                msgStyle: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                            ),
                                            // title: "Delete",
                                            color: Colors.white,
                                            context: context,
                                            dialogWidth: kIsWeb ? 0.3 : null,
                                            onClose: (value) => print(
                                                "returned value is '$value'"),
                                            actions: [
                                              SizedBox(
                                                height: 300,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Card(
                                                      elevation: 50,
                                                      shadowColor: Colors.white,
                                                      color: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: SizedBox(
                                                        width: 280,
                                                        height: 40,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'religion'.tr,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  '${product['data']['customerDetails']["religion_community"] != null ? product['data']['customerDetails']["religion_community"]["religion"] : "----"}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Card(
                                                      elevation: 50,
                                                      shadowColor: Colors.white,
                                                      color: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: SizedBox(
                                                        width: 280,
                                                        height: 40,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'caste'.tr,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .fade,
                                                                  '${product['data']['customerDetails']["religion_community"] != null ? product['data']['customerDetails']["religion_community"]["caste"] : "----"}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Card(
                                                      elevation: 50,
                                                      shadowColor: Colors.white,
                                                      color: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: SizedBox(
                                                        width: 280,
                                                        height: 40,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'sub_caste'.tr,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  '${product['data']['customerDetails']["religion_community"] != null ? product['data']['customerDetails']["religion_community"]["sub_caste"] : "----"}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Card(
                                                      elevation: 50,
                                                      shadowColor: Colors.white,
                                                      color: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: SizedBox(
                                                        width: 280,
                                                        height: 40,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'community'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["religion_community"] != null ? product['data']['customerDetails']["religion_community"]["community"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Card(
                                                      elevation: 50,
                                                      shadowColor: Colors.white,
                                                      color: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: SizedBox(
                                                        width: 280,
                                                        height: 40,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'mother_tongue'.tr,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  '${product['data']['customerDetails']["religion_community"] != null ? product['data']['customerDetails']["religion_community"]["mother_tongue"] : "----"}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]);
                                      },
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.speaker_group_rounded,
                                            color: Color(0xFF134FAF),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            'community'.tr,
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                fontFamily: "Raleway",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Dialogs.materialDialog(
                                            msg:
                                                'Proposal Address detailed view',
                                                msgStyle: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                            ),
                                            // title: "Delete",
                                            color: Colors.white,
                                            context: context,
                                            dialogWidth: kIsWeb ? 0.3 : null,
                                            onClose: (value) => print(
                                                "returned value is '$value'"),
                                            actions: [
                                              
                                              SizedBox(
                                                height: 400,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'street'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .fade,
                                                                    '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["door_no"] : "----"}, ${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["street"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'area'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["area"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'city'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["city"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'district'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["district"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'state'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["state"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'country'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["country"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'nationality'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["permanent_address"] != null ? product['data']['customerDetails']["permanent_address"]["nationality"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'current_nationality'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["current_nationality"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'resident_status'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["permanent_address"] != null ? product['data']['customerDetails']["permanent_address"]["resident_status"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                         
                                            ]);
                                      },
                                      child: Column(
                                        children: [
                                          Icon(Icons.house_rounded,
                                              color: Color(0xFF134FAF)),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            'address'.tr,
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                fontFamily: "Raleway",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        
                                        Dialogs.materialDialog(
                                            msg:
                                                'Proposal personal details',
                                                msgStyle: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                            ),
                                            // title: "Delete",
                                            color: Colors.white,
                                            context: context,
                                            dialogWidth: kIsWeb ? 0.3 : null,
                                            onClose: (value) => print(
                                                "returned value is '$value'"),
                                            actions: [
                                             
                                              SizedBox(
                                                height: 430,
                                                
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'diet'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["diet"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'martial_status'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["marital_details"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'skin_tone'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["skin_tone"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'height'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["height"] : "----"} cm',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'weight'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["weight"] : "----"} kg',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'hobbies'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["hobbies"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'no_of_child'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["no_of_children"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'child_status'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["children_status"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'physical_status'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["physical_status"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'drinking'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["drinking"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'smoking'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["smoking"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'description'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["description"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            
                                              
                                            ]);
                                      },
                                      child: Column(
                                        children: [
                                          Icon(Icons.person_rounded,
                                              color: Color(0xFF134FAF)),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            'personal'.tr,
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                fontFamily: "Raleway",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Dialogs.materialDialog(
                                            msg:
                                                'Proposal Carrier detailed view',
                                                msgStyle: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                            ),
                                            // title: "Delete",
                                            color: Colors.white,
                                            context: context,
                                            dialogWidth: kIsWeb ? 0.3 : null,
                                            onClose: (value) => print(
                                                "returned value is '$value'"),
                                            actions: [
                                             
                                              SizedBox(
                                                height: 300,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'education_qual'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["educational_qualification"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'working_in'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["working_in"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'working_as'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["working_as"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'company_details'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["company_details"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'annual_income'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '₹ ${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["annual_income"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            
                                              
                                            ]);
                                      },
                                      child: Column(
                                        children: [
                                          Icon(Icons.work,
                                              color: Color(0xFF134FAF)),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            'carrier'.tr,
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                fontFamily: "Raleway",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Dialogs.materialDialog(
                                            msg:
                                                'Proposal Jathagam detailed view',
                                                msgStyle: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                            ),
                                            // title: "Delete",
                                            color: Colors.white,
                                            context: context,
                                            dialogWidth: kIsWeb ? 0.3 : null,
                                            onClose: (value) => print(
                                                "returned value is '$value'"),
                                            actions: [
                                              
                                              SizedBox(
                                                height: 400,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'rasi'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["rasi"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'nactchathiram'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["natchathiram"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'laknam'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["laknam"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'gothram'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["gothram"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'kuladeivam'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["kuladeivam"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'dosham'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["dosham"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'dosham_details'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["dosham_details"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'place_birth'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["place_of_birth"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'time_birth'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["time_of_birth"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            
                                            ]);
                                      },
                                      child: Column(
                                        children: [
                                          Icon(Icons.note_alt_rounded,
                                              color: Color(0xFF134FAF)),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            'jathagam'.tr,
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                fontFamily: "Raleway",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Dialogs.materialDialog(
                                            msg:
                                                'Proposal Family detailed view',
                                                msgStyle: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                            ),
                                            // title: "Delete",
                                            color: Colors.white,
                                            context: context,
                                            dialogWidth: kIsWeb ? 0.3 : null,
                                            onClose: (value) => print(
                                                "returned value is '$value'"),
                                            actions: [
                                               
                                              SizedBox(
                                                height: 500,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'father_name'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["father_name"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'mother_name'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["mother_name"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'father_occupation'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["father_occupation"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'mother_occupation'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["mother_occupation"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'no_bro'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["no_of_bro"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'no_bro_married'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["no_of_bro_married"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'no_sis'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["no_of_sis"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'no_sis_married'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["no_of_sis_married"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'own_vechile'.tr,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["own_vehicle"] : "----"}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'own_house'.tr,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["own_house"] : "----"}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'own_lands'.tr,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["own_lands"] : "----"}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'own_flats'.tr,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["own_flats"] : "----"}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          "Raleway",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'expectation'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["expectation"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'about_me'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["about_me"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            
                                            ]);
                                      },
                                      child: Column(
                                        children: [
                                          Icon(Icons.family_restroom_rounded,
                                              color: Color(0xFF134FAF)),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            'family'.tr,
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                fontFamily: "Raleway",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Card(
                          elevation: 50,
                          shadowColor: Colors.white,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: SizedBox(
                            width: 275,
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 30, left: 20),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["working_as"] : "----"} | ${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["working_in"] : "----"}',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 20),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'about_family'.tr,
                                        style: TextStyle(
                                          color: Color(0xFF134FAF),
                                            fontSize: 19.0,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 15, left: 20, right: 6),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                         
                                              Text(
                                            overflow: TextOverflow.ellipsis,
                                            textDirection: TextDirection.ltr,
                                            maxLines: 10,
                                            '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["about_family"] : "----"}',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: "Raleway",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                            softWrap: false,
                                          ),
                                            
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 20),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'about_her'.tr,
                                        style: TextStyle(
                                          color: Color(0xFF134FAF),
                                            fontSize: 19.0,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 15, left: 20, right: 6),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                        
                                              Text(
                                            overflow: TextOverflow.ellipsis,
                                            textDirection: TextDirection.ltr,
                                            maxLines: 10,
                                            '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["about_me"] : "----"}',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: "Raleway",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                            softWrap: false,
                                          ),
                                            
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 20),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        
                                        'about_expectation'.tr,
                                        style: TextStyle(
                                          color: Color(0xFF134FAF),
                                            fontSize: 19.0,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 15, left: 20, right: 6),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                         
                                              Text(
                                            overflow: TextOverflow.ellipsis,
                                            textDirection: TextDirection.ltr,
                                            maxLines: 10,
                                            '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["expectation"] : "----"}',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: "Raleway",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                            softWrap: false,
                                          ),
                                           
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 20),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'about_habits'.tr,
                                        style: TextStyle(
                                          color: Color(0xFF134FAF),
                                            fontSize: 19.0,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, right: 6),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                          height: 10,
                                                        ),
                                                        Card(
                                                          elevation: 50,
                                                          shadowColor:
                                                              Colors.white,
                                                          color: Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: SizedBox(
                                                            width: 280,
                                                            height: 100,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 10),
                                                              child: Column(
                                                                children: [
                                                                 
                                               Row(
                                                                    children: [
                                                                      Text(
                                                                        'drinking'.tr,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13.0,
                                                                            fontFamily:
                                                                                "Raleway",
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 7,
                                                                      ),
                                                                      Text(
                                                                        "${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["drinking"] : "----"}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13.0,
                                                                            fontFamily:
                                                                                "Raleway",
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                   SizedBox(
                                                          height: 10,
                                                        ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        'smoking'.tr,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13.0,
                                                                            fontFamily:
                                                                                "Raleway",
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 7,
                                                                      ),
                                                                      Text(
                                                                        "${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["smoking"] : "----"}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13.0,
                                                                            fontFamily:
                                                                                "Raleway",
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                   SizedBox(
                                                          height: 10,
                                                        ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        'other_languages'.tr,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13.0,
                                                                            fontFamily:
                                                                                "Raleway",
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 7,
                                                                      ),
                                                                      Text(
                                                                        "${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["other_languages"] : "----"}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13.0,
                                                                            fontFamily:
                                                                                "Raleway",
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                   SizedBox(
                                                          height: 10,
                                                        ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        'hobbies'.tr,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13.0,
                                                                            fontFamily:
                                                                                "Raleway",
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 7,
                                                                      ),
                                                                      Text(
                                                                        "${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["hobbies"] : "----"}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13.0,
                                                                            fontFamily:
                                                                                "Raleway",
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                      ),
                                                                    ],
                                                                  ),
                                            
                                                                 
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 20),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: Color(0xFF134FAF),
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Profile created by ${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["profile_for"] : "----"}',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontFamily: "Raleway",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap:(){
                                      Dialogs.materialDialog(
                                            msg:
                                                'Proposal contact info view',
                                                msgStyle: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                            ),
                                            // title: "Delete",
                                            color: Colors.white,
                                            context: context,
                                            dialogWidth: kIsWeb ? 0.3 : null,
                                            onClose: (value) => print(
                                                "returned value is '$value'"),
                                            actions: [
                                               SizedBox(
                                                height: 150,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'phone_no'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .fade,
                                                                    '${product['data'] != null && product['data']['userDetails'] != null && product['data']['userDetails']["auth_details"] != null ? product['data']['userDetails']["auth_details"]["mobile_number"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Card(
                                                        elevation: 50,
                                                        shadowColor:
                                                            Colors.white,
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: SizedBox(
                                                          width: 280,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'email'.tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .fade,
                                                                    '${product['data'] != null && product['data']['userDetails'] != null && product['data']['userDetails']["auth_details"] != null ? product['data']['userDetails']["auth_details"]["email"] : "----"}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      ],),),),
                                            ]);
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(top: 15, left: 20),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.contact_phone_rounded,
                                              color: Color(0xFF134FAF),
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'contact_info1'.tr,
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontFamily: "Raleway",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 10, left: 20),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.heat_pump_rounded,
                                            color: Color(0xFF134FAF),
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${product['data']['customerDetails']["personal_details"] != null ? "----" : product['data']['customerDetails']["personal_details"]["marital_details"]}',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontFamily: "Raleway",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 10, left: 20),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.heat_pump_rounded,
                                            color: Color(0xFF134FAF),
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20.0),
                                                      ),
                                                      isScrollControlled: true,
                                                      context: context,
                                                      builder: (BuildContext bc) {
                                                        return Container(
                                                            child: new Wrap(
                                                                children: <
                                                                    Widget>[
                                                              Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .symmetric(
                                                                      horizontal:
                                                                          8.0,
                                                                      vertical:
                                                                          8.0,
                                                                    ),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Center(
                                                                            child:
                                                                                Column(children: <Widget>[
                                                                              Container(
                                                                                padding: EdgeInsets.all(10),
                                                                                child: Table(
                                                                                  defaultColumnWidth: FixedColumnWidth(85.0),
                                                                                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                                                                                  border: TableBorder.all(color: Color(0xFF134FAF), style: BorderStyle.solid, width: 3.5),
                                                                                  children: [
                                                                                    TableRow(children: [
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'l'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["rasi"]["L"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["L"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'a'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["rasi"]["A"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["A"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'b'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["rasi"]["B"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["B"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'c'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["rasi"]["C"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["C"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                    TableRow(children: [
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'd'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["rasi"]["D"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["D"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(child: SizedBox.shrink()),
                                                                                      TableCell(child: SizedBox.shrink()),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'e'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["rasi"]["E"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["E"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                    TableRow(children: [
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'f'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["rasi"]["F"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["F"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(child: SizedBox.shrink()),
                                                                                      TableCell(child: SizedBox.shrink()),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'g'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["rasi"]["G"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["G"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                    TableRow(children: [
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'h'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["rasi"]["H"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["H"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'i'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["rasi"]["I"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["I"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'j'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["rasi"]["J"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["J"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'k'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["rasi"]["K"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["K"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                          ),
                                                                          Positioned(
                                                                            top:
                                                                                110,
                                                                            right:
                                                                                102.5,
                                                                            child:
                                                                                Container(
                                                                              height:
                                                                                  200.0,
                                                                              width:
                                                                                  170.0,
                                                                              color:
                                                                                  Colors.transparent,
                                                                              child: Container(
                                                                                  decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Color(0xFF134FAF), width: 3)),
                                                                                  child: new Center(
                                                                                    child: new Text(
                                                                                      'raasi'.tr,
                                                                                      style: TextStyle(fontFamily: "Raleway", fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )),
                                                              ),
                                                            ]));
                                                      });
                                                  //                                       SlidingUpPanel(
                                                  //   panel: Center(
                                                  //     child: Text("This is the sliding Widget"),
                                                  //   ),
                                                  //   body: Center(
                                                  //     child: Text("This is the Widget behind the sliding panel"),
                                                  //   ),
                                                  // );
                                                  //  Dialogs.materialDialog(
                                                  // msg:
                                                  //     'Proposal Community detailed view',
                                                  // // title: "Delete",
                                                  // color: Colors.white,
                                                  // context: context,
                                                  // dialogWidth: kIsWeb ? 0.1 : null,
                                                  // onClose: (value) => print(
                                                  //     "returned value is '$value'"),
                                                  // actions: [
                                                  //   SizedBox(
                                                  //     height: 300,)]);
                                                },
                                                child: Text(
                                                  'raasi_horoscopic'.tr,
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontFamily: "Raleway",
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 10, left: 20),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.heat_pump_rounded,
                                            color: Color(0xFF134FAF),
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20.0),
                                                      ),
                                                      isScrollControlled: true,
                                                      context: context,
                                                      builder: (BuildContext bc) {
                                                        return Container(
                                                            child: new Wrap(
                                                                children: <
                                                                    Widget>[
                                                              Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .symmetric(
                                                                      horizontal:
                                                                          8.0,
                                                                      vertical:
                                                                          8.0,
                                                                    ),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Center(
                                                                            child:
                                                                                Column(children: <Widget>[
                                                                              Container(
                                                                                padding: EdgeInsets.all(10),
                                                                                child: Table(
                                                                                  defaultColumnWidth: FixedColumnWidth(85.0),
                                                                                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                                                                                  border: TableBorder.all(color: Color(0xFF134FAF), style: BorderStyle.solid, width: 3.5),
                                                                                  children: [
                                                                                    TableRow(children: [
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'l'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["second"]["L"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["L"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'a'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["second"]["A"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["A"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'b'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["second"]["B"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["B"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'c'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["second"]["C"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["C"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                    TableRow(children: [
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'd'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["second"]["D"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["D"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(child: SizedBox.shrink()),
                                                                                      TableCell(child: SizedBox.shrink()),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'e'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["second"]["E"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["E"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                    TableRow(children: [
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'f'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["second"]["F"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["F"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(child: SizedBox.shrink()),
                                                                                      TableCell(child: SizedBox.shrink()),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'g'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["second"]["G"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["G"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                    TableRow(children: [
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'h'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["second"]["H"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["H"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'i'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["second"]["I"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["I"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'j'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["second"]["J"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["J"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      TableCell(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: const EdgeInsets.only(bottom: 55, left: 10),
                                                                                                        child: Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'k'.tr,
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Align(
                                                                                                      alignment: Alignment.center,
                                                                                                      child: SizedBox(
                                                                                                        height: 100,
                                                                                                        width: 100,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(top: 30),
                                                                                                          child: Text(
                                                                                                            '${product['data']['customerDetails']["horoscope"]["second"]["K"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["K"].join("\n" + " ") : ""}',
                                                                                                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                          ),
                                                                          Positioned(
                                                                            top:
                                                                                110,
                                                                            right:
                                                                                102.5,
                                                                            child:
                                                                                Container(
                                                                              height:
                                                                                  200.0,
                                                                              width:
                                                                                  170.0,
                                                                              color:
                                                                                  Colors.transparent,
                                                                              child: Container(
                                                                                  decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Color(0xFF134FAF), width: 3)),
                                                                                  child: new Center(
                                                                                    child: new Text(
                                                                                      'amsam'.tr,
                                                                                      style: TextStyle(fontFamily: "Raleway", fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )),
                                                              ),
                                                            ]));
                                                      });
                                                  //                                       SlidingUpPanel(
                                                  //   panel: Center(
                                                  //     child: Text("This is the sliding Widget"),
                                                  //   ),
                                                  //   body: Center(
                                                  //     child: Text("This is the Widget behind the sliding panel"),
                                                  //   ),
                                                  // );
                                                  //  Dialogs.materialDialog(
                                                  // msg:
                                                  //     'Proposal Community detailed view',
                                                  // // title: "Delete",
                                                  // color: Colors.white,
                                                  // context: context,
                                                  // dialogWidth: kIsWeb ? 0.1 : null,
                                                  // onClose: (value) => print(
                                                  //     "returned value is '$value'"),
                                                  // actions: [
                                                  //   SizedBox(
                                                  //     height: 300,)]);
                                                },
                                                child: Text(
                                                  'amsam_horoscopic'.tr,
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontFamily: "Raleway",
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 10, right: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Card(
                                        elevation: 50,
                                        // shadowColor: Color(0xFF134FAF),
                                        color: Color(0xFF134FAF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: SizedBox(
                                          width: 275,
                                          height: 80,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20, left: 20),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'jathagam_available'.tr,
                                                        style: TextStyle(
                                                            fontSize: 13.0,
                                                            fontFamily: "Raleway",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'download_jathagam'.tr,
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontFamily: "Raleway",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                CupertinoIcons
                                                    .cloud_download_fill,
                                                color: Colors.white,
                                                size: 40,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * (4 / 9) - 200 / 2,
            left: 10,
            right: 10,
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
                  width: 10,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            child: Container(
                                child: Column(
                              children: [
                                Icon(Ionicons.person_circle_outline,
                                    color: Color(0xFF134FAF)),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'edit_profile'.tr,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            child: Container(
                                child: Column(
                              children: [
                                Icon(Ionicons.person_circle_outline,
                                    color: Color(0xFF134FAF)),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'friends'.tr,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            child: Container(
                                child: Column(
                              children: [
                                Icon(Ionicons.person_circle_outline,
                                    color: Color(0xFF134FAF)),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'post_feed'.tr,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                          ),
                    ],
                  ),
                ),
              ),
            ),

            // Card(

            //    elevation: 50,
            //             shadowColor: Colors.white,
            //             color: Colors.white,
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(20.0),
            //             ),
            //     child: SizedBox(
            //       width: 150,
            //       child: Padding(
            //         padding:EdgeInsets.all(30.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             Container(
            //               child:Column(
            //                 children: [
            //                   Icon(Ionicons.person_add_outline),
            //                   SizedBox(height: 5.0,),
            //                   Text("sent proposal",
            //                   style: TextStyle(
            //                     fontSize: 15.0,
            //                   ),)
            //                 ],
            //               )
            //             ),

            //             Container(
            //               child: Column(
            //               children: [
            //                 Icon(Ionicons.heart_circle),
            //                 SizedBox(height: 5.0,),
            //                 Text('wishlist',
            //                   style: TextStyle(
            //                     fontSize: 15.0,
            //                   ),)
            //               ]),
            //             ),

            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
          ),
        ],
      ),
    );
  }
}
