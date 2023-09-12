import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thirumanam/controller/splash_controller.dart';
import 'package:thirumanam/resources/app_colors.dart';

class Splash extends StatelessWidget {
   Splash({Key? key}) : super(key: key);

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: AppColors.white,
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
  }
}
