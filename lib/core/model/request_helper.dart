import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestHelper{

  static Future<dynamic> getRequest(String uri)async{
    debugPrint('Request helper work start');
    var url=Uri.parse(uri);
    http.Response response= await http.get(url);
    try{
      if(response.statusCode==200){
        debugPrint('check url response');
        String data = response.body;
        var decodeData= jsonDecode(data);
        return decodeData;
      }else{
        debugPrint('response failed');
        return 'failed';
      }
    }catch(e){
      debugPrint('response failed');
      return 'failed';
    }
    /*     var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile||connectivityResult == ConnectivityResult.mobile) {


    } else{
      Fluttertoast.showToast(
          msg:'please check your internet connection',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.white70,
          textColor: Colors.black,
          fontSize: 16.0);
    }*/

  }

}