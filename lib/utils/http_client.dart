import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:oi_app/core/model/best_card.dart';
import 'package:oi_app/core/model/card_details.dart';

class HttpClients {
  var cardsUrl = Uri.parse('https://oi-app-us.herokuapp.com/useapi');

  Future<List<BestCard>>  httpResponse({@required String userName,@required String merchant})async{
    var bestCardUrl=Uri.parse('https://oi-app-us.herokuapp.com/bestcardapi/?user_name=$userName&merchant_input=$merchant');
    var response = await http.get(bestCardUrl);

    if(response.statusCode==500){
      return <BestCard>[];
    }
    Iterable l = json.decode(response.body);

    List<BestCard> bestCardList = List<BestCard>.from(l.first.map((model)=> BestCard.fromJson(model)));
    return bestCardList;
  }

  Future<List<CardDetails>> allCards()async{

    http.Response response = await http.get(cardsUrl);
    Iterable l = json.decode(response.body);

    List<CardDetails> cardDetails = List<CardDetails>.from(l.map((model)=> CardDetails.fromJson(model)));
    return cardDetails;
  }
}