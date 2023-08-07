abstract class LoginDataSourceRemote {
  Future<void> login({
    required String email,
    required String password,
  });
}
