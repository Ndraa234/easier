// lib/screens/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'easier',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Halo,\nAndra',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/user.jpg'),
                        radius: 20,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Selamat Mengerjakan
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Selamat\nMengerjakan',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/study.png',
                      height: 80,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Mata Pelajaran
              const Text(
                'Mata Pelajaran',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _subjectIcon('Matematika', Icons.calculate, Colors.greenAccent),
                  _subjectIcon('Inggris', Icons.language, Colors.blueAccent),
                  _subjectIcon('Sosial', Icons.public, Colors.orangeAccent),
                  _subjectIcon('IPS', Icons.map, Colors.pinkAccent),
                ],
              ),

              const SizedBox(height: 24),

              // Riwayat Pengumpulan
              const Text(
                'Riwayat Pengumpulan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _submissionCard('Matematika', '07:49 WIB', '2022-12-24', Colors.greenAccent),
              const SizedBox(height: 10),
              _submissionCard('Seni', '07:49 WIB', '2022-12-24', Colors.pinkAccent),
              const SizedBox(height: 10),
              _submissionCard('IPS', '07:49 WIB', '2022-12-24', Colors.orangeAccent),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF004D40),
    );
  }

  Widget _subjectIcon(String title, IconData icon, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _submissionCard(String subject, String time, String date, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                subject,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jam $time', style: const TextStyle(color: Colors.black87)),
              Text('Tanggal $date', style: const TextStyle(color: Colors.black87)),
              const Text('Terkirim', style: TextStyle(color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }
}
