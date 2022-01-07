import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oi_app/core/const_data.dart';
import 'package:oi_app/core/model/card_details.dart';
import 'package:oi_app/core/services/firestore_service.dart';
import 'package:oi_app/utils/appTheme.dart';
import 'package:oi_app/utils/page_navigation.dart';
import 'package:oi_app/views/auth/change_password.dart';



class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({Key key}) : super(key: key);

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {

  Map<String, dynamic> values =myProfile.cards;

  Map<String, int> pointSelection = {
    'At checkout ': 1,
    'Gift cards': 2,
    'Cover charges':3,
    'Travel':4,
    'Shop with members':5
  };

  int groupValue=myProfile.selectedPoint;
  final FirestoreServices _services=FirestoreServices();
  String cardName='';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            const  SizedBox(height: 40,),
          Row(
            children: const [
              Text('  Profile',style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold,fontFamily: 'Archivo'),),
            ],
          ),

          const SizedBox(height: 20,),

          buildCard(title: 'Full Name',type: myProfile.firstName+''+myProfile.lastName),
          buildCard(title: 'Email Address',type:_services.users.email),
            const SizedBox(height: 50,),

            Row(
              children: const [
                Text('  CARDS',style:TextStyle(fontSize:14,fontWeight: FontWeight.w600,color: Colors.grey),),
              ],
            ),

            const SizedBox(height: 10,),

            Container(
              decoration: BoxDecoration(
                  color:blue,
                  border: Border.all(color:HexColor('#343F50'),width: .2)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: values.keys.map((String key) {
                      return CheckboxListTile(
                        title: Text(key),
                        value: values[key],
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool value) {
                          setState(() {
                            values[key] = value;
                            _services.updateField(field: 'cards', value: values);
                          });
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:100.0),
                    child: Divider(color: lightColor,),
                  ),
                  const SizedBox(height:10,),
                  InkWell(
                    onTap: (){
                      Get.defaultDialog(
                        title: '',
                        backgroundColor:darkColor,
                        middleTextStyle: const TextStyle(color: Colors.white,),
                        content:  Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(height: 8,),
                            Row(children: [
                              Text('Select Card ',style: TextStyle(color: lightColor,fontSize: 20,fontWeight: FontWeight.bold),),
                              Spacer(),
                              GestureDetector(
                                  onTap: (){
                                    back();
                                  },
                                  child: Icon(Icons.cancel,color: lightColor,)),
                              SizedBox(width: 8,),

                            ],),
                            Divider(color: lightColor,),
                            SizedBox(height: 8,),
                            Container(
                              width: 350,
                              height:450,
                              child: ListView(
                                shrinkWrap: true,
                                children: cardDetails.map((CardDetails card) {
                                  return ListTile(
                                    onTap: (){
                                      setState(() {
                                        values[card.cardName]=true;
                                        _services.updateField(field: 'cards', value: values);
                                        back();
                                      });

                                    },
                                    title: Text(card.cardName,style: TextStyle(color:lightColor),),
                                    subtitle: Divider(color: darkColor,),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),

                      );
                    },
                    child: Row(
                      children: const [
                        Text('    Add Card',style: TextStyle(color:Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  const SizedBox(height:10,),
                ],
              ),
            ),
            const SizedBox(height: 50,),

            Row(
              children: const [
                Text('  HOW YOU SPEND YOUR POINTS',style:TextStyle(fontSize:14,fontWeight: FontWeight.w600,color: Colors.grey),),
              ],
            ),

            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  color:blue,
                  border: Border.all(color:HexColor('#343F50'),width: .2)
              ),
              child:Column(
                children: pointSelection.keys.map((String key) {
                  return RadioListTile(
                    title: Text(key),
                    value: pointSelection[key],
                    groupValue:groupValue,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (int value) {
                      setState(() {
                        pointSelection[key] = value;
                        groupValue=value;
                        _services.updateField(field: 'selectedPoint', value: groupValue);

                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 40,),
            InkWell(
              onTap: (){
                to(const ChangePassword());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('  Change Password',style:TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.blue),),
                ],
              ),
            ),
            const SizedBox(height: 30,),

          ],
        ),
      ),
    ));
  }

  Padding buildCard({String title,String type}) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child:Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color:HexColor('#343F50'),width: .2),
            borderRadius: BorderRadius.circular(12),
            color: HexColor('#232A36'),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('  '+title,style: const TextStyle(color: Colors.grey,fontSize: 16),),
          Text('  '+type,style: TextStyle(color:lightColor,fontWeight: FontWeight.bold,fontSize: 20),)
        ],),
        ),
      );
  }
}
