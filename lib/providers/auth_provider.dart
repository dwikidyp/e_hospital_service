import 'package:e_hospital_service/models/user_model.dart';
import 'package:e_hospital_service/services/auth_service.dart';
import 'package:flutter/foundation.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  AuthStatus _status = AuthStatus.initial;
  UserModel? _currentUser;
  String? _errorMessage;

  AuthStatus get status => _status;
  UserModel? get currentUser => _currentUser;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _status == AuthStatus.authenticated;
  bool get isLoading => _status == AuthStatus.loading;

  void _setLoading() {
    _status = AuthStatus.loading;
    _errorMessage = null;
    notifyListeners();
  }

  void _setError(String message) {
    _status = AuthStatus.error;
    _errorMessage = message;
    notifyListeners();
  }

  void _setAuthenticated(UserModel user) {
    _currentUser = user;
    _status = AuthStatus.authenticated;
    _errorMessage = null;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    if (_status == AuthStatus.error) {
      _status = AuthStatus.unauthenticated;
    }
    notifyListeners();
  }

  // Login dengan
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    _setLoading();
    final result = await _authService.login(email: email, password: password);
    if (result.success && result.user != null) {
      _setAuthenticated(result.user!);
      return true;
    } else {
      _setError(result.errorMessage ?? 'Login gagal.');
      return false;
    }
  }

  // Daftar akun
  Future<bool> register({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
    DateTime? dateOfBirth,
  }) async {
    _setLoading();
    final result = await _authService.register(
        fullName: fullName,
        email: email,
        password: password,
        phoneNumber: phoneNumber);
    if (result.success && result.user != null) {
      _setAuthenticated(result.user!);
      return true;
    } else {
      _setError(result.errorMessage ?? 'Registrasi gagal.');
      return false;
    }
  }

  // login dengan akun demo
  Future<bool> loginWithDemo() async {
    _setLoading();
    final result = await _authService.loginWithDemo();
    if (result.success && result.user != null) {
      _setAuthenticated(result.user!);
      return true;
    } else {
      _setError('Demo login gagal.');
      return false;
    }
  }

  // logout
  void logout() {
    _currentUser = null;
    _status = AuthStatus.unauthenticated;
    _errorMessage = null;
    notifyListeners();
  }
}
