import 'package:flutter/material.dart';
import 'package:easier/app/modules/tugas/views/tugas_view.dart';
import 'package:easier/app/modules/chat/views/chat_view.dart';
import 'package:easier/app/modules/profil/views/profil_view.dart';
import 'package:get/get.dart';

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
    ProfilView(),
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
              height: 280,
            ),
          ),

          Column(
            children: [
              const SizedBox(height: 55),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Text(
                      "easier",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    const Spacer(),
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
                          backgroundImage: AssetImage("assets/images/profil.png"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Gambar Selamat Mengerjakan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/images/selamat_mengerjakan.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // JADWAL HARI INI
                      _buildSectionTitle("Jadwal Hari Ini"),
                      _buildJadwalCard(),

                      const SizedBox(height: 24),

                      // TUGAS MENDATANG
                      _buildSectionTitle("Segera Kumpulkan"),
                      _buildTugasCard(),

                      const SizedBox(height: 24),

                      // Dengan ini:
                      _buildSectionTitle(
                        "Riwayat Pengumpulan",
                        trailing: TextButton(
                          onPressed: () {
                            Get.toNamed('/riwayat'); // atau Get.to(() => const RiwayatView());
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Selengkapnya",
                                style: TextStyle(
                                  color: Color(0xFF124E3E),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline, // Garis bawah
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Color(0xFF124E3E),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildRiwayatCard(),

                      const SizedBox(height: 24),
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

  Widget _buildSectionTitle(String title, {Widget? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget _buildJadwalCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF124E3E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.calculate, color: Colors.amberAccent),
              title: Text("Matematika", style: TextStyle(color: Colors.white)),
              subtitle: Text("08.00 - 09.30", style: TextStyle(color: Colors.white70)),
            ),
            Divider(color: Colors.white24, height: 0),
            ListTile(
              leading: Icon(Icons.science, color: Colors.lightBlueAccent),
              title: Text("IPA", style: TextStyle(color: Colors.white)),
              subtitle: Text("09.30 - 11.00", style: TextStyle(color: Colors.white70)),
            ),
            Divider(color: Colors.white24, height: 0),
            ListTile(
              leading: Icon(Icons.menu_book, color: Colors.pinkAccent),
              title: Text("Bahasa Indonesia", style: TextStyle(color: Colors.white)),
              subtitle: Text("11.00 - 12.30", style: TextStyle(color: Colors.white70)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTugasCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF124E3E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.orangeAccent),
              title: Text("Matematika ke-4", style: TextStyle(color: Colors.white)),
              subtitle: Text("Deadline: 2 hari lagi", style: TextStyle(color: Colors.white70)),
            ),
            Divider(color: Colors.white24, height: 0),
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.purpleAccent),
              title: Text("IPA ke-2", style: TextStyle(color: Colors.white)),
              subtitle: Text("Deadline: 4 hari lagi", style: TextStyle(color: Colors.white70)),
            ),
            Divider(color: Colors.white24, height: 0),
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.cyanAccent),
              title: Text("Bahasa Inggris ke-3", style: TextStyle(color: Colors.white)),
              subtitle: Text("Deadline: 4 hari lagi", style: TextStyle(color: Colors.white70)),
            ),
          ],
        ),
      ),
    );
  }
}
  Widget _buildRiwayatCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF124E3E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: const [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/mat_icon.jpg"),
              ),
              title: Text("Matematika", style: TextStyle(color: Colors.white)),
              subtitle: Text("24 Desember 2022 • 07:49 WIB", style: TextStyle(color: Colors.white70)),
              trailing: Text("Terkirim", style: TextStyle(color: Colors.greenAccent)),
            ),
            Divider(color: Colors.white24, height: 0),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/seni_icon.jpg"),
              ),
              title: Text("Seni", style: TextStyle(color: Colors.white)),
              subtitle: Text("24 Desember 2022 • 07:49 WIB", style: TextStyle(color: Colors.white70)),
              trailing: Text("Terkirim", style: TextStyle(color: Colors.greenAccent)),
            ),
            Divider(color: Colors.white24, height: 0),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/ips_icon.jpg"),
              ),
              title: Text("IPS", style: TextStyle(color: Colors.white)),
              subtitle: Text("24 Desember 2022 • 07:49 WIB", style: TextStyle(color: Colors.white70)),
              trailing: Text("Terkirim", style: TextStyle(color: Colors.greenAccent)),
            ),
          ],
        ),
      ),
    );
  }
