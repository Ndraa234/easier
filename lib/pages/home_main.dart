import 'package:flutter/material.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "easier",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      "Halo,\nAndra",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/images/avatar.jpg"),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Selamat Mengerjakan Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Selamat Mengerjakan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 24),

            // Mata Pelajaran Section (scroll horizontal)
            const Text(
              "Mata Pelajaran",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildSubjectTile("Matematika", Icons.calculate, Colors.greenAccent),
                  _buildSubjectTile("Inggris", Icons.language, Colors.blueAccent),
                  _buildSubjectTile("Sosial", Icons.public, Colors.orangeAccent),
                  _buildSubjectTile("Seni", Icons.palette, Colors.pinkAccent),
                  _buildSubjectTile("IPA", Icons.science, Colors.purpleAccent),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Riwayat Pengumpulan (scroll vertical)
            const Text(
              "Riwayat Pengumpulan",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                _buildHistoryCard("Matematika", "07:49 WIB", "2022-12-24", Colors.greenAccent),
                _buildHistoryCard("Seni", "07:49 WIB", "2022-12-24", Colors.pinkAccent),
                _buildHistoryCard("IPS", "07:50 WIB", "2022-12-25", Colors.orangeAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectTile(String title, IconData icon, Color color) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(String subject, String time, String date, Color color) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        "$subject\nJam $time\nTanggal $date\nTerkirim",
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }
}
