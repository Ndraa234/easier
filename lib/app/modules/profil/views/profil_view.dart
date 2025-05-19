import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8F3), // warna latar belakang bawah
      body: Stack(
        children: [
          // Bagian atas dengan background hijau gelombang
          Container(
            height: 240,
            decoration: const BoxDecoration(
              color: Color(0xFF0E5C4D),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),

          // Isi konten
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 40),

                // Bar atas dengan back dan QR
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.arrow_back, color: Colors.white),
                      Text(
                        'Profil',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.qr_code, color: Colors.white),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Avatar
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),

                const SizedBox(height: 16),

                // Box nama
                _ProfileTile(
                  icon: Icons.person_outline,
                  title: '~Andra',
                  subtitle:
                      'Ini bukan nama pengguna atau PIN Anda.\nNama ini akan terlihat oleh guru Anda.',
                  onEdit: () {},
                ),

                // Box info
                _ProfileTile(
                  icon: Icons.info_outline,
                  title: '~Manut maumu',
                  onEdit: () {},
                ),

                // Box email
                _ProfileTile(
                  icon: Icons.email_outlined,
                  title: 'andra@gmail.com',
                  onEdit: () {},
                ),

                const SizedBox(height: 20),

                // Tombol Logout
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0E5C4D),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    'LogOut',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // BottomNavBar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF0E5C4D),
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onEdit;

  const _ProfileTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0E5C4D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: const TextStyle(fontSize: 11, color: Colors.white70),
                  ),
              ],
            ),
          ),
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit, color: Colors.white),
          )
        ],
      ),
    );
  }
}
