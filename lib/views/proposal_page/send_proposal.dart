import 'dart:async';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:coolicons/coolicons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:thirumanam/controller/sent_proposal_controller.dart';
import 'package:thirumanam/models/send_proposal_model.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/views/auth/detailed_page.dart';

class SendReceived extends StatefulWidget {
   State<SendReceived> createState() => SendReceivedState();
}

class SendReceivedState extends State<SendReceived> {

    TextEditingController SearchController = TextEditingController(text: '');
final controller = Get.find<SentProporsalController>();
 final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 @override
  void initState(){
    super.initState();
    controller.fetchSentProposal();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: RefreshIndicator(
         color: Colors.white,
backgroundColor: Colors.orangeAccent,
displacement: 200,
strokeWidth: 4,
triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () { 
            
          return controller.fetchSentProposal();
            
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
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/4.4),
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
              top: 20,
              left: 5,
              child: Row(
                children: [
                  IconButton(
                    onPressed:()=> Navigator.pop(context),
                                icon: Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 25,),
                  ),
                   Text(
                "Send Proposal - 250 Connections",
                style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
              ),
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
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
                                    microseconds: 500),
                                    () {
                                  controller.fetchSentProposal();
                                });
                          },
      
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Color(0xFF134FAF),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: SearchController.clear,
                                  ),
                                  hintText: 'Search Proposal',
                                  hintStyle: TextStyle(color: Color(0xFF134FAF)),
                                  border: InputBorder.none),
                            ),
          ),
        ),
        Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: Row(
                        children: [
                          Text("Sort by:",
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
                              Dialogs.materialDialog(
                                    useSafeArea: true,
                                    msg: 'Search by Recently Added',
                                    msgStyle: TextStyle(fontFamily: "Raleway",
                                                        fontWeight: FontWeight.bold,
                                                        color: Color(0xFF134FAF)),
                                    // title: "Delete",
                                    color: Colors.white,
                                    context: context,
                                    dialogWidth: kIsWeb ? 0.3 : null,
                                    onClose: (value) =>
                                        print("returned value is '$value'"),
                                    actions: [
                                      SizedBox(
                                          height: 120,
                                          child: SingleChildScrollView(
                                            child: Column(children: [
                                              
                                             
                                              CustomDropdown(
                                                fillColor:
                                                    Colors.grey.withOpacity(0.2),
                                                // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                                fieldSuffixIcon: Icon(
                                                  Icons.arrow_drop_down_circle,
                                                  color: Colors.blue,
                                                ),
                                                hintText: 'Recently Added',
                                                items: const [
                                                  'recently_added',
                                                ],
                                                 onChanged: (value) {
                                                  controller.Recently = value;
                                                  print(value);
                                                },
                                                controller: controller.RecentlyController,
                                              ),
                                               SizedBox(
                                                height: 20,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF134FAF),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(20))),
                                                ),
                                                child: Text("Search"),
                                                onPressed: () {
                                                  setState(() {
                                                    controller.fetchSentProposal();  
                                                  });
                                                   controller.RecentlyController.clear();
                                                   
                                                  Get.back();
                                                },
                                              ),
                                            ]),
                                          ))
                                    ]);
                            },
                            child: Row(
                              children: [
                                Text("Search by filter",
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
                          )
                        ],
                      ),
                    ),
                ],
              )
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
                child: StreamBuilder<List<sendProprosalModel>>(
            stream: controller.getFilteredModel(),
            initialData: [],
            builder: (context, snapshot){
           if (snapshot.connectionState == ConnectionState.done) {
                          // print(snapshot.data);
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(child: Center(
          child: Container(
              height: 80,
              width: 80,
              alignment: AlignmentDirectional.center,
              child: Lottie.asset(
                "assets/loading/heart.json",
              )),
        ),);
                          default:
                            if (snapshot.hasError) {
                              return Center(child: Text('Some error occurred!'));
                            } else {
                              print("snapshot.data");
                              print(snapshot.data);
      
            
            List<sendProprosalModel> foodList = snapshot.data!
                            .where((item) =>
              item.firstName.toLowerCase().contains(controller.searchController.text.toLowerCase()) || 
              item.lastName.toLowerCase().contains(controller.searchController.text.toLowerCase()))
          .toList();
            print(foodList);
            // print(foodList!.length);
            print("foodList");
            return  
            foodList.length == 0 ? Container(child: Center(child: Text("You didn't sent any request", style: TextStyle(fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.grey),),),):
            
            
          ListView.builder(
            itemCount: foodList.length,
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
                  
                print(foodList);
            return InkWell(
              onTap: (){
                 Navigator.push(  
    context,  
    MaterialPageRoute(builder: (context) => DetailPage(idMatch: food.userId,)));
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, left: 13, right: 13),
                  child: Card(
                    // margin: EdgeInsets.symmetric(vertical: 20),
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
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 18, left: 10),
                                  child: CircleAvatar(
                          // backgroundColor: Colors.black,
                          radius: 30,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage("${food.attachements!.length != 0 ? food.attachements![0].url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}"))),
                                ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 22, left: 12),
                                  child: Column(
                                    
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("${food.firstName} ${food.lastName}", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),)),
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
                              Container(
                                
                                child: Padding(
                                    
                                    padding: const EdgeInsets.only(bottom: 20, right: 15),
                                    child: InkWell(
                                                onTap: (){
                                                   Dialogs.materialDialog(
                                    useSafeArea: true,
                                    msg: "Sent Request",
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
                                                child: Text("Did you want to withdraw the request", textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
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
                                                      controller.withdrawProposal(food.id, context);
                                                      print(controller.withdrawProposal(food.id, context));
                                                            
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
                                                  
                                                    
                                                    controller.update();  
                                                },
                                                child: Container(
                                                  width: 80,
                                                  height: 30,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(25)),
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                            color:
                                                                Colors.grey.shade200,
                                                            offset: Offset(2, 4),
                                                            blurRadius: 5,
                                                            spreadRadius: 2)
                                                      ],
                                                      gradient: LinearGradient(
                                                          begin: Alignment.centerLeft,
                                                          end: Alignment.centerRight,
                                                          colors:
                                                              [Color(0xFF134FAF), Color(0xFF134FAF)])),
                                                  child: Text(
                                                    'Withdraw',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold,),
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
    );
  }

  



}