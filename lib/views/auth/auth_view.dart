import 'package:flutter/material.dart';
import 'package:oi_app/core/const_data.dart';
import 'package:oi_app/utils/page_navigation.dart';
import 'package:oi_app/views/login/login.dart';
import 'package:oi_app/views/signup/sign_up.dart';
import 'package:oi_app/widgets/button.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key key}) : super(key: key);

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: darkColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment:CrossAxisAlignment.center,
          children:  [
           const SizedBox(
               height: 200,
             ),
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text('Perfect The Points',style:TextStyle(
              color: lightColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Archivo'
            ),),
            const SizedBox(
              height:250,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButtonCustom(
                borderColor: darkColor,
                  btnColor: purpleColor,
                  height: 60,
                  width: double.maxFinite,
                  borderRadius: 12,
                  btnText: 'Sign up',
                  onPressed: (){
                  to(const SignUpWidget());
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButtonCustom(
                  borderColor: darkColor,
                  btnColor: lightColor,
                  height: 60,
                  width: double.maxFinite,
                  borderRadius: 12,
                  btnText: 'Login',
                  btnTextColor: Colors.black,
                  onPressed: (){
                    to(const Login());
                  }),
            ),
            const SizedBox(
              height: 20,
            ),

          ],),
      ),
    );
  }
}