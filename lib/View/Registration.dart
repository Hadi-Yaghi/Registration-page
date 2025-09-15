import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:registrationpage/Controller/RegistrationController.dart';

class Registration extends GetView<RegistrationController> {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              // Profile picture placeholder
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 55,
                      color: Colors.deepPurple,
                    ),
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.deepPurple,
                    child: const Icon(Icons.edit, size: 18, color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 40),

              // Full Name
              buildLabel("Full Name"),
              buildTextField(
                controller.name, // connected ✅
                hint: "Enter your full name",
                icon: Icons.person_outline,
              ),

              // Email
              buildLabel("Email"),
              buildTextField(
                controller.email, // connected ✅
                hint: "Enter your email",
                icon: Icons.email_outlined,
                inputType: TextInputType.emailAddress,
              ),

              // Password
              buildLabel("Password"),
              Obx(() => buildTextField(
                    controller.password, // connected ✅
                    hint: "Enter your password",
                    icon: Icons.lock_outline,
                    obscure: !controller.isPasswordVisible.value,
                    suffix: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.deepPurple,
                      ),
                      onPressed: () {
                        controller.isPasswordVisible.toggle();
                      },
                    ),
                  )),

              // Password Confirmation
              buildLabel("Confirm Password"),
              Obx(() => buildTextField(
                    controller.passwordConfirmation, // new field ✅
                    hint: "Re-enter your password",
                    icon: Icons.lock_outline,
                    obscure: !controller.isPasswordVisible.value,
                  )),

              const SizedBox(height: 35),

              // Register Button
              ElevatedButton.icon(
                onPressed: () => controller.registerUser(),
                icon: const Icon(Icons.check),
                label: const Text("Register"),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  elevation: 4,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  // Label widget
  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Reusable TextField
  Widget buildTextField(
    TextEditingController controller, {
    required String hint,
    required IconData icon,
    bool obscure = false,
    TextInputType inputType = TextInputType.text,
    Widget? suffix,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        suffixIcon: suffix,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
