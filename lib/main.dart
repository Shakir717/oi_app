import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:oi_app/utils/appTheme.dart';
import 'package:oi_app/utils/http_client.dart';
import 'package:oi_app/views/auth/splash/second_splash.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'core/const_data.dart';
import 'core/model/card_details.dart';


void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  List<CardDetails> cardDetail = await HttpClients().allCards();
  // set constant data
  cardDetails=cardDetail;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

   const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      home: const SplashSecond(),
      builder: (context, widget) => ResponsiveWrapper.builder(widget,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background:  Container(color: const Color(0xFFF5F5F5))),
    );
  }
}

