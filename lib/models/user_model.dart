class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final DateTime? dateOfBirth;
  final String? avatarUrl;

  UserModel(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.phoneNumber,
      this.dateOfBirth,
      this.avatarUrl});

  String get initials {
    final parts = fullName.trim().split(' ');
    if (parts.length >= 2) {
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }
    return fullName.substring(0, fullName.length.clamp(0, 2)).toUpperCase();
  }

  String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? avatarUrl,
  }) {
    return UserModel(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        avatarUrl: avatarUrl ?? this.avatarUrl);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'avatarUrl': avatarUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'] ?? '',
        fullName: map['fullName'] ?? '',
        email: map['email'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '',
        dateOfBirth: map['dateOfBirth'] != null
            ? DateTime.parse(map['dateOfBirth'])
            : null,
        avatarUrl: map['avatarUrl']);
  }
}
