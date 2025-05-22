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
              backgroundImage: AssetImage("assets/images/mat_icon.jpg"),
              radius: 18,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Matematika", style: TextStyle(fontSize: 16, color: Colors.white)),
                Text("khusus pembelajaran", style: TextStyle(fontSize: 12, color: Colors.white70)),
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
                _buildTeacherMessage("Pak Samsul", "Apakah kamu sudah mengerjakan tugas perkalian dan pembagian?"),
                const SizedBox(height: 16),
                _buildStudentMessage("Sudah pak"),
                _buildStudentMessage("Apakah ada kesalahan pak?"),
                const SizedBox(height: 16),
                _buildTeacherMessage("Pak Samsul", "Tidak, terima kasih"),
                const SizedBox(height: 16),                
                _buildStudentMessage("Sama sama Pak."),
                const SizedBox(height: 16),
                _buildFriend1Message("Bian", "Aku juga udah ngerjain, Pak."),                
                const SizedBox(height: 16),
                _buildFriend2Message("Bayu", "Aku juga udah Pak."),
                const SizedBox(height: 16),
                _buildTeacherMessage("Pak Samsul", "Baguss"),
              ],
            ),
          ),

          // Background bawah dan input
          Align(
  alignment: Alignment.bottomCenter,
  child: SizedBox(
    height: 150, // sesuaikan tinggi background dan inputnya
    child: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/grub_bg.png", // ganti dengan gambar background kamu
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 65, 16, 10),
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

  Widget _buildTeacherMessage(String name, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/ppmtk.png"),
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

  Widget _buildFriend1Message(String name, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/ppips.png"),
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

  Widget _buildFriend2Message(String name, String text) {
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
}
