import 'package:flutter/material.dart';
import 'package:oi_app/core/const_data.dart';
import 'package:oi_app/core/model/search_prediction.dart';

class PredictionTile extends StatelessWidget {
  final SearchPrediction prediction;
  const PredictionTile({this.prediction,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 8,),
            Row(
              children: [
                Icon(Icons.location_on_outlined,color:darkColor,),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(prediction.mainText,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize:16,color: darkColor ),),
                      SizedBox(height:2,),
                      Text(prediction.secondaryText,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize:12,color:darkColor ),),
                    ],),
                )
              ],
            ),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
