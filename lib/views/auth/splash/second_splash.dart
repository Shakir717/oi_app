import 'package:flutter/material.dart';
import 'package:oi_app/views/auth/splash/splash_view_data.dart';

class SplashSecond extends StatelessWidget {
  const SplashSecond({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    /// move next page after 1 second
    SplashViewData.nextPage2(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 100,
          height: 100,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  buildBoxDecoration({String imagePath}) {
    return BoxDecoration(
      image:DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(imagePath),
      ),
    );
  }
}
