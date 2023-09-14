import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:where2play/features/register/domain/register_repository.dart';

import 'register_state.dart';

const weakPasswordError = 'Considere aumentar a força de sua senha';
const emailInUseError = 'E-mail já cadastrado';
const _generalError =
    'Estamos com problema no momento, tente novamente mais tarde';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    RegisterState? initialState,
    required this.registerRepository,
  }) : super(initialState ?? const RegisterState());

  final RegisterRepository registerRepository;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      emit(state.copyWith(status: RegisterStatus.loading));

      await registerRepository.register(email: email, password: password);

      emit(state.copyWith(status: RegisterStatus.success));
    } on FirebaseAuthException catch (_) {
      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: _generalError,
        ),
      );
    }
  }

  void resetRegisterPageStatus() {
    return emit(state.copyWith(status: RegisterStatus.initial));
  }
}
