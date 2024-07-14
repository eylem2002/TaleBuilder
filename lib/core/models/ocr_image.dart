import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tale/utils/shared.dart';

// Model class representing a OcrImageModel
class OcrImageModel {
  String? id;
  String? userId;
  String? image;
  DateTime? date;

  OcrImageModel({required this.image}) {
    id = uuid.v4();
    userId = sharedUser.id;
    date = DateTime.now();
  }

//This is a factory Constructor to create OcrImageModel instance from JSON obj
  OcrImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    image = json['image'];
    date = (json["date"] as Timestamp).toDate();
  }

//convert the OcrImageModel instance to a JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['image'] = this.image;
    data['date'] = this.date;

    return data;
  }
}

//  class representing a list of images
class OcrImageList {
  List<OcrImageModel> ocrImages;

  OcrImageList({required this.ocrImages});

  factory OcrImageList.fromJson(List<dynamic> data) {
    List<OcrImageModel> temp = [];
    temp = data.map((item) {
      return OcrImageModel.fromJson(Map<String, dynamic>.from(item));
    }).toList();

    return OcrImageList(ocrImages: temp);
  }
}
