import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tale/utils/theme/theme_manager.dart';

class AllActions {
  requestPermission() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
      if (build.version.sdkInt >= 30) {
        await Permission.manageExternalStorage.isDenied
            .then((value) => {Permission.manageExternalStorage.request()});
      } else {
        await Permission.storage.isDenied
            .then((value) => {Permission.storage.request()});
      }
    }
  }

  saveMp3ToFile(
      http.Response response, String filename, String directory) async {
    List<int> bytes = response.bodyBytes;
    final file = File('$directory/$filename');
    await file.writeAsBytes(bytes);
    Get.snackbar("Success", "File saved!");
  }

  saveTemp(http.Response response) async {
    List<int> bytes = response.bodyBytes;
    var directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/output.mp3');
    await file.writeAsBytes(bytes);
    // await playAutio(file);
    Get.snackbar("Success", "Text Converted to Voice!");
    return file;
  }

  Future playAutio(file) async {
    final player = AudioPlayer();
    await player.setFilePath(file.path);
    await player.play();
    player.stop();
  }

  saveSharedPref(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  getSharedPref(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      return prefs.getString(key);
    }
    {
      return '';
    }
  }

  showDevInfo() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: ThemeManager.dark,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 5,
                  width: 35,
                  decoration: BoxDecoration(
                      color: ThemeManager.second,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              // const BodyText("Created By:"),
              // const TitleText(title: "Md Rezaul Hasan Mahadie"),
              // const BodyText("mahadie02@gmail.com"),
            ],
          ),
        ),
      ),
    );
  }
}
