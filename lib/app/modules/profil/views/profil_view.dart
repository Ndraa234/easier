import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends StatelessWidget {
  ProfilView({super.key});

  final ProfilController controller = Get.put(ProfilController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8F3),
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/profil_bg.png',
              height: 280,
              fit: BoxFit.cover,
            ),
          ),

          // Konten utama
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 60),

                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: const [
                        SizedBox(width: 8),
                        Text(
                          'Profil',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 80),

                  Obx(() {
                    return GestureDetector(
                      onTap: () => controller.pickImage(),
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: controller.imageFile.value != null
                            ? FileImage(controller.imageFile.value!)
                            : const AssetImage('assets/images/profil.png') as ImageProvider,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.camera_alt, size: 20, color: Color(0xFF0E5C4D)),
                          ),
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 24),

                  // Editable profile tiles
                  EditableProfileTile(
                    icon: Icons.person_outline,
                    label: 'Nama',
                    text: controller.nama,
                    hint:
                        'Ini bukan nama pengguna atau PIN Anda.\nNama ini akan terlihat oleh guru Anda.',
                  ),
                  EditableProfileTile(
                    icon: Icons.info_outline,
                    label: 'Info',
                    text: controller.info,
                  ),
                  EditableProfileTile(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    text: controller.email,
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton.icon(
                    onPressed: () {
                      Get.offAllNamed('/login'); 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0E5C4D),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.logout, color: Colors.white),
                    label: const Text(
                      'LogOut',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditableProfileTile extends StatefulWidget {
  final IconData icon;
  final String label;
  final RxString text;
  final String? hint;

  const EditableProfileTile({
    super.key,
    required this.icon,
    required this.label,
    required this.text,
    this.hint,
  });

  @override
  State<EditableProfileTile> createState() => _EditableProfileTileState();
}

class _EditableProfileTileState extends State<EditableProfileTile> {
  late final TextEditingController _controller;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text.value);
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
      if (_isEditing) {
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
      } else {
        widget.text.value = _controller.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const greenColor = Color(0xFF0E5C4D);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Icon(widget.icon, color: greenColor),
          const SizedBox(width: 12),
          Expanded(
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _isEditing
                      ? TextField(
                          controller: _controller,
                          autofocus: true,
                          style: const TextStyle(color: greenColor),
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                          ),
                        )
                      : Text(
                          widget.text.value,
                          style: const TextStyle(
                            fontSize: 14,
                            color: greenColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  if (widget.hint != null)
                    Text(
                      widget.hint!,
                      style: const TextStyle(fontSize: 11, color: greenColor),
                    ),
                ],
              );
            }),
          ),
          IconButton(
            onPressed: _toggleEdit,
            icon: Icon(_isEditing ? Icons.check : Icons.edit, color: greenColor),
          ),
        ],
      ),
    );
  }
}
