import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:where2play/infra/routes.dart';
import 'package:where2play/themes/theme_data.dart';
import 'firebase_options.dart';

import 'features/onboarding/presentation/screens/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Where2Play());
}

class Where2Play extends StatelessWidget {
  const Where2Play({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
      theme: AppTheme.lightTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
