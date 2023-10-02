import 'package:firebase_auth/firebase_auth.dart';
import 'package:where2play/features/login/data/data_sources/login_data_source.dart';

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  User? getUserData() => FirebaseAuth.instance.currentUser;
}
