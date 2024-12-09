import 'package:digital_maire/presentation/screens/LoginPage.dart';
import 'package:digital_maire/presentation/screens/RegisterPage.dart';
import 'package:digital_maire/presentation/screens/WelcomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Maire',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const Loginpage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
