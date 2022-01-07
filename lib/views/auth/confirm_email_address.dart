import 'package:flutter/material.dart';
import 'package:oi_app/core/const_data.dart';
import 'package:oi_app/utils/page_navigation.dart';
import 'package:oi_app/views/login/login.dart';
import 'package:oi_app/widgets/button.dart';
class ConfirmEmailAddress extends StatefulWidget {
  const ConfirmEmailAddress({Key key}) : super(key: key);

  @override
  _ConfirmEmailAddressState createState() => _ConfirmEmailAddressState();
}

class _ConfirmEmailAddressState extends State<ConfirmEmailAddress> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              GestureDetector(
                  onTap: ()=>back(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.cancel,color: lightColor,size:30,),
                  ))
            ],
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(' Get Started',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily: 'Archivo'
              ),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('  A link has been sent to your email address\n  to verify your account',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButtonCustom(
                borderColor: darkColor,
                btnColor: purpleColor,
                height: 50,
                width: double.maxFinite,
                borderRadius: 12,
                btnText: 'Back to  Sign in',
                btnTextColor:Colors.white,
                onPressed: (){
                  offAll(Login());
                }),
          ),
          SizedBox(height: 20,)
        ],
      ),
    ));
  }
}
