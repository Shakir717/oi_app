import 'package:get/get.dart';

class FieldValidation{

  fieldRequired(field){
    if(field==null || field=='') return 'field must not null' ;
    return null;
  }

  emailField(var email){
    if(GetUtils.isEmail(email.toString().toLowerCase().trim())) return null;
    return 'Please enter valid email address';
  }

  passwordField(var password){
    if(password==null){

      return 'password must not null';

    }else if(password.length<6){

      return 'password should be at least 6 characters';

    }else{

      return null;
    }
  }

  confirmPasswordField(var password,var confirmPassword){
    if(password==confirmPassword){

      return null;

    }else{

      return 'password and confirm Password should be same';

    }
  }


}