import 'package:firebase_auth/firebase_auth.dart';
import 'package:where2play/features/register/data/data_sources/register_data_source.dart';

class RegisterDataSourceImpl implements RegisterDataSource {
  @override
  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      throw Exception(e);
    }
  }
}
