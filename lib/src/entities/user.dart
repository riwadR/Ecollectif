import 'dart:convert';

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.dateJoined,
    required this.bio,
    required this.pointsCollected,
  });

  final int id;
  final String name;
  final String email;
  final String profilePicture;
  final DateTime dateJoined;
  final String bio;
  final int pointsCollected;

  // Method to convert JSON to `User` instance
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      // Forced to type each parameter
      id: json['id'] as int, // Force ID to integer
      name: json['name'] as String, // Force name to string
      email: json['email'] as String, // Force email to string
      profilePicture: json['profile_picture'] as String? ?? '', // If null, assign empty value
      dateJoined: DateTime.parse(json['date_joined'] as String), // Convert Date to string
      bio: json['bio'] as String? ?? '', // If null, assign empty value
      pointsCollected: json['points_collected'] as int? ?? 0, // Assign default value to 0
    );
  }

  // Method to convert one instance of User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profile_picture': profilePicture,
      'date_joined': dateJoined.toIso8601String(),
      'bio': bio,
      'points_collected': pointsCollected,
    };
  }

  // Method to create a User list from a JSON list
  static List<User> listFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((json) => User.fromJson(json as Map<String, dynamic>))
        .toList();
  }

}
