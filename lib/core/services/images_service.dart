import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

// Service To Manage images in Firebase Storage
class FilesStorageService {
  final FirebaseStorage _storageInstance =
      FirebaseStorage.instanceFor(bucket: 'tale-ce0cb.appspot.com');

  // this is to add images to the Firebase Storage
  Future<String> uploadImages(
      {required String imageType,
      required String folderName,
      required XFile pickedImages}) async {
    String urlList = "";
    if (pickedImages != null) {
      XFile file = XFile(pickedImages.path);
      String fileName = basename(pickedImages.path);

      Reference storageReference =
          _storageInstance.ref().child('$imageType/$folderName/$fileName');
      await storageReference.putFile(File(file.path)).then((p0) async {
        urlList = (await p0.ref.getDownloadURL());
        log("Images");
      });
    } else {
      log('No data');
    }
    return urlList;
  }
}
