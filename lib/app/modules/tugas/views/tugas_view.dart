import 'package:flutter/material.dart';

class TugasView extends StatelessWidget {
  const TugasView({super.key});

  final List<Map<String, String>> tugasList = const [
    {
      'judul': 'Tugas ke : 1 B Indonesia',
      'gambar': 'assets/images/bindo_icon.jpg',
    },
    {
      'judul': 'Tugas ke : 2 IPA',
      'gambar': 'assets/images/ipa_icon.jpg',
    },
    {
      'judul': 'Tugas ke : 3 IPS',
      'gambar': 'assets/images/ips_icon.jpg',
    },
    {
      'judul': 'Tugas ke : 4 Matematika',
      'gambar': 'assets/images/mat_icon.jpg',
    },
    {
      'judul': 'Tugas ke : 5 PPKN',
      'gambar': 'assets/images/ppkn_icon.jpg',
    },
    {
      'judul': 'Tugas ke : 6 Seni Budaya',
      'gambar': 'assets/images/seni_icon.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF3),
      body: Stack(
        children: [
          // Background hijau gelombang di atas
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
              children: [
                const SizedBox(height: 60),

                // Custom AppBar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      const Text(
                        'Tugas',
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
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Cari tugas anda',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Grid daftar tugas
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      itemCount: tugasList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        final tugas = tugasList[index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Gambar tugas
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  tugas['gambar']!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),

                            // Info tugas
                            Text(
                              tugas['judul']!,
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(height: 2),

                            // Tombol tambah jawaban
                            const Row(
                              children: [
                                Text(
                                  'Tambah jawaban',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.add_circle, size: 16),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
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
