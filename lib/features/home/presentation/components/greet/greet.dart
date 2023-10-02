import 'package:flutter/material.dart';

const String _welcomeMessage = 'Seja bem vindo(a) novamente,';

class Greet extends StatelessWidget {
  const Greet({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        '$_welcomeMessage $userName!',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
