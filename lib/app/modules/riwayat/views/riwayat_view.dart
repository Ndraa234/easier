import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/riwayat_controller.dart';

class RiwayatView extends GetView<RiwayatController> {
  const RiwayatView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> riwayatList = [
      {
        'mapel': 'Matematika',
        'tanggal': '20 Mei 2025',
        'status': 'Terkumpul',
        'tugasKe': 2,
        'icon': 'assets/images/mat_icon.jpg',
      },
      {
        'mapel': 'Seni',
        'tanggal': '19 Mei 2025',
        'status': 'Terlambat',
        'tugasKe': 3,
        'icon': 'assets/images/ipa_icon.jpg'
      },
      {
        'mapel': 'IPS',
        'tanggal': '18 Mei 2025',
        'status': 'Terkumpul',
        'tugasKe': 1,
        'icon': 'assets/images/ips_icon.jpg'
      },
      {
        'mapel': 'B. Inggris',
        'tanggal': '17 Mei 2025',
        'status': 'Terlambat',
        'tugasKe': 3,
        'icon': 'assets/images/mat_icon.jpg'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: const Color(0xFF124E3E),
        title: const Text(
          'Riwayat Pengumpulan',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.offAllNamed('/home'),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background gelombang di bawah
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/grub_bg.png',
              fit: BoxFit.cover,
            ),
          ),

          // Konten daftar
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              itemCount: riwayatList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final data = riwayatList[index];
                return _buildRiwayatCard(
                  subject: data['mapel']!,
                  date: data['tanggal']!,
                  status: data['status']!,
                  tugasKe: data['tugasKe']!,
                  iconPath: data['icon']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiwayatCard({
    required String subject,
    required String date,
    required String status,
    required int tugasKe,
    required String iconPath,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade100,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.green.shade100,
            backgroundImage: AssetImage(iconPath),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tugas ke-$tugasKe $subject',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text('Dikumpulkan: $date',
                    style: const TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
          ),
          Text(
            status,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: _statusColor(status),
            ),
          ),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Terkumpul':
        return const Color(0xFF124E3E);
      case 'Terlambat':
        return Colors.amber[700]!;
      default:
        return Colors.grey[600]!;
    }
  }
}
