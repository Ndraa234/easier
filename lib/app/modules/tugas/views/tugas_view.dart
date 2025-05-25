import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';


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
                      fillColor: Color(0xFFE5EDF5),
                      hintText: 'Cari tugas anda',
                      prefixIcon: const Icon(Icons.search,color: Color(0xFF55A99D)),
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
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => const _UploadDialog(),
                                );
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    'Tambah jawaban',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF124E3E)
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(Icons.add_circle, size: 14, color: Color(0xFF124E3E)),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
class _UploadDialog extends StatefulWidget {
  const _UploadDialog();

  @override
  State<_UploadDialog> createState() => _UploadDialogState();
}

class _UploadDialogState extends State<_UploadDialog> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF124E3E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              children: [
                BackButton(color: Colors.white),
                const SizedBox(width: 8),
                const Text(
                  'Kembali',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Tombol ambil gambar dan dari galeri
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ImageButton(
                  icon: Icons.photo_camera,
                  label: 'Ambil gambar',
                  onTap: () => _pickImage(ImageSource.camera),
                ),
                _ImageButton(
                  icon: Icons.image,
                  label: 'Dari album',
                  onTap: () => _pickImage(ImageSource.gallery),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Preview jika gambar sudah dipilih
            if (_imageFile != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(_imageFile!, height: 120),
              ),

            const SizedBox(height: 24),

            // Tombol kirim gambar
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD6B730),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                if (_imageFile != null) {
                  Navigator.pop(context);
                  Get.snackbar(
                    'Sukses',
                    'Tugas berhasil dikirim!',
                    backgroundColor: const Color(0xFFD9D9D9),
                    colorText: const Color(0xFF0B4D3C),
                    snackPosition: SnackPosition.TOP,
                  );
                } else {
                  Get.snackbar(
                    'Oops',
                    'Pilih gambar duluu!',
                    backgroundColor: const Color(0xFFD9D9D9),
                    colorText: Colors.red[600],
                    snackPosition: SnackPosition.TOP,
                  );
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Kirim gambar', style: TextStyle(color: Colors.white)),
                  SizedBox(width: 8),
                  Icon(Icons.send, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _ImageButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ImageButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFD6B730),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, size: 36, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

