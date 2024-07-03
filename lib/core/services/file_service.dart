import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tale/core/models/file_text_model.dart';

// Service class To Manage fileText in Database
class FileService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final String _collectionName = "fileText";

  // add fileText to database
  Future<String> addFileText(FileTextModel model) async {
    _fireStore
        .collection(_collectionName)
        .add(model.toJson())
        .whenComplete(() => "fileText added successfully")
        .catchError((error) {
      log(error.toString());
      return "Failed";
    });
    return "Done";
  }

  extractTextFromPdf(File selectedFile) {}

  // // get the user notifications from database
  // Future<FileTextList> getUserNotifications() async {
  //   QuerySnapshot notificationsData = await _fireStore
  //       .collection(_collectionName)
  //       .where('userId', isEqualTo: sharedUser.id)
  //       .get()
  //       .whenComplete(() {
  //     log("Service get Notifications for user done");
  //   }).catchError((error) {
  //     log(error.toString());
  //   });

  //   Map<String, dynamic> data = {};
  //   FileTextModel tempModel;
  //   FileTextList fileTextList = FileTextList(FileTexts: []);
  //   for (var item in notificationsData.docs) {
  //     data["id"] = item.get("id");
  //     data["userId"] = item.get("userId");
  //     data["text"] = item.get("text");
  //     data["date"] = item.get("date");

  //     tempModel = FileTextModel.fromJson(data);
  //     FileTextList.FileTexts.add(tempModel);
  //   }
  //   return fileTextList;
  // }
}
