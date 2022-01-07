import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oi_app/core/const_data.dart';
import 'package:oi_app/core/model/card_details.dart';
import 'package:oi_app/core/model/user_profile.dart';
import 'package:oi_app/core/services/auth_service.dart';
import 'package:oi_app/utils/field_validation.dart';
import 'package:oi_app/utils/page_navigation.dart';
import 'package:oi_app/views/legal/privacy_policy.dart';
import 'package:oi_app/views/legal/terms_of_services.dart';
import 'package:oi_app/widgets/boolean_values.dart';
import 'package:oi_app/widgets/button.dart';
import 'package:oi_app/widgets/circular_progress_indicator.dart';
import 'package:oi_app/widgets/rounded_card.dart';
import 'package:oi_app/widgets/snackbar.dart';
import 'package:oi_app/widgets/text_field.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController firstName=TextEditingController();
  TextEditingController lastName=TextEditingController();
  TextEditingController emailAddress=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  String cardName='';
  String points='';
  int groupValue;
  Map<String, dynamic> cardList={};
  final _key=GlobalKey<FormState>();
  final fieldValidation=FieldValidation();


  @override
  Widget build(BuildContext context) {
    Get.put(BooleanValues());
    return SafeArea(
        child: Scaffold(
          body: Form(
            key: _key,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment:CrossAxisAlignment.center,
                children:  [
                  const  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      GestureDetector(
                          onTap: ()=>back(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.clear,color: lightColor,size:30,),
                          ))
                    ],
                  ),
                  const SizedBox(height: 70,),

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
                const SizedBox(height: 10,),
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldCustom(
                    validator: (value) => fieldValidation.fieldRequired(value),
                    controller:firstName,
                    hintText:'First Name' ,
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
                    child: TextFieldCustom(
                      validator: (value) => fieldValidation.fieldRequired(value),
                      controller:lastName,
                      hintText:'Last Name' ,
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
                    child: TextFieldCustom(
                      validator: (value) => fieldValidation.emailField(value),
                      controller:emailAddress,
                      hintText:'Email' ,
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
                      controller:passwordController,
                      hintText:'Password' ,
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
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RoundedCard(
                      height:65,
                      circularRadius:12,
                      borderSide: BorderSide(color:lightColor.withOpacity(.2)),
                      cardColor:darkColor,
                      content: Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 8.0),
                        child: DropdownButton<String>(
                          hint:  Text(cardName.isEmpty?'  Select your cards':'  '+cardName,style: TextStyle(color: lightColor,fontWeight: FontWeight.bold),),
                          dropdownColor:lightColor,
                          isExpanded: true,
                          icon: Icon(Icons.arrow_downward,color:lightColor,size: 20,),
                          underline: Container(),
                          items: cardDetails
                              .map((CardDetails value) {
                            return DropdownMenuItem<String>(
                                value: value.cardName,
                                child: Text(value.cardName,style: TextStyle(color:darkColor))
                            );
                          }).toList(),
                          onChanged: (value) {
                            cardName=value;
                            setState(() {cardList[value]=true;});
                          },
                        ),
                      ),
                    ),
                  ),
                  if(cardList.isNotEmpty)
                    ListView(
                      shrinkWrap: true,
                      children: cardList.keys.map((String key) {
                        return ListTile(
                          title: Text(key),
                          trailing: GestureDetector(
                              onTap: (){
                                setState(() {cardList.remove(key);});
                              },
                              child: Icon(Icons.cancel,color: lightColor,)),
                        );
                      }).toList(),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RoundedCard(
                      height:65,
                      circularRadius:12,
                      borderSide: BorderSide(color:lightColor.withOpacity(.2)),
                      cardColor:darkColor,
                      content: Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 8.0),
                        child: DropdownButton<String>(
                          hint:  Text(points.isEmpty?'  Select how do you spend your points':'  '+points,style: TextStyle(color: lightColor,fontWeight: FontWeight.bold),),
                          dropdownColor:lightColor,
                          isExpanded: true,
                          icon: Icon(Icons.arrow_downward,color:lightColor,size: 20,),
                          underline: Container(),
                          items: spendPoints
                              .map((String value) {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style: TextStyle(color:darkColor))
                            );
                          }).toList(),
                          onChanged: (value) {
                            if(value.contains('checkout')){
                              groupValue=1;
                            }else if(value.contains('Gift')){
                              groupValue=2;
                            }else if(value.contains('Cover')){
                              groupValue=3;
                            }else if(value.contains('Travel')){
                              groupValue=4;
                            }else {
                              groupValue=5;
                            }
                            setState(() {points=value;});

                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60,),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              text: 'By signing up you agree to the',
                              style:  TextStyle(
                                  color: lightColor, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(text: ' Terms of Service',
                                    style:  TextStyle(
                                        color: purpleColor, fontSize: 18),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                  to(const TermsOfServices());
                                        // navigate to desired screen
                                      }
                                ),
                                TextSpan(text: ' and',
                                    style:  TextStyle(
                                        color: lightColor, fontSize: 18),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // navigate to desired screen
                                      }
                                ),
                                TextSpan(text: ' Privacy Policy',
                                    style:  TextStyle(
                                        color: purpleColor, fontSize: 18),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                            to(const PrivacyPolicy());
                                        // navigate to desired screen
                                      }
                                ),
                              ]
                          ),
                        ),
                      )
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<BooleanValues>(builder:(_){
                    return Column(
                      children: [
                        if(_.isLoading)...
                        [ const CircularProgressIndicators()]

                        else...[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButtonCustom(
                                borderColor: darkColor,
                                btnColor: purpleColor,
                                height: 60,
                                width: double.maxFinite,
                                borderRadius: 12,
                                btnText: 'Create Account',
                                btnTextColor:Colors.white,
                                onPressed: (){
                                  UserProfile user=UserProfile(
                                      firstName: firstName.text,
                                      lastName: lastName.text,
                                      selectedPoint: groupValue,
                                      cards:cardList
                                  );
                                  if(_key.currentState.validate()){
                                    if(groupValue !=null &&cardName.isNotEmpty){
                                      AuthService().signUpWithEmail(user: user,email: emailAddress.text,password: passwordController.text);
                                    }else{
                                      snackBar('Select Field', 'Please select Card & Points');
                                    }
                                  }

                                }),
                          ),
                        ],
                      ],
                    );
                  }),

                ],
      ),
            ),
          ),
    ),
    );
  }
}
