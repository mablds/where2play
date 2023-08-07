import 'package:bloc/bloc.dart';
import 'package:where2play/features/login/domain/repositories/login_repository.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    LoginState? initialState,
    required this.loginRepository,
  }) : super(initialState ?? const LoginState());

  final LoginRepository loginRepository;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await loginRepository.login(email: email, password: password);
  }
}
