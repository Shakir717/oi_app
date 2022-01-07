import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oi_app/core/const_data.dart';
import 'package:oi_app/core/services/auth_service.dart';
import 'package:oi_app/utils/field_validation.dart';
import 'package:oi_app/utils/page_navigation.dart';
import 'package:oi_app/widgets/boolean_values.dart';
import 'package:oi_app/widgets/button.dart';
import 'package:oi_app/widgets/circular_progress_indicator.dart';
import 'package:oi_app/widgets/text_field.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPassword=TextEditingController();
  TextEditingController newPassword=TextEditingController();
  final _key=GlobalKey<FormState>();
  final fieldValidation=FieldValidation();

  @override
  Widget build(BuildContext context) {
    Get.put(BooleanValues());
    return SafeArea(child: Scaffold(
      body: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const  SizedBox(height: 20,),
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
            const SizedBox(height: 80,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(' Change Password',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontFamily: 'Archivo'
                ),),
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldCustom(
                validator: (value) => fieldValidation.passwordField(value),
                controller:oldPassword,
                hintText:'Old password' ,
                hintTextColor: lightColor,
                backgroundColor: darkColor,
                borderColor: lightColor,
                textColor: lightColor,
                borderRadius: 12,
                borderSide: true,
                borderWidth: .2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldPassword(
                validator: (value) => fieldValidation.passwordField(value),
                controller:newPassword,
                hintText:'New Password' ,
                hintTextColor: lightColor,
                backgroundColor: darkColor,
                borderColor: lightColor,
                textColor: lightColor,
                borderRadius: 12,
                borderSide: true,
                suffixIconData: Icons.remove_red_eye_rounded,
                borderWidth: .2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<BooleanValues>(builder:(_){
              return Column(
                children: [
                  if(_.isLoading)...
                  [ const CircularProgressIndicators()]

                  else...[ _login(_) , ],
                ],
              );
            }),

          ],
        ),
      ),
    ));
  }
  _login(BooleanValues controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButtonCustom(
          borderColor: darkColor,
          btnColor: purpleColor,
          height: 60,
          width: double.maxFinite,
          borderRadius: 12,
          btnText: 'Change Password',
          btnTextColor:Colors.white,
          onPressed: (){
            if(_key.currentState.validate()){
              AuthService().changePassword(oldPassword: oldPassword.text,newPassword: newPassword.text);
            }
          }),
    );
  }

}
