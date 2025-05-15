import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B4D3C),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100), // Atur ketinggian bebas di sini
          child: Column(
            children: [
              Image.asset(
                'assets/images/splash.png',
                width: 80,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              SizedBox(
                height: 500, // Tinggi area putih bisa disesuaikan
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/login_bg.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0B4D3C),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '"Masukkan email dan password anda di sini."',
                            style: TextStyle(fontSize: 14, color: Color(0xFF0B4D3C)),
                          ),
                          const SizedBox(height: 24),
                          const Text('Alamat Email'),
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Masukkan alamat email anda',
                              filled: true,
                              fillColor: const Color(0xFFE9EFF5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text('Password'),
                          const SizedBox(height: 8),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Masukkan password anda',
                              filled: true,
                              fillColor: const Color(0xFFE9EFF5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Lupa Sandi ?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blueGrey[700],
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0B4D3C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/home');
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white), // <-- Tulisan putih
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Belum punya akun ? ',
                                style: const TextStyle(color: Colors.black87),
                                children: [
                                  TextSpan(
                                    text: 'Registrasi',
                                    style: const TextStyle(
                                      color: Color(0xFFFFC727),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
