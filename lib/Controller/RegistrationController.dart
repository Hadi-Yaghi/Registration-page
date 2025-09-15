import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:registrationpage/Core/Network/DioClient.dart';
import 'package:registrationpage/Model/User.dart';

class RegistrationController extends GetxController {
  // Text controllers for form fields
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirmation = TextEditingController(); // ✅ new

  // Password visibility
  var isPasswordVisible = false.obs;

  Future<void> registerUser() async {
    // Prepare data manually (instead of relying only on User model)
    final userData = {
      "name": name.text.trim(),
      "email": email.text.trim(),
      "password": password.text.trim(),
      "password_confirmation": passwordConfirmation.text.trim(), // ✅ added
    };

    try {
      final response = await Dioclient()
          .getInstance()
          .post('/register', data: userData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Registration successful');
        // Optionally clear fields after success
        name.clear();
        email.clear();
        password.clear();
        passwordConfirmation.clear();
      } else {
        Get.snackbar(
          'Error',
          'Registration failed: ${response.statusMessage ?? "Unknown error"}',
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Registration failed: $e');
    }
  }
}
