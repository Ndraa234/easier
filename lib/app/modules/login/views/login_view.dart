import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B4D3C),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 130), 

            Center(
              child: Image.asset(
                'assets/images/splash.png',
                width: 200,
              ),
            ),

            const SizedBox(height: 70),

            Padding(
              padding: const EdgeInsets.only(top: 15), // karena sudah diberi spacing di atas
              child: SizedBox(
                height: 500,
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
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
