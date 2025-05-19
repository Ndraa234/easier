import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/grub_controller.dart';

class GrubView extends GetView<GrubController> {
  const GrubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF124E3E),
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/ppmtk.png"),
              radius: 18,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Matematika", style: TextStyle(fontSize: 16, color: Colors.white)),
                Text("info guru", style: TextStyle(fontSize: 12, color: Colors.white70)),
              ],
            ),
          ],
        ),
        // Icons dihapus sesuai permintaan
        actions: const [],
      ),
      body: Stack(
        children: [
          // Chat list
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
            child: ListView(
              children: [
                _buildTeacherMessage("Apakah kamu sudah mengerjakan tugas perkalian dan pembagian?"),
                const SizedBox(height: 16),
                _buildStudentMessage("Sudah pak"),
                _buildStudentMessage("Apakah ada kesalahan?"),
                const SizedBox(height: 16),
                _buildTeacherMessage("Tidak, terima kasih"),
                _buildTeacherVoiceMessage(), // voice tanpa gambar
                const SizedBox(height: 16),
                _buildFriendMessage("Rina", "Aku juga udah ngerjain, Pak."),
                const SizedBox(height: 16),
                _buildStudentMessage("Sama sama Pak."),
                const SizedBox(height: 120),
              ],
            ),
          ),

          // Background bawah dan input
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 100,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/grub_bg.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFFAF3),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: "Kirim Pesan",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const CircleAvatar(
                          backgroundColor: Color(0xFF124E3E),
                          child: Icon(Icons.send, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherMessage(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/ppmtk.png"),
          radius: 18,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStudentMessage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF124E3E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFriendMessage(String name, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/ppagama.png"),
          radius: 18,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTeacherVoiceMessage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/ppmtk.png"),
          radius: 18,
        ),
        const SizedBox(width: 8),
        Container(
          width: 200,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ],
    );
  }
}
