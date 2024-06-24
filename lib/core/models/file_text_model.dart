import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tale/utils/shared.dart';

// Model class representing a FileTextModel
class FileTextModel {
  String? id;
  String? userId;
  String? text;
  DateTime? date;

  FileTextModel({required this.text}) {
    id = uuid.v4();
    userId = sharedUser.id;
    date = DateTime.now();
  }

//This is a factory Constructor to create FileTextModel instance from JSON obj
  FileTextModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    text = json['text'];
    date = (json["date"] as Timestamp).toDate();
  }

//convert the FileTextModel instance to a JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['text'] = this.text;
    data['date'] = this.date;

    return data;
  }
}

//  class representing a list of FileText
class FileTextList {
  List<FileTextModel> FileTexts;

  FileTextList({required this.FileTexts});

  factory FileTextList.fromJson(List<dynamic> data) {
    List<FileTextModel> temp = [];
    temp = data.map((item) {
      return FileTextModel.fromJson(Map<String, dynamic>.from(item));
    }).toList();

    return FileTextList(FileTexts: temp);
  }
}
