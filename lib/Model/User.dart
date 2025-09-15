import 'dart:convert';

class User {
  final String? name;
  final String email;
  final String password;
  final String? phone;
  final String? country;

  User({  // Constructor with required and optional fields
    this.name,
    required this.email,
    required this.password,
    this.phone,
    this.country,
  });

  Map<String, dynamic> toMap() {  // Convert User object to a Map
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'country': country,
    };
  }
  String toJson() => jsonEncode(toMap()); // Convert User object to JSON string
}