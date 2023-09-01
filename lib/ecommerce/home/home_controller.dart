import 'dart:io';

import 'package:image_picker/image_picker.dart';

class HomeController {
  static XFile? photo;
  static File? photoFile;

  static Future<void> pickPicture() async {
    final ImagePicker picker = ImagePicker();
    photo = await picker.pickImage(source: ImageSource.gallery);
    photoFile=File(photo!.path);
  }


}