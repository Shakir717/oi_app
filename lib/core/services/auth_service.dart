import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oi_app/core/const_data.dart';
import 'package:oi_app/core/model/user_profile.dart';
import 'package:oi_app/utils/appTheme.dart';
import 'package:oi_app/utils/page_navigation.dart';
import 'package:oi_app/views/auth/auth_view.dart';
import 'package:oi_app/views/auth/confirm_email_address.dart';
import 'package:oi_app/views/home_page/home_page.dart';
import 'package:oi_app/views/login/login.dart';
import 'package:oi_app/widgets/boolean_values.dart';
import 'package:oi_app/widgets/button.dart';
import 'package:oi_app/widgets/snackbar.dart';
import 'firestore_service.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final _user = FirebaseAuth.instance.currentUser;

  Future  loginWithEmail({String email, String password}) async {
    Get.find<BooleanValues>().updateLoading(true);

    debugPrint('Login with email');
    try {
      UserCredential authResult = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password,);

      debugPrint('sign in');

      if(!authResult.user.emailVerified){
        authResult.user.sendEmailVerification();
        debugPrint('email not verified');
        Get.defaultDialog(
            backgroundColor:HexColor('FEE3EC'),
            barrierDismissible: false,
            title: 'Alert!',
            titleStyle: TextStyle(color:Colors.redAccent,),
            radius: 20,

            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
               const SizedBox(height: 40,),
               const  Text('Email associated with this account not verified',style: TextStyle(color:Colors.redAccent,),),
               const SizedBox(height: 40,),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                      width: 100,
                      height: 40,
                      child: RaisedButtonCustom(
                          width: 100,
                          height: 40,
                          btnColor: darkColor,
                          onPressed: (){
                            sendConfirmationEmail(authResult.user);
                            back();
                          },
                          child:const Text('Resend',))),
                ),
              ],
            )
        );

        Get.find<BooleanValues>().updateLoading(false);

      }else{
        debugPrint('going to populate user');

        await _populateCurrentUser(authResult.user);
        debugPrint('going to home');
        offAll(const HomePage());
      }

     // return authResult;
    } on FirebaseAuthException catch(e){

      snackBar('Alert !', e.message);

    } on SocketException catch(e){

      snackBar('Alert !', e.message);

    }catch(e){

      snackBar('Alert !', e.message);

    }
    Get.find<BooleanValues>().updateLoading(false);

  }

  Future  signUpWithEmail({UserProfile user,String email,String password}) async {
    Get.find<BooleanValues>().updateLoading(true);

    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email:email,
        password:password,
      );

      FirestoreServices().addUsersInDatabase(user:user);

      sendConfirmationEmail(authResult.user);

      return authResult;

    } on FirebaseAuthException catch(e){
      Get.find<BooleanValues>().updateLoading(false);

      snackBar('', e.message,);

    } on SocketException catch(e){
      Get.find<BooleanValues>().updateLoading(false);

      snackBar('', e.message);

    }catch (e) {
      Get.find<BooleanValues>().updateLoading(false);

      snackBar('', '${e.message}');
    }
    Get.find<BooleanValues>().updateLoading(false);
  }


  Future  forgotPassword(String email)async{
    Get.find<BooleanValues>().updateLoading(true);

    try {
       await _firebaseAuth.sendPasswordResetEmail(email: email);

      snackBar('Rest', 'Reset link sent to your email address');

      Get.defaultDialog(
          backgroundColor:darkColor,
          barrierDismissible: false,
          title: 'Rest Password',
          titleStyle: TextStyle(color:lightColor),
          radius: 20,

          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
             const  SizedBox(height: 40,),
              const Text('Reset link sent to your email address\n Please reset your password',),
              const SizedBox(height: 40,),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                    width: 150,
                    height: 40,
                    child: RaisedButtonCustom(
                        width: 150,
                        height: 40,
                        btnColor: darkColor,
                        onPressed: (){
                          offAll(Login());
                          back();
                        },
                        child:const Text('  Back to Login  '))),
              ),
            ],
          )
      );
       Get.find<BooleanValues>().updateLoading(false);

    } on FirebaseAuthException catch(e){
      Get.find<BooleanValues>().updateLoading(false);
      snackBar('Alert !', e.message);

    } on SocketException catch(e){
      Get.find<BooleanValues>().updateLoading(false);
      snackBar('Alert !', e.message);

    } catch (e) {
      Get.find<BooleanValues>().updateLoading(false);
      snackBar('Alert !', '${e.message}');
    }
  }

  // Future  signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //     _firebaseAuth.signInWithCredential(credential);
  // }


  Future sendConfirmationEmail(User user) async {
    try {
      await user.sendEmailVerification();
      offAll(ConfirmEmailAddress());
      // Get.defaultDialog(
      //     backgroundColor:darkColor,
      //     barrierDismissible: false,
      //     title: 'Account Verification',
      //     middleText: 'Account successfully created',
      //     titleStyle: TextStyle(color: lightColor),
      //     radius: 20,
      //     content: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         const SizedBox(height: 40,),
      //         const Text(' Link sent to your Email address please verify account ',),
      //         const SizedBox(height: 40,),
      //         Align(
      //           alignment: Alignment.bottomRight,
      //           child: SizedBox(
      //               width: 110,
      //               height: 40,
      //               child: RaisedButtonCustom(
      //                   width: 110,
      //                   height: 40,
      //                   onPressed: (){
      //                     back();
      //                     offAll(const Login());
      //                   },
      //                   child:Text('Back to Login',style: TextStyle(color: darkColor),))),
      //         ),
      //       ],
      //     )
      // );

      //return user;

    } catch (e) {
      snackBar('Alert!', "An error occurred while trying to send email verification\n please try again later");
      //print("An error occured while trying to send email verification");
      return e.message;
    }
    Get.find<BooleanValues>().updateLoading(false);
  }

  Future checkUserLoginStatus() async {
    final firebaseUser = _firebaseAuth.currentUser;
    await _populateCurrentUser(firebaseUser);
    return firebaseUser != null && firebaseUser.emailVerified;
  }


  _populateCurrentUser(User firebaseUser)async{
    debugPrint('populateCurrent user');
    if(firebaseUser !=null){
      myProfile= await FirestoreServices().getUser();
    }
  }

  Future sendPasswordResetEmail(email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return e.message;
    }
  }

  void logOut() {
  _firebaseAuth.signOut();
    offAll(const AuthView());
  }

  Future changePassword({String oldPassword,String newPassword}) async {
    Get.find<BooleanValues>().updateLoading(true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _user.email,
        password:oldPassword,
      );

      _user.updatePassword(newPassword).then((_){
        snackBar('Password', "Successfully changed password");
        logOut();
      }).catchError((error){
        Get.find<BooleanValues>().updateLoading(false);
        snackBar('Password',"Password can't be changed" + error.toString());
        //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
      });
    } on FirebaseAuthException catch (e) {
      snackBar('Error', e.message);
      Get.find<BooleanValues>().updateLoading(false);
    }
    Get.find<BooleanValues>().updateLoading(false);

  }

  }


