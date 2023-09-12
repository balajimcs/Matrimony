import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:thirumanam/views/profile/styleguide/colors.dart';

class OpaqueImage extends StatelessWidget {

  final imageUrl;

  const OpaqueImage({Key? key, @required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CachedNetworkImage(
           imageUrl: imageUrl,
                      height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.contain,
        ),
        // Image(image: NetworkImage(imageUrl)
        //   ,
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   fit: BoxFit.fill,
        // ),
        Container(
          color: Colors.black.withOpacity(0.4),
        ),
      ],
    );
  }
}
