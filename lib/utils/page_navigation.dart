import 'package:flutter/material.dart';
import 'package:get/get.dart';

  to(Widget widget,{Bindings bind}){
    bind !=null? Get.to(() => widget,binding:bind):Get.to(widget);
  }

 off(Widget widget,{Bindings bind}){
  bind !=null? Get.off(() => widget,binding:bind):Get.off(widget);
 }

 offAll(Widget widget,{Bindings bind}){
  bind !=null? Get.offAll(() => widget,binding:bind):Get.offAll(widget);
 }

 back(){
    Get.back();
 }