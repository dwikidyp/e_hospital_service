import 'package:e_hospital_service/models/user_model.dart';

class AuthResult {
  final bool success;
  final String? errorMessage;
  final UserModel? user;

  AuthResult.success(this.user)
      : success = true,
        errorMessage = null;

  AuthResult.failure(this.errorMessage)
      : success = false,
        user = null;
}

class AuthService {
  // database sementara
  static final Map<String, Map<String, dynamic>> _users = {
    'demo@ehospital.com': {
      'password': 'demo123',
      'user': UserModel(
          id: 'demo-001',
          fullName: 'John Doe',
          email: 'demo@ehospital.com',
          phoneNumber: '+62 812-3456-7890',
          dateOfBirth: DateTime(1995, 5, 20))
    }
  };

  // login dengan email
  Future<AuthResult> login(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 1200));

    final emailLower = email.trim().toLowerCase();
    final userData = _users[emailLower];

    if (userData == null) {
      return AuthResult.failure('Email tidak terdaftar.');
    }

    if (userData['password'] != password) {
      return AuthResult.failure('Password salah. Silakan coba lagi.');
    }

    return AuthResult.success(userData['user'] as UserModel);
  }

  // Daftar akun baru
  Future<AuthResult> register({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
    DateTime? dateOfBirth,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    final emailLower = email.trim().toLowerCase();

    if (_users.containsKey(emailLower)) {
      return AuthResult.failure('Email sudah digunakan. Silakan login');
    }

    final newUser = UserModel(
        id: 'user-${DateTime.now().millisecondsSinceEpoch}',
        fullName: fullName.trim(),
        email: emailLower,
        phoneNumber: phoneNumber.trim(),
        dateOfBirth: dateOfBirth);

    _users[emailLower] = {'password': password, 'user': newUser};

    return AuthResult.success(newUser);
  }

  // login dengan akun demo
  Future<AuthResult> loginWithDemo() async {
    await Future.delayed(const Duration(milliseconds: 800));
    final demoUser = _users['demo@ehospital.com']!['user'] as UserModel;
    return AuthResult.success(demoUser);
  }
}
