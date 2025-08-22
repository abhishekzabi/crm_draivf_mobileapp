import 'package:flutter/material.dart';
import 'login_model.dart';
import 'login_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginRepository _repository = LoginRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final loginModel = LoginModel(email: email, password: password);
      bool result = await _repository.loginUser(loginModel);
      if (!result) {
        _errorMessage = "Invalid email or password";
      }
      return result;
    } catch (e) {
      _errorMessage = "Something went wrong!";
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
