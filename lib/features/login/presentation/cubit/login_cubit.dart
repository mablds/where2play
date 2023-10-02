import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:where2play/features/login/domain/repositories/login_repository.dart';

import 'login_state.dart';

const weakPasswordError = 'Considere aumentar a força de sua senha';
const emailInUseError = 'E-mail já cadastrado';
const _generalError =
    'Estamos com problema no momento, tente novamente mais tarde';
const _passwordIncorrect = 'Senha ou e-mail incorretos';
const _emailNotFound = 'Conta não encontrada';

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
    try {
      emit(state.copyWith(status: LoginStatus.loading));

      await loginRepository.login(email: email, password: password);

      emit(state.copyWith(status: LoginStatus.success));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          emit(
            state.copyWith(
              status: LoginStatus.error,
              errorMessage: _emailNotFound,
            ),
          );
          break;
        case 'wrong-password':
          emit(
            state.copyWith(
              status: LoginStatus.error,
              errorMessage: _passwordIncorrect,
            ),
          );
          break;
        default:
          emit(
            state.copyWith(
              status: LoginStatus.error,
              errorMessage: _generalError,
            ),
          );
          break;
      }
    }
  }

  void resetLoginPageStatus() {
    return emit(state.copyWith(status: LoginStatus.initial));
  }

  String? getUserName() {
    final userData = loginRepository.getUserData();
    return userData?.displayName;
  }
}
