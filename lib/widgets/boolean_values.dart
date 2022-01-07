import 'package:get/get.dart';

class BooleanValues extends GetxController {

  bool obscureText;
  bool obscureConfirmText;
  bool isLoading;

  updateLoading(bool value) {
    isLoading = value;
    update();
  }

  updateObscureText() {
    obscureText = !obscureText;
    update();
  }

  updateObscureConfirmText() {
    obscureConfirmText = !obscureConfirmText;
    update();
  }


  @override
  void onInit() {
    super.onInit();
    obscureText = true;
    obscureConfirmText = true;
    isLoading = false;
  }

}
