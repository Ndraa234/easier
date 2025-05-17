import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    // Data pesan dengan gambar profil berbeda-beda
    final List<Map<String, String>> chatList = [
      {
        'mapel': 'Matematika',
        'pesan': 'Halo David, sudah siap belajar?',
        'tanggal': '16 Mei',
        'image': 'assets/images/ppmtk.png',
      },
      {
        'mapel': 'Bahasa Indonesia',
        'pesan': 'Jangan lupa tugas minggu ini!',
        'tanggal': '15 Mei',
        'image': 'assets/images/ppindo.png',
      },
      {
        'mapel': 'IPA',
        'pesan': 'Cek materi tentang fotosintesis ya!',
        'tanggal': '14 Mei',
        'image': 'assets/images/ppipa.png',
      },
      {
        'mapel': 'IPS',
        'pesan': 'Jangan lupa ulangan hari ini',
        'tanggal': '13 Mei',
        'image': 'assets/images/ppips.png',
      },
      {
        'mapel': 'Pendidikan Agama',
        'pesan': 'Hi, David. Hope you’re doing well...',
        'tanggal': '12 Mei',
        'image': 'assets/images/ppagama.png',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF3),
      body: Stack(
        children: [
          // Background gelombang atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bg_chat.png',
              fit: BoxFit.cover,
              height: 180,
            ),
          ),

          // Konten utama
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),

                // AppBar custom
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back, color: Colors.white),
                      const SizedBox(width: 8),
                      const Text(
                        'Pesan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 100),

                // Search bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5EDF5),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari mata pelajaran anda',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Icon(Icons.mic),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Daftar pesan
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: chatList.length,
                    itemBuilder: (context, index) {
                      final chat = chatList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            // Avatar
                            ClipOval(
                              child: Image.asset(
                                chat['image'] ?? 'assets/images/pp.png',
                                width: 45,
                                height: 45,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Info chat
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chat['mapel'] ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    chat['pesan'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),

                            // Badge & tanggal
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  chat['tanggal'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
