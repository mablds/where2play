import 'package:where2play/features/register/domain/register_repository.dart';

import '../data_sources/register_data_source.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  const RegisterRepositoryImpl({required this.registerDataSource});

  final RegisterDataSource registerDataSource;

  @override
  Future<void> register({
    required String email,
    required String password,
  }) async {
    await registerDataSource.register(email: email, password: password);
  }
}
