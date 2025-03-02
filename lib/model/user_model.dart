class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final DateTime birthDate;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthDate,
    DateTime? createdAt,  
  }) : createdAt = createdAt ?? DateTime.now(); 

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'gender': gender,
    'birthDate': birthDate.toIso8601String(),
    'createdAt': createdAt.toIso8601String(),
  };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    email: json['email'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    gender: json['gender'],
    birthDate: DateTime.parse(json['birthDate']),
    createdAt: DateTime.parse(json['createdAt']),
  );
}