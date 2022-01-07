import 'package:oi_app/core/services/auth_service.dart';
import 'package:oi_app/utils/page_navigation.dart';
import 'package:oi_app/views/home_page/home_page.dart';
import '../auth_view.dart';

class SplashViewData{

  static nextPage2(context){
    Future.delayed(const Duration(seconds: 2), () async{

      final bool loggedIn = await AuthService().checkUserLoginStatus();
      if(loggedIn){
        //offAll(AuthView());

        offAll(const HomePage());
      }else{
        offAll(AuthView());
      }


    });
  }
}