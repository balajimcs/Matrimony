import 'dart:async';
import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coolicons/coolicons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:thirumanam/controller/package_controller.dart';
import 'package:thirumanam/controller/received_proposal_controller.dart';
import 'package:thirumanam/controller/wishlist_controller.dart';
import 'package:thirumanam/models/payment_model.dart';
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


class LoginEnlargeStrategyDemo extends StatefulWidget {
   @override
  LoginEnlargeStrategyDemoState createState() => LoginEnlargeStrategyDemoState();
}

class LoginEnlargeStrategyDemoState extends State<LoginEnlargeStrategyDemo> {
final controller = Get.find<PackageController>();
  var _razorpay = Razorpay();
  

  var amount = 500;
  @override
  void initState(){
    
_razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
_razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
_razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }
  void initRazorpay() {
  _razorpay = new Razorpay();
  
}
    
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
  // Do something when payment succeeds
  print("succeeds");
  String paymentId = response.paymentId.toString();
  String signature = response.signature.toString();
  String orderId = response.orderId.toString();
  print(paymentId);
  print(signature);
  print(orderId);
  controller.paymentVerify(orderId, paymentId, signature, context);
  print(controller.paymentVerify(orderId, paymentId, signature, context));
}

void _handlePaymentError(PaymentFailureResponse response) {
  // Do something when payment fails
  print("fails");
}

