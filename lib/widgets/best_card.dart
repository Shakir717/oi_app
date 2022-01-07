import 'package:flutter/material.dart';
import 'package:oi_app/core/const_data.dart';
import 'package:oi_app/core/model/best_card.dart';
import 'package:oi_app/utils/appTheme.dart';
import 'package:oi_app/utils/page_navigation.dart';
class BestCardWidget extends StatelessWidget {
  const BestCardWidget({Key key,this.bestCards,this.title}) : super(key: key);
  final List<BestCard> bestCards;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          body: Column(
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
                        child: Icon(Icons.clear,color: lightColor,size:30,),
                      ))
                ],
              ),
              const SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Best Card',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                  ),),
                ],
              ),
              const SizedBox(height: 40,),
              Container(
                decoration: BoxDecoration(
                  color:blue,
                  border: Border.all(color:HexColor('#343F50'),width: .1)
                ),
                height: 400,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                   Container(
                       width: 350,
                       child: Center(child: Text(title,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,fontFamily: 'Archivo'),))),
                  const SizedBox(height: 20,),
                  Container(
                    height: 300,
                    width: 400,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: HexColor('#232A36'),
                        border: Border.all(color:HexColor('#343F50'),width: .1),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(children: [
                      Row(children: [
                        Text('CREDIT CARD',style: TextStyle(color: purpleColor,fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('POINT VALUE',style: TextStyle(color: purpleColor,fontWeight: FontWeight.bold),)

                      ],),
                      Expanded(
                        child: ListView.builder(
                            itemCount: bestCards.length,
                            itemBuilder:(_,i){
                              BestCard card=bestCards[i];
                              return ListTile(
                                contentPadding: EdgeInsets.only(left: 0,right: 8),
                                tileColor: darkColor,
                                trailing: Text('\$ '+card.onePointDollarValue.toString(),style: TextStyle(color:lightColor,fontWeight: FontWeight.bold,fontSize:19),),
                                title: Text(card.cardName,style: TextStyle(color:lightColor,fontWeight: FontWeight.bold),),

                              );
                            }),
                      )
                    ],),
                  ),
                  ],
                ),
              )
            ],
          ),
        ) );
  }
}
