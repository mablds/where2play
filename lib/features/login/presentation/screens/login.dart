import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.success) {
              Navigator.pushNamed(context, '/home');
            }
          },
          builder: (context, state) {
            if (state.status == LoginStatus.error) {
              return AlertDialog.adaptive(
                title: const Text('Falha ao autenticar'),
                content: Text(state.errorMessage ?? ''),
                actions: [
                  GestureDetector(
                    child: const Center(
                      child: Text(
                        'Tentar novamente',
                        style: TextStyle(height: 4),
                      ),
                    ),
                    onTap: () => cubit.resetLoginPageStatus(),
                  )
                ],
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'Olá, bem vindo(a) novamente!',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  onPressed: () async {
                    await cubit.login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  },
                ),
                const SizedBox(height: 16),
                Center(
                  child: InkWell(
                    child: const Text(
                      'Don\'t have an account? Tap here to register.',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/register'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
