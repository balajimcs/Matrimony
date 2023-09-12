import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:lottie/lottie.dart';
import '../../resources/app_routes.dart';

class PendingApproval extends StatefulWidget {
   State<PendingApproval> createState() => PendingApprovalState();
}

class PendingApprovalState extends State<PendingApproval> {


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
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/7.4),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white
              ),
            ),
            Positioned(
              top: 50,
              left: 115,
              child: 
                   Center(
                     child: Text(
                "Pending Approval",
                style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.w900),
              ),
                   ),
                
            ),
             
           Padding(
              padding: const EdgeInsets.only(top: 160),
              child: Container(
                height: 500,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                            height: 600,
                            width: 600,
                            alignment: AlignmentDirectional.center,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Lottie.asset(
                                    "assets/loading/waiting.json",
                                  ),
                                ),
                                Text("We\'re evaluating your profile", textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black, fontSize: 20),),
                                
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Expanded(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                              textDirection: TextDirection.ltr,
                                              maxLines: 10,
                                      "I regret happy to inform you that my profile has been approved by the administrator. I am currently waiting for their approval and will notify you as soon as my profile has been approved.", textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.grey, fontSize: 17),),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: InkWell(
      onTap: () {
        Get.toNamed(RouteNames.login);
      },
      child: Container(
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Color(0xFF134FAF), width: 2),
          color: Colors.white
        ),
        child: Text(
          'Go Back',
          style: TextStyle(fontSize: 20, color: Color(0xFF134FAF)),
        ),
      ),
    ),
                                ),
                              ],
                            )
                            
                            ),
                            
                ),
                
              ),
      
            )
          ],
        ),
    );
  }

  



}