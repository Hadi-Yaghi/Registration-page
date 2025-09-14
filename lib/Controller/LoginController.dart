import 'package:get/get.dart';

class LoginController extends GetxController {
  // Reactive variables
  var email = ''.obs;
  var password = ''.obs;
  var obscurePassword = true.obs;

  // Example login method
  void login() {
    if (email.value.isEmpty || password.value.isEmpty) {
      Get.snackbar("Error", "Please enter both email and password");
    } else {
      // Replace this with your actual login logic
      Get.snackbar("Login", "Email: ${email.value}\nPassword: ${password.value}");
    }
  }
}
