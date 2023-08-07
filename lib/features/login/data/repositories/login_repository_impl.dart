import 'package:where2play/features/login/domain/repositories/login_repository.dart';

import '../data_sources/login_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({
    required this.loginDataSourceRemote,
  });

  final LoginDataSourceRemote loginDataSourceRemote;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await loginDataSourceRemote.login(email: email, password: password);
  }
}
