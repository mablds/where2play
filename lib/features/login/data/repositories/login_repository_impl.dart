import 'package:firebase_auth/firebase_auth.dart';
import 'package:where2play/features/login/domain/repositories/login_repository.dart';

import '../data_sources/login_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({
    required this.loginDataSource,
  });

  final LoginDataSource loginDataSource;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await loginDataSource.login(email: email, password: password);
  }

  @override
  User? getUserData() => loginDataSource.getUserData();
}
