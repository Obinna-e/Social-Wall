import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_wall/auth/auth.dart';
import 'package:social_wall/auth/login_or_register.dart';
import 'package:social_wall/firebase_options.dart';
import 'package:social_wall/theme/dark_mode.dart';
import 'package:social_wall/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
