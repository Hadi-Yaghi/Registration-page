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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              // Profile picture placeholder
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white70,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepPurple,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Full Name
              buildLabel("Full Name"),
              TextField(
                onChanged: (val) => controller.fullName.value = val,
                decoration: const InputDecoration(
                  hintText: "Enter your Full Name",
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 15),

              // Email
              buildLabel("Email"),
              TextField(
                onChanged: (val) => controller.email.value = val,
                decoration: const InputDecoration(
                  hintText: "Enter your Email",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 15),

              // Phone
              buildLabel("Phone"),
              TextField(
                onChanged: (val) => controller.phone.value = val,
                decoration: const InputDecoration(
                  hintText: "Enter your Phone Number",
                  prefixIcon: Icon(Icons.phone_android),
                ),
              ),
              const SizedBox(height: 15),

              // Country
              buildLabel("Country"),
              TextField(
                onChanged: (val) => controller.country.value = val,
                decoration: const InputDecoration(
                  hintText: "Enter your Country",
                  prefixIcon: Icon(Icons.flag_outlined),
                ),
              ),
              const SizedBox(height: 15),

              // Password
              buildLabel("Password"),
              Obx(() => TextField(
                    onChanged: (val) => controller.password.value = val,
                    obscureText: controller.obscurePassword.value,
                    decoration: InputDecoration(
                      hintText: "Enter your Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          controller.obscurePassword.value =
                              !controller.obscurePassword.value;
                        },
                      ),
                    ),
                  )),
              const SizedBox(height: 30),

              // Register Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Register button pressed")),
                    );
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("Register"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepPurple,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
