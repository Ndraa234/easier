import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B4D3C), // Warna hijau tua
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/splash.png',
              width: 120,
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                SizedBox(
                  height: 710,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/login_bg.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Registrasi',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0B4D3C),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '"Silahkan isi daftar diri Anda!"',
                        style: TextStyle(fontSize: 14, color: Color(0xFF0B4D3C)),
                      ),
                      const SizedBox(height: 15),
                      inputField('Nama Lengkap', 'Masukkan nama lengkap anda'),
                      inputField('Email', 'Masukkan alamat email anda'),
                      inputField('Tanggal Lahir', 'DD / MM / YYYY'),
                      inputField('Sandi', 'Buat sandi anda', isPassword: true),
                      inputField('Komfirmasi sandi', 'Masukkan ulang sandi anda', isPassword: true),
                      const SizedBox(height: 5),
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
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            'Registrasi',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: 'Sudah punya akun ? ',
                              style: TextStyle(color: Colors.black87),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    color: Color(0xFFFFC727),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget inputField(String label, String hint, {bool isPassword = false}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFFE9EFF5),
            border: InputBorder.none, // <- Menghilangkan border
            enabledBorder: InputBorder.none, // <- Saat tidak fokus
            focusedBorder: InputBorder.none, // <- Saat fokus
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    ),
  );
}
}
