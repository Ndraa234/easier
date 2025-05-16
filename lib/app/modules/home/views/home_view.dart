import 'package:flutter/material.dart';
import 'package:easier/app/modules/tugas/views/tugas_view.dart';
import 'package:easier/app/modules/chat/views/chat_view.dart';
import 'package:easier/app/modules/profil/views/profil_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeContent(),
    const TugasView(),
    const ChatView(),
    const ProfilView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF124E3E),
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFF124E3E),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Tugas'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // Background gelombang
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/wave_header.png",
              fit: BoxFit.cover,
              height: 270,
            ),
          ),

          Column(
            children: [
              const SizedBox(height: 55),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "easier",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(width: 130),
                    Row(
                      children: [
                        const Text(
                          "Halo,\nAndra",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: const AssetImage("assets/images/avatar.png"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Bagian atas (selamat mengerjakan + mata pelajaran)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/images/selamat_mengerjakan.png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Judul mata pelajaran di luar container hijau
                    const Text(
                      "Mata Pelajaran",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Container hijau hanya untuk scroll mata pelajaran
                    Container(
                      padding: const EdgeInsets.only(
                        left: 10, top: 16, bottom: 10,
                        right: 0,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFF124E3E),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: SizedBox(
                        height: 90,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              SubjectIcon(icon: Icons.calculate, label: "Matematika", color: Colors.greenAccent),
                              SubjectIcon(icon: Icons.language, label: "Inggris", color: Colors.lightBlue),
                              SubjectIcon(icon: Icons.public, label: "Sosial", color: Colors.orangeAccent),
                              SubjectIcon(icon: Icons.brush, label: "Seni", color: Colors.pinkAccent),
                              SubjectIcon(icon: Icons.science, label: "IPA", color: Colors.purpleAccent),
                              SubjectIcon(icon: Icons.calculate, label: "Matematika", color: Colors.greenAccent),
                              SubjectIcon(icon: Icons.language, label: "Inggris", color: Colors.lightBlue),
                              SubjectIcon(icon: Icons.public, label: "Sosial", color: Colors.orangeAccent),
                              SubjectIcon(icon: Icons.brush, label: "Seni", color: Colors.pinkAccent),
                              SubjectIcon(icon: Icons.science, label: "IPA", color: Colors.purpleAccent),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Riwayat Pengumpulan",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF124E3E),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListView(
                            children: const [
                              HistoryCard(subject: "Matematika", date: "2022-12-24", time: "07:49 WIB", status: "Terkirim", color: Color(0xFFD9D9D9), imagePath: "assets/images/mat_icon.jpg"),
                              HistoryCard(subject: "Seni", date: "2022-12-24", time: "07:49 WIB", status: "Terkirim", color: Color(0xFFD9D9D9), imagePath: "assets/images/seni_icon.jpg"),
                              HistoryCard(subject: "IPS", date: "2022-12-24", time: "07:49 WIB", status: "Terkirim", color: Color(0xFFD9D9D9), imagePath: "assets/images/ips_icon.jpg"),
                              HistoryCard(subject: "IPA", date: "2022-12-24", time: "07:49 WIB", status: "Terkirim", color: Color(0xFFD9D9D9), imagePath: "assets/images/ipa_icon.jpg"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class SubjectIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const SubjectIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
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
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String subject;
  final String date;
  final String time;
  final String status;
  final Color color;
  final String imagePath;

  const HistoryCard({
    super.key,
    required this.subject,
    required this.date,
    required this.time,
    required this.status,
    required this.color,
    required this.imagePath,
  });

  @override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 24),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gambar di luar kontainer kuning
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 111,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Kontainer kuning
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text("Jam $time", style: const TextStyle(color: Colors.black)),
                Text("Tanggal $date", style: const TextStyle(color: Colors.black)),
                Text(status, style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

}