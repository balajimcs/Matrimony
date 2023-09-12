import 'package:flutter/material.dart';
import 'package:thirumanam/views/profile/styleguide/text_style.dart';

class TwoLineItem extends StatelessWidget {
  final String firstText, secondText;

  const TwoLineItem({Key? key, required this.firstText, required this.secondText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          firstText,
          style: TextStyle(
                      color: Colors.black, fontFamily: "Raleway", fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5,),
        Text(
          secondText,
          style: TextStyle(
                      color: Colors.black, fontFamily: "Raleway", fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
