import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:oi_app/core/model/user_profile.dart';
import 'package:oi_app/widgets/boolean_values.dart';
import 'package:oi_app/widgets/snackbar.dart';

import '../const_data.dart';


class FirestoreServices{

  final firestore=FirebaseFirestore.instance;
  CollectionReference userRef=FirebaseFirestore.instance.collection('users');



 final date=DateTime.now().millisecondsSinceEpoch.toString();

 final  users=FirebaseAuth.instance.currentUser;


 Future<void>  addUsersInDatabase({UserProfile user})
 => userRef.doc(users.uid).set(user.toMap(user));


 /// update my profile in local storage
 updateLocalProfile()async{
   myProfile=await getUser(id: users.uid);
 }


 Future<void> updateField({@required String field, @required var value,String id})async{
   userRef.doc(id??users.uid).update({field: value});
   myProfile=await getUser();
 }



 Future<UserProfile> getUser({String id})
 => userRef.doc(id??users.uid).get().then((value) => UserProfile.fromMap(value.data()) );


 /// update user profile
 updateUser(UserProfile _user) {
   Get.find<BooleanValues>().updateLoading(true);
   return userRef
       .doc(users.uid).update(_user.toMap(_user))
       .then((value){
        myProfile=_user;
        Get.find<BooleanValues>().updateLoading(false);
        snackBar('Profile', 'profile updated');
   })
       .catchError((error){
     snackBar('Failed to update user profile', error.toString());
     Get.find<BooleanValues>().updateLoading(false);
   });
 }

}

