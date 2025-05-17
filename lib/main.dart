import 'package:flutter/material.dart';
import 'package:easier/app/widgets/splash_screen.dart';
import 'package:easier/app/modules/login/views/login_view.dart';
import 'package:easier/app/modules/home/views/home_view.dart';

void main() {
  runApp(const EasierApp());
}

class EasierApp extends StatelessWidget {
  const EasierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easier',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xF0FAFFF8),
        fontFamily: 'Sans',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeView(),
      },
    );
  }
}
