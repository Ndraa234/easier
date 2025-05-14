import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF0FAFFF8),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: const Color(0xFF0B4F4B),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "easier",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Halo,\nAndra",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.grey[300], // agar terlihat kalau PNG transparan
                        backgroundImage: AssetImage("assets/images/avatar.png"),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // Gambar "Selamat Mengerjakan"
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/images/selamat_mengerjakan.png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Mata Pelajaran
                    const Text(
                      "Mata Pelajaran",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildSubjectIcon(
                            icon: Icons.calculate,
                            label: "Matematika",
                            color: Colors.greenAccent,
                          ),
                          _buildSubjectIcon(
                            icon: Icons.language,
                            label: "Inggris",
                            color: Colors.lightBlue,
                          ),
                          _buildSubjectIcon(
                            icon: Icons.public,
                            label: "Sosial",
                            color: Colors.orangeAccent,
                          ),
                          _buildSubjectIcon(
                            icon: Icons.brush,
                            label: "Seni",
                            color: Colors.pinkAccent,
                          ),
                          _buildSubjectIcon(
                            icon: Icons.science,
                            label: "IPA",
                            color: Colors.purpleAccent,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Riwayat Pengumpulan
                    const Text(
                      "Riwayat Pengumpulan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildHistoryCard(
                          subject: "Matematika",
                          date: "2022-12-24",
                          time: "07:49 WIB",
                          status: "Terkirim",
                          color: Colors.greenAccent,
                        ),
                        _buildHistoryCard(
                          subject: "Seni",
                          date: "2022-12-24",
                          time: "07:49 WIB",
                          status: "Terkirim",
                          color: Colors.pinkAccent,
                        ),
                        _buildHistoryCard(
                          subject: "IPS",
                          date: "2022-12-24",
                          time: "07:49 WIB",
                          status: "Terkirim",
                          color: Colors.orangeAccent,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectIcon({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard({
    required String subject,
    required String date,
    required String time,
    required String status,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        "$subject\nJam $time\nTanggal $date\n$status",
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
