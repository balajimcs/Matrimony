import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/app_routes.dart';

class MyHomePage extends StatelessWidget {  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(title: Text("title",style: TextStyle(color: Colors.black),), backgroundColor: Colors.white,),  
      body: Center(child: Text(  
          'A drawer is an invisible side screen.',  
          style: TextStyle(fontSize: 20.0),  
          )  
      ),  
      drawer: Drawer(  
        child: ListView(  
          // Important: Remove any padding from the ListView.  
          padding: EdgeInsets.zero,  
          children: <Widget>[  
            UserAccountsDrawerHeader(  
              accountName: Text("Abhishek Mishra"),  
              accountEmail: Text("abhishekm977@gmail.com"),  
              currentAccountPicture: CircleAvatar(  
                backgroundColor: Colors.orange,  
                child: Text(  
                  "A",  
                  style: TextStyle(fontSize: 40.0),  
                ),  
              ),  
            ),  
            ListTile(  
              leading: Icon(Icons.home), title: Text("detailedFilter"),  
              onTap: () {  
                Get.toNamed(RouteNames.detailedFilter);  
              },  
            ),
            ListTile(  
              leading: Icon(Icons.home), title: Text("wishList"),  
              onTap: () {  
                Get.toNamed(RouteNames.wishList);
              },  
            ),  
            ListTile(  
              leading: Icon(Icons.settings), title: Text("sendProposal"),  
              onTap: () {  
                Get.toNamed(RouteNames.sendProposal);  
              },  
            ),  
            ListTile(  
              leading: Icon(Icons.contacts), title: Text("receiviedProprosal"),  
              onTap: () {  
                Get.toNamed(RouteNames.receiviedProprosal);  
              },  
            ),
            ListTile(  
              leading: Icon(Icons.contacts), title: Text("storyPost"),  
              onTap: () {  
                Get.toNamed(RouteNames.storyPost);  
              },  
            ),
            ListTile(  
              leading: Icon(Icons.contacts), title: Text("detailedPage"),  
              onTap: () {  
                Get.toNamed(RouteNames.detailedPage);  
              },  
            ),
            ListTile(  
              leading: Icon(Icons.contacts), title: Text("profile"),  
              onTap: () {  
                Get.toNamed(RouteNames.profile);  
              },  
            ),
            ListTile(  
              leading: Icon(Icons.contacts), title: Text("myDetails"),  
              onTap: () {  
                Get.toNamed(RouteNames.myDetails);  
              },  
            ),
            ListTile(  
              leading: Icon(Icons.contacts), title: Text("myPostFeed"),  
              onTap: () {  
                Get.toNamed(RouteNames.myPostFeed);  
              },  
            ),
            
          ],  
        ),  
      ),  
    );  
  }  
}  





