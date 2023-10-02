import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where2play/features/home/presentation/components/greet/greet.dart';
import 'package:where2play/themes/colors.dart';

import '../../../login/presentation/cubit/login_cubit.dart';
import '../components/sports/sports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final userName = cubit.getUserName();

    return Scaffold(
      backgroundColor: CustomColors.blue1,
      body: SafeArea(
        child: Column(
          children: [
            Greet(userName: userName ?? ''),
            const Sports(),
          ],
        ),
      ),
    );
  }
}
