import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thirumanam/views/profile/commons/radial_progress.dart';
import 'package:thirumanam/views/profile/commons/rounded_image.dart';
import 'package:thirumanam/views/profile/styleguide/text_style.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                
                onTap: (){
                  print("object");
                },
                child: RadialProgress(
                  width: 4,
                  goalCompleted: 0.9,
                  child: RoundedImage(
                    imagePath: "https://lh3.googleusercontent.com/ogw/AOh-ky0hZdAOkIToEv-0GuZnQW4GcfUbCgNWK2ye7WMZAHM=s32-c-mo",
                    size: Size.fromWidth(120.0),
                    
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Balaji",
                    style: whiteNameTextStyle,
                  ),
                  Text(
                    ", 25",
                    style: whiteNameTextStyle,
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/location_pin.png",
                      width: 20.0,
                      color: Colors.white,
                    ),
                    Text(
                      "Maduari",
                      style: whiteSubHeadingTextStyle,
                    )
                  ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
