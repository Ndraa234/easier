import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B4D3C),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            // Logo & App Name
            Column(
              children: [
                Image.asset(
                  'assets/images/splash.png',
                  width: 100,
                ),
                const SizedBox(height: 8),
                const Text(
                  'easier',
                  style: TextStyle(
                    fontSize: 32,
                    color: Color(0xFFFFC727),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF5FFF8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
                    '“Hai! Yuk, daftar dulu biar bisa gabung sama kita. Isi data di bawah ini, dan akunmu langsung jadi!”',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Form Fields
                  _buildInputField(label: 'Nama Lengkap', hint: 'Masukkan nama lengkap anda'),
                  const SizedBox(height: 16),
                  _buildInputField(label: 'Email', hint: 'Masukkan alamat email anda'),
                  const SizedBox(height: 16),
                  _buildInputField(label: 'Tanggal Lahir', hint: 'DD / MM / YYYY'),
                  const SizedBox(height: 16),
                  _buildInputField(label: 'Sandi', hint: 'Buat sandi anda', obscureText: true),
                  const SizedBox(height: 16),
                  _buildInputField(label: 'Komfirmasi sandi', hint: 'Masukkan ulang sandi anda', obscureText: true),
                  const SizedBox(height: 32),

                  // Button
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0B4D3C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      ),
                      onPressed: () {
                        // Aksi registrasi
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Text(
                        'Registrasi',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Login Text
                  Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Sudah punya akun ? ',
                        style: const TextStyle(color: Colors.black87),
                        children: [
                          TextSpan(
                            text: 'Login',
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
  );
}

  Widget _buildInputField({
    required String label,
    required String hint,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFFE9EFF5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFC4C4C4)),
            ),
          ),
        ),
      ],
    );
  }
}
