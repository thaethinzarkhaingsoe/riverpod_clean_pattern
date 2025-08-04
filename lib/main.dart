import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'features/Login/presentations/screens/login_screen.dart';

void main() {
  runApp(
    const ProviderScope( // ✅ Wrap the entire app
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Q-Exhibitor',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}

