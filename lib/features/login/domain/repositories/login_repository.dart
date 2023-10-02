import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<void> login({
    required String email,
    required String password,
  });

  User? getUserData();
}
