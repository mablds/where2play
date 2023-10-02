import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDataSource {
  Future<void> login({
    required String email,
    required String password,
  });

  User? getUserData();
}
