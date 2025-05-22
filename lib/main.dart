import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easier/app/widgets/splash_screen.dart';
import 'package:easier/app/modules/login/views/login_view.dart';
import 'package:easier/app/modules/home/views/home_view.dart';
import 'package:easier/app/modules/register/views/register_view.dart';
import 'package:easier/app/modules/grub/views/grub_view.dart';
import 'package:easier/app/modules/riwayat/views/riwayat_view.dart';
import 'package:easier/app/modules/profil/controllers/profil_controller.dart';

void main() {
  Get.put(ProfilController());
  runApp(const EasierApp());
}

class EasierApp extends StatelessWidget {
  const EasierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easier',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xF0FAFFF8),
        fontFamily: 'Sans',
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/register', page: () => const RegisterView()),
        GetPage(name: '/home', page: () => const HomeView()),
        GetPage(name: '/grub', page: () => const GrubView()),
        GetPage(name: '/riwayat', page: () => const RiwayatView()),
      ],
    );
  }
}
