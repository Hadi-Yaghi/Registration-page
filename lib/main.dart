import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:registrationpage/Routes/AppPage.dart';
import 'package:registrationpage/Routes/AppRoute.dart';

void main() {
  runApp(const MyApp());
}

// The root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // remove the debug banner
      title: 'Flutter Registration Demo',
      theme: ThemeData(
        // Set theme colors
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Default style for text fields
        inputDecorationTheme: const InputDecorationTheme(
          filled: true, // background fill
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)), // rounded corners
          ),
        ),
      ),
      initialRoute: Approute.Login,
      getPages: AppPage.pages,
      
    );
  }
}

// Stateful widget because we need to change password visibility


