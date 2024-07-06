// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/foundation.dart';
//
//
// class FunctionManager
// {
//   static String getImageExtension(Uint8List imageBytes) {
//     // Detect the image format based on the header bytes
//     if (imageBytes.length >= 3) {
//       if (imageBytes[0] == 0xFF &&
//           imageBytes[1] == 0xD8 &&
//           imageBytes[2] == 0xFF) {
//         return '.jpg';
//       } else if (imageBytes[0] == 0x89 &&
//           imageBytes[1] == 0x50 &&
//           imageBytes[2] == 0x4E) {
//         return '.png';
//       }
//     }
//
//     // If format detection fails, you can return a default extension
//     return '.jpg'; // Default to jpg extension
//   }
//
//   static Future? getImage() async
//   {
//     if(kIsWeb)
//     {
//       return await _getWebImage();
//     }
//     else
//     {
//       return await _getAndroidImage();
//     }
//   }
//
//   static Future<File?> _getAndroidImage() async
//   {
//     var picker = ImagePicker();
//     File? itemImage;
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       itemImage = File(pickedFile.path);
//       return itemImage;
//     } else {
//       return null;
//     }
//   }
//
//   static Future<Uint8List?> _getWebImage() async
//   {
//     Uint8List? image;
//     var value = await FilePicker.platform.pickFiles(type: FileType.image);
//     if (value != null)
//     {
//       image = value.files.single.bytes!;
//       return image;
//     } else {
//       return null;
//     }
//   }
// }