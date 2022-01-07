import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oi_app/core/const_data.dart';
import 'package:oi_app/core/model/address.dart';
import 'package:oi_app/core/model/best_card.dart';
import 'package:oi_app/core/model/request_helper.dart';
import 'package:oi_app/core/model/search_prediction.dart';
import 'package:oi_app/utils/helperFunctions.dart';
import 'package:oi_app/utils/http_client.dart';
import 'package:oi_app/utils/page_navigation.dart';
import 'package:oi_app/utils/page_size.dart';
import 'package:oi_app/widgets/best_card.dart';
import 'package:oi_app/widgets/button.dart';
import 'package:oi_app/widgets/drawer.dart';
import 'package:oi_app/widgets/snackbar.dart';
import 'package:oi_app/widgets/text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  
  final DateTime _dateTime=DateTime.now();

  TextEditingController merchant=TextEditingController();

  List<BestCard> bestCards=[];
  List<BestCard> cards=[];

  List<String> myBestCard=[];

  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<SearchPrediction> destPrediction = [];

  bool selectLocation=false;
  String locationName='';

  Set<Marker> markers={};

  void searchPlace(String placeName)async{
    String url='https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=AIzaSyBQQuokFqFgOcXpj5O2qbe61H9UclWq4SU';
    //  String url='https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=30.0025,73.2412&radius=5000&type=hospital&key=AIzaSyCGDOgE33dc-6UHtIAptXSAVZRogFvV8Hs';
    var response = await RequestHelper.getRequest(url);
    if(response=='failed'){
      return;
    }else{
      print('search place response ');
      print(response);
      if(response['status']=='OK'){
        var predictionJson=response['predictions'];
        var thisList=(predictionJson as List).map((e) =>SearchPrediction.fromJson(e)).toList();
        setState(() {
          destPrediction=thisList;
        });

      }
    }
  }

  void getPlaceDetails(String placeId,BuildContext context)async{

    // String url='https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=name,rating,formatted_phone_number&key=AIzaSyCGDOgE33dc-6UHtIAptXSAVZRogFvV8Hs';
    String url='https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=AIzaSyBQQuokFqFgOcXpj5O2qbe61H9UclWq4SU';
    var response=await RequestHelper.getRequest(url);
    if(response=='failed'){
      return ;

    }else{
      if(response['status']=='OK'){
        Address thisPlace= Address();
        thisPlace.placeName=response['result']['name'];
        thisPlace.placeId=placeId;
        thisPlace.placeFormattedAddress=response['result']['formatted_address'];
        thisPlace.placeIcon=response['result']['icon'];
        thisPlace.latitude=response['result']['geometry']['location']['lat'];
        thisPlace.longitude=response['result']['geometry']['location']['lng'];
        locationName=thisPlace.placeName;
        merchant.text=locationName;
      _goToTheLocation(latLng: LatLng(thisPlace.latitude,thisPlace.longitude));

      }
    }

  }


  ///add card into list
  myCards(){
    myProfile.cards.forEach((key, value) {
      print('card test'+key);
      if(value){myBestCard.add(key);}
    });

  setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      key: scaffoldKey,
      bottomSheet: Container(
        width: double.infinity,
        height: 100,
        color: darkColor,
        child: Center(child:
        RaisedButtonCustom(
            borderColor: darkColor,
            btnColor: purpleColor,
            height: 50,
            width: 350,
            borderRadius: 12,
            btnText: 'Get Best Card',
            btnTextColor:Colors.white,
            onPressed: (){
              if(selectLocation){
                 FocusScope.of(context).unfocus();
                to(BestCardWidget(bestCards:cards,title:locationName,));

              }else{
                snackBar('Alert!', 'no card found');
              }
            })
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 45,
        leading: GestureDetector(
            onTap: (){
              scaffoldKey.currentState.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(Icons.menu,size: 35,),
            )),
        backgroundColor: darkColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            indoorViewEnabled: false,
            initialCameraPosition: _kGooglePlex,
            markers: markers,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: darkColor,
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/logo.png',
                        width: 100,
                        height: 60,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Text(HelperFunctions.getTime(_dateTime.millisecondsSinceEpoch.toString()),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width:width(1.1),
                  child: TextFieldCustom(
                    onChanged: (v)async{
                       searchPlace(v);
                      List<BestCard> bestCardList = await HttpClients().httpResponse(userName: 'jenna_niven', merchant:'$v');
                        setState(() {bestCards=bestCardList;});

                       cards.clear();
                       bestCards.forEach((element) {
                         print(element.cardName);
                         bool value=myBestCard.contains(element.cardName);
                         if(value){
                           setState(() {cards.add(element);});
                         }
                       });


                      if (kDebugMode) {
                        print(bestCardList.length);
                      }
                    },
                    controller:merchant,
                    hintText:' Search Merchant' ,
                    hintTextColor: Colors.grey,
                    backgroundColor: darkColor,
                    borderColor: lightColor,
                    textColor: lightColor,
                    borderRadius: 12,
                    borderSide: true,
                    borderWidth: .2,
                  ),
                ),
              ),
              if(destPrediction.isNotEmpty&&merchant.text.isNotEmpty)...[
                Padding(
                  padding: EdgeInsets.symmetric(vertical:8.0,horizontal: 16.0 ),
                  child: ListView.separated(itemBuilder: (context,i){
                    return GestureDetector(
                      onTap: (){
                        FocusScope.of(context).unfocus();
                        getPlaceDetails(destPrediction[i].placeId, context);


                        // print(myBestCard.length);
                        // if(cards.isNotEmpty){
                        //
                        //   to(BestCardWidget(bestCards:cards,title: destPrediction[i].mainText,));
                        // }else{
                        //   snackBar('Alert!', 'no card found');
                        // }
                      },
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
                                      Text(destPrediction[i].mainText,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize:16,color: darkColor ),),
                                      SizedBox(height:2,),
                                      Text(destPrediction[i].secondaryText,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize:12,color:darkColor ),),
                                    ],),
                                )
                              ],
                            ),
                            SizedBox(height: 8,),
                          ],
                        ),
                      ),
                    );

                     // PredictionTile(prediction: destPrediction[i]);
                  }, separatorBuilder:(BuildContext context, int i)=> Divider(),
                    itemCount: destPrediction.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  ),
                )
              ]
            ],
          ),
        ],
      ),
    );
  }

   Future<void> _goToTheLocation({LatLng latLng}) async {
       markers..clear();
       destPrediction.clear();
       markers.add(Marker(
           markerId: MarkerId('${locationName}'),
           position:latLng,
           icon:BitmapDescriptor.defaultMarker,
         infoWindow: InfoWindow(
           title: locationName,)
       ));

     final GoogleMapController controller = await _controller.future;
     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target:latLng,zoom:18,tilt:40,bearing: 60)));
    setState(() {
      selectLocation=true;
    });
  }
}
