import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/home_controller.dart';
import 'package:thirumanam/views/dashboard/dashboard_page.dart';
import 'package:thirumanam/views/profile/profile_page_edit.dart';
import 'package:thirumanam/views/profile_user/user_profile_page.dart';
import 'package:thirumanam/views/proposal_page/wishlist_page.dart';

import '../../resources/app_colors.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        bottomNavigationBar: buildBottomNavigationMenu(context),
         body: Obx(() => IndexedStack(
        index: controller.tabIndex.value,
        children: [
          controller.tabIndex.value == 0 ? DashboradPage() : Container(),
          controller.tabIndex.value == 1
              ? WishListReceived()
              : Container(),
          controller.tabIndex.value == 2 ? ProfileScreen() : Container(),
          // controller.tabIndex.value == 4 ? TaskView() : Container()
        ],
      )),
         
    );
  }


  buildBottomNavigationMenu(context) {
    final TextStyle unselectedLabelStyle = TextStyle(
        color: Colors.black.withOpacity(0.5),
        fontWeight: FontWeight.w500,
        fontSize: 12);

    const TextStyle selectedLabelStyle = TextStyle(
        color: AppColors.primaryColor, fontWeight: FontWeight.w500, fontSize: 12);

    return Obx(() => BottomNavigationBar(
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      onTap: controller.changeTabIndex,
      currentIndex: controller.tabIndex.value,
      backgroundColor: AppColors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: AppColors.primaryColor,
      unselectedLabelStyle: TextStyle(
          color: AppColors.primaryColor, fontWeight: FontWeight.w500, fontSize: 12),
      selectedLabelStyle: TextStyle(
          color: AppColors.primaryColor, fontWeight: FontWeight.w500, fontSize: 12),
      items: [
        BottomNavigationBarItem(
          icon: Container(
            child: controller.tabIndex.value == 0
                ? SvgPicture.asset('assets/images/home.svg', height: 30, width: 30,color: AppColors.primaryColor,)
                : SvgPicture.asset('assets/images/home.svg', color: AppColors.darkGrey,height: 30, width: 30,),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Container(
            child: controller.tabIndex.value == 1
                ? SvgPicture.asset('assets/images/wishlist.svg',height: 30, width: 30,color: AppColors.primaryColor,)
                : SvgPicture.asset('assets/images/wishlist.svg', color: AppColors.darkGrey,height: 30, width: 30,),
          ),
          label: 'WishList',
        ),
        BottomNavigationBarItem(
          icon: Container(
            child: controller.tabIndex.value == 2
                ? SvgPicture.asset('assets/images/profile.svg',height: 30, width: 30,color: AppColors.primaryColor,)
                : SvgPicture.asset('assets/images/profile.svg', color: AppColors.darkGrey,height: 30, width: 30,),
          ),
          label: 'Profile',
        ),
      ],
    ));
  }

  buildNavigationDrawer(context){
    return  Drawer(

        child: ListView(

        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'John Doe',
                ),
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Sent Proposals'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Recevied Proposals'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('List Proposals'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ]));
  }


}
