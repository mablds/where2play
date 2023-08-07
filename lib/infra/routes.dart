import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/home/presentation/screens/home.dart';
import '../features/login/data/data_sources/login_data_source_impl.dart';
import '../features/login/data/repositories/login_repository_impl.dart';
import '../features/login/presentation/cubit/login_cubit.dart';
import '../features/login/presentation/screens/login.dart';
import '../features/onboarding/presentation/screens/onboarding.dart';
import '../features/register/presentation/screens/register.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => LoginCubit(
              loginRepository: LoginRepositoryImpl(
                loginDataSourceRemote: LoginDataSourceRemoteImpl(),
              ),
            ),
            child: const LoginPage(),
          ),
        );
      case register:
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const OnboardingPage(),
        );
    }
  }
}
