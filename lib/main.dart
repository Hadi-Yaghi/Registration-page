import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// The root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const MyHomePage(title: 'Registration Page'),
    );
  }
}

// Stateful widget because we need to change password visibility
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variable to toggle password visibility
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background with gradient
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
          // Allows scrolling when keyboard is open
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
                    // Small edit icon on profile
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

              // Full Name Field
              const Text("Full Name",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Enter your Full Name",
                  prefixIcon: Icon(Icons.person_outline), // icon
                ),
              ),
              const SizedBox(height: 15),

              // Email Field
              const Text("Email",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  prefixIcon: Icon(Icons.email_outlined), // icon
                ),
              ),
              const SizedBox(height: 15),

              // Phone Field
              const Text("Phone",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Enter your Phone Number",
                  prefixIcon: Icon(Icons.phone_android), // icon
                ),
              ),
              const SizedBox(height: 15),

              // Country Field
              const Text("Country",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Enter your Country",
                  prefixIcon: Icon(Icons.flag_outlined), // icon
                ),
              ),
              const SizedBox(height: 15),

              // Password Field with show/hide
              const Text("Password",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 8),
              TextField(
                obscureText: _obscurePassword, // hide/show password
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  // Eye button to toggle visibility
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword; // toggle
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Register Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Here you will handle registration logic (send to DB or Firebase)
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
}
