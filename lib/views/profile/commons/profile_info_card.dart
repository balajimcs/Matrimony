import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/views/profile/commons/two_line_item.dart';
import 'package:thirumanam/views/profile/styleguide/colors.dart';

class ProfileInfoCard extends StatelessWidget {
  final firstText, secondText, hasImage, imagePath;
  final Function onPressed;

  const ProfileInfoCard({Key? key, this.firstText, required this.onPressed, this.secondText, this.hasImage = false, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:  InkWell(
        onTap: (){
          Get.toNamed(RouteNames.myDetails);
                                  print("aa");
        },
        child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: hasImage
                ? Center(
                  child: Image.asset(
                      imagePath,
                      color: primaryColor,
                      width: 25,
                      height: 25,
                    ),
                )
                : TwoLineItem(
                    firstText: firstText,
                    secondText: secondText,
                  ),
                  
          ),
      ),
      
    );
  }
}
