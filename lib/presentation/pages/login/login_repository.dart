import 'dart:async';
import 'login_model.dart';

class LoginRepository {
  Future<bool> loginUser(LoginModel loginModel) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate API delay

    // Mock response
    if (loginModel.email == "test@gmail.com" && loginModel.password == "123456") {
      return true;
    } else {
      return false;
    }
  }
}
