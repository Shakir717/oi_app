import 'package:flutter/material.dart';
import 'package:oi_app/core/const_data.dart';
import 'package:oi_app/utils/page_navigation.dart';
import 'package:oi_app/views/legal/privacy_policy.dart';
import 'package:oi_app/views/legal/terms_of_services.dart';
class Help extends StatelessWidget {
  const Help({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Scaffold(
          body:
          Column(
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
              const  SizedBox(height: 40,),
              Row(
                children: const [
                  Text('  Help',style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold
                      ,fontFamily: 'Archivo'
                  ),),
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    color:blue,
                    border: Border.all(color: lightColor,width: .2)
                ),
                width: double.infinity,
                height: 100,
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.chat_outlined,color: lightColor,size: 28,),
                    title:const Text('Contact Us',style: TextStyle(color: Colors.blue,fontSize: 25,fontWeight: FontWeight.bold),),
                    subtitle:Text('Tell us what features you’d like us to add to Kash.',style: TextStyle(color:lightColor,fontSize:16),),
                  ),
                ),
              ),
              const  SizedBox(height: 50,),
              Row(
                children: const [
                  Text('  Legal',style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                padding:const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color:blue,
                    border: Border.all(color: lightColor,width: .2)
                ),
                child: Column(children: [
                  InkWell(
                    onTap: (){
                      to(const TermsOfServices());
                    },
                    child: Row(
                      children: const [
                        Text('  Terms of service',style:TextStyle(color:Colors.blue,fontSize:20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Divider(color: lightColor,),
                  InkWell(
                    onTap: (){
                      to(const PrivacyPolicy());
                    },
                    child: Row(
                      children: const [
                        Text('  Privacy Policy',style:TextStyle(color:Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),

                ],),
              )
              ],
          ),
    ));
  }
}
