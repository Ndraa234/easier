import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilController extends GetxController {
  // Reactive file untuk menyimpan gambar profil
  Rxn<File> imageFile = Rxn<File>();

  // Dummy data profil (biar bisa diubah lewat UI)
  RxString nama = '~Andra'.obs;
  RxString info = 'Manut maumu'.obs;
  RxString email = 'andra@email.com'.obs;

  // Fungsi untuk ambil gambar dari galeri
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }
}
