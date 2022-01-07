import 'package:flutter/material.dart';
import 'package:oi_app/core/const_data.dart';

class CircularProgressIndicators extends StatelessWidget {

  const CircularProgressIndicators({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          valueColor:AlwaysStoppedAnimation(lightColor),
          backgroundColor: darkColor,
        )
      ],
    );
  }
}
