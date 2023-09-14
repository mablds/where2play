import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state.status == RegisterStatus.success) {
              Navigator.pushNamed(context, '/onboarding');
            }
          },
          builder: (context, state) {
            if (state.status == RegisterStatus.error) {
              return AlertDialog.adaptive(
                title: const Text('Falha ao registrar'),
                content: Text(state.errorMessage ?? ''),
                actions: [
                  GestureDetector(
                    child: const Center(
                      child: Text(
                        'Tentar novamente',
                        style: TextStyle(height: 4),
                      ),
                    ),
                    onTap: () => cubit.resetRegisterPageStatus(),
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
                    'Olá, seja bem vindo(a)!',
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
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: state.status == RegisterStatus.loading
                        ? null
                        : () async {
                            await cubit.register(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Registrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Visibility(
                          visible: state.status == RegisterStatus.loading,
                          child: const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      ],
                    ),
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
