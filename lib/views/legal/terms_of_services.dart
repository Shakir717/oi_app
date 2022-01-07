import 'package:flutter/material.dart';
import 'package:oi_app/core/const_data.dart';
import 'package:oi_app/utils/page_navigation.dart';

class TermsOfServices extends StatelessWidget {
  const TermsOfServices({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(children: [
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
                Text('  Terms of Service',style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold,fontFamily: 'Archivo'),),
              ],
            ),
            const SizedBox(height: 100,),
            Row(
              children: const [
                Text('  Heading',style:TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold),),
              ],
            ),
           const Center(
             child:  Padding(
               padding: EdgeInsets.all(12.0),
               child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lacinia ante laoreet lectus placerat, et laoreet enim molestie. Mauris elementum tincidunt ex sed vestibulum. Proin justo metus, posuere et scelerisque id, sagittis ac enim. Aenean tincidunt lectus vulputate aliquet mattis. Quisque nec eleifend odio. Sed ornare mattis lacus sed aliquet. Donec in leo eu dolor pellentesque porta. In tincidunt at leo ut suscipit. Morbi lectus lorem, malesuada et dignissim porttitor, egestas nec mi. Proin fermentum interdum dui, vitae lacinia diam consequat eget. Curabitur enim est, imperdiet eu massa eget, tincidunt iaculis ante. Donec ac ex mauris. Proin dictum sed neque in ornare.",
                 style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
             ),
           ),
      ],),
    ));
  }
}
