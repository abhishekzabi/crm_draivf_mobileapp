class AuthRepository {
  Future<bool> login(String email, String password) async {
    // Example fake API
    await Future.delayed(const Duration(seconds: 2));

    if (email == "test@gmail.com" && password == "123456") {
      return true;
    }
    return false;
  }
}
