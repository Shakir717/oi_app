import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oi_app/core/const_data.dart';
import 'package:oi_app/core/services/auth_service.dart';
import 'package:oi_app/utils/page_navigation.dart';
import 'package:oi_app/views/help/help.dart';
import 'package:oi_app/views/home_page/home_page.dart';
import 'package:oi_app/views/profile/profile.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
      canvasColor:darkColor,
      primaryColor:darkColor,
      ),
      child: Drawer(
        child:Column(
          children: [
            const SizedBox(height: 100,),
            _listTile(icon: Icons.home,text: 'Home'.tr,function: (){
              offAll(const HomePage());
            }),
            Divider(color: lightColor.withOpacity(.3),),
            _listTile(icon: Icons.person_outline,text: 'Profile'.tr,function: (){
              back();
              to(const UserProfileWidget());
            }),
            Divider(color: lightColor.withOpacity(.3),),
            _listTile(icon: Icons.help,text: 'Help'.tr,function: (){
              back();
              to(const Help());
            }),
            Divider(color: lightColor.withOpacity(.3),),
            const Spacer(),
            InkWell(
                onTap: (){
                  AuthService().logOut();
                },
                child: Row(
                  children: [
                    const Text('  LOG OUT',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,
                        fontFamily: 'Archivo'
                    ),),
                  ],
                )),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  _listTile({IconData icon,String text,Function function}){
    return ListTile(
      onTap:function,
      title: Text(text,style: const TextStyle(fontSize: 18,fontWeight:FontWeight.w600,fontFamily: 'Archivo'),),
    );
  }

}