void _handleExternalWallet(ExternalWalletResponse response) {
  // Do something when an external wallet was selected
}
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      body:  Stack(
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
            Positioned(
              top: 40,
              left: 40,
              child: Row(
                children: [
                  
                   Text(
                'pricing'.tr,
                style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
              ),
              SizedBox(width: 150,),
               InkWell(
                onTap: (){
                  Get.toNamed(RouteNames.login);
                },
                 child: Text(
                  'Go to Login',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
                             ),
               ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Container(
                
        child: FutureBuilder<Map<String, dynamic>>(
          future: controller.fetchPayment(),
                    
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
                            var foodList = snapshot.data;
                             return foodList!.length == 0
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
                                :  _buildProductCard(snapshot.data);


                          }
                      }
                    }
        )
        
        
      ),
            )
          ],
        ),
      );
      
    
    
  }
  @override
  void dispose() {
    _razorpay.clear(); 
    super.dispose();
  }
                      Widget _buildProductCard(product) {            
                               return Scaffold(
                                 body: CarouselSlider(
                                         options: CarouselOptions(
                                           height: 500,
                                           autoPlay: true,
                                           aspectRatio: 2.0,
                                           enlargeCenterPage: true,
                                           enlargeStrategy: CenterPageEnlargeStrategy.height,
                                         ),
                                         items: [
                                           Card(
                                               elevation: 50,
                                               shadowColor: Colors.white,
                                               color: Colors.white,
                                               shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(20.0),
                                               ),
                                               child: SizedBox(
                                                   width: 380,
                                                   height: 240,
                                                   child: SingleChildScrollView(
                                                     child: Column(
                                                       children: [
                                                         Container(
                                                           height: 150,
                                                           width: MediaQuery.of(context).size.width,
                                                           decoration: BoxDecoration(
                                                             borderRadius: BorderRadius.circular(10),
                                                             color: Color(0xFF134FAF),
                                                           ),
                                                           child: Padding(
                                                             padding: const EdgeInsets.only(top: 20),
                                                             child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${product['data']['getAllPackageDetails'][0]['package_title']}',
                                      style: TextStyle(
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "${product['data']['getAllPackageDetails'][0]['package_currency']} ${product['data']['getAllPackageDetails'][0]['package_base_price']} / ${product['data']['getAllPackageDetails'][0]['package_validity']} Months",
                                      style: TextStyle(
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                  ],
                                                             ),
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 25,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'view_details'.tr,
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'view_details'.tr,
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'view_details'.tr,
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'view_details'.tr,
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "View Details",
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "View Details",
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 20,
                                                         ),
                                                         ElevatedButton(
                                                           style: ElevatedButton.styleFrom(
                                                             primary: Color(0xFF134FAF),
                                                             shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                                           ),
                                                           child: Text('get_started'.tr),
                                                           onPressed: () {
                                                            controller.createOrder(product['data']['getAllPackageDetails'][0]['_id'], context);
                                                             var options = {
                                 'order_id': controller.orderid.value.toString(),                             
                                 'key': 'rzp_test_2zFSMnOAr6frUe',
                                 'amount': product['data']['getAllPackageDetails'][0]['package_base_price'] * 100,
                                 'name': 'Tamil Vivaham',
                                 'description': 'Premium Pay',
                                 'timeout': 60,
                                 'prefill': {
                                   'contact': '8940294208',
                                   'email': 'balaji@anainfo.co.thirumanam'
                                 }
                               };
                                                             try{
                                  _razorpay.open(options); 
                                                             }catch(e){
                                  debugPrint(e.toString());
                                                             }
                                                           },
                                                         ),
                                                       ],
                                                     ),
                                                   ))),
                                             Card(
                                               elevation: 50,
                                               shadowColor: Colors.white,
                                               color: Colors.white,
                                               shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(20.0),
                                               ),
                                               child: SizedBox(
                                                   width: 380,
                                                   height: 240,
                                                   child: SingleChildScrollView(
                                                     child: Column(
                                                       children: [
                                                         Container(
                                                           height: 150,
                                                           width: MediaQuery.of(context).size.width,
                                                           decoration: BoxDecoration(
                                                             borderRadius: BorderRadius.circular(10),
                                                             color: Color(0xFF134FAF),
                                                           ),
                                                           child: Padding(
                                                             padding: const EdgeInsets.only(top: 20),
                                                             child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${product['data']['getAllPackageDetails'][1]['package_title']}',
                                      style: TextStyle(
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "${product['data']['getAllPackageDetails'][1]['package_currency']} ${product['data']['getAllPackageDetails'][1]['package_base_price']} / ${product['data']['getAllPackageDetails'][1]['package_validity']} Months",
                                      style: TextStyle(
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                  ],
                                                             ),
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 25,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'view_details'.tr,
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'view_details'.tr,
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'view_details'.tr,
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'view_details'.tr,
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "View Details",
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "View Details",
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 20,
                                                         ),
                                                         ElevatedButton(
                                                           style: ElevatedButton.styleFrom(
                                                             primary: Color(0xFF134FAF),
                                                             shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                                           ),
                                                           child: Text('get_started'.tr),
                                                           onPressed: () {
                                                            controller.createOrder(product['data']['getAllPackageDetails'][1]['_id'], context);
                                                             var options = {
                                                              'order_id': controller.orderid.value.toString(),
                                 'key': 'rzp_test_2zFSMnOAr6frUe',
                                 'amount': product['data']['getAllPackageDetails'][1]['package_base_price'] * 100,
                                 'name': 'Tamil Vivaham',
                                 'description': 'Basic Pay',
                                 'timeout': 60,
                                 'prefill': {
                                   'contact': '8940294208',
                                   'email': 'balaji@anainfo.co.thirumanam'
                                 }
                               };
                                                             try{
                                  _razorpay.open(options); 
                                                             }catch(e){
                                  debugPrint(e.toString());
                                                             }
                                                           },
                                                         ),
                                                       ],
                                                     ),
                                                   ))),
                                         
                                          Card(
                                               elevation: 50,
                                               shadowColor: Colors.white,
                                               color: Colors.white,
                                               shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(20.0),
                                               ),
                                               child: SizedBox(
                                                   width: 380,
                                                   height: 240,
                                                   child: SingleChildScrollView(
                                                     child: Column(
                                                       children: [
                                                         Container(
                                                           height: 150,
                                                           width: MediaQuery.of(context).size.width,
                                                           decoration: BoxDecoration(
                                                             borderRadius: BorderRadius.circular(10),
                                                             color: Color(0xFF134FAF),
                                                           ),
                                                           child: Padding(
                                                             padding: const EdgeInsets.only(top: 20),
                                                             child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${product['data']['getAllPackageDetails'][2]['package_title']}',
                                      style: TextStyle(
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "${product['data']['getAllPackageDetails'][2]['package_currency']} ${product['data']['getAllPackageDetails'][2]['package_base_price']} / ${product['data']['getAllPackageDetails'][2]['package_validity']} Months",
                                      style: TextStyle(
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                  ],
                                                             ),
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 25,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'view_details'.tr,
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'view_details'.tr,
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'view_details'.tr,
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'view_details'.tr,
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "View Details",
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 10,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 25),
                                                           child: Row(
                                                             children: [
                                  Icon(
                                    Icons.donut_large_sharp,
                                    color: Color(0xFF134FAF),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "View Details",
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF134FAF),
                                        fontSize: 15),
                                  ),
                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 20,
                                                         ),
                                                         ElevatedButton(
                                                           style: ElevatedButton.styleFrom(
                                                             primary: Color(0xFF134FAF),
                                                             shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                                           ),
                                                           child: Text('get_started'.tr),
                                                           onPressed: () {
                                                            controller.createOrder(product['data']['getAllPackageDetails'][2]['_id'], context);
                                                             var options = {
                                                              'order_id': controller.orderid.value.toString(),
                                 'key': 'rzp_test_2zFSMnOAr6frUe',
                                 'amount': product['data']['getAllPackageDetails'][2]['package_base_price'] * 100,
                                 'name': 'Tamil Viavaham',
                                 'description': 'VIP Pay',
                                 'timeout': 60,
                                 'prefill': {
                                   'contact': '8940294208',
                                   'email': 'balaji@anainfo.co.thirumanam'
                                 }
                               };
                                                             try{
                                  _razorpay.open(options); 
                                                             }catch(e){
                                  debugPrint(e.toString());
                                                             }
                                                           },
                                                         ),
                                                       ],
                                                     ),
                                                   ))),
                                         
                                          
                                          ],
                                       ),
                               );
                    }

}