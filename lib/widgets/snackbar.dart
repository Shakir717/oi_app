import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oi_app/utils/appTheme.dart';

snackBar(String title,String message){
  if(Get.isSnackbarOpen)Get.back();
  Get.snackbar(
      title, message,

      backgroundColor:HexColor('FEE3EC'),
      dismissDirection: DismissDirection.none,
      colorText: Colors.redAccent,

  );
}