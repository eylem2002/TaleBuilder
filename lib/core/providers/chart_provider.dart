import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:tale/utils/consts.dart';

final chartProvider =
    ChangeNotifierProvider<ChartProvider>((ref) => ChartProvider());

class ChartProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isSearching = false;
  Uint8List? imageData;

  void loadingChange(bool val) {
    isLoading = val;
    notifyListeners();
  }

  void searchingChange(bool val) {
    isSearching = val;
    notifyListeners();
  }

  Future<dynamic> textToImage(String prompt, BuildContext context) async {
    String engineId = "stable-diffusion-v1-6";
    String apiHost = 'https://api.stability.ai';

    debugPrint(prompt);
    final response = await http.post(
        Uri.parse('$apiHost/v1/generation/$engineId/text-to-image'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "image/png",
          "Authorization": stabilityAI_API_KEY
        },
        body: jsonEncode({
          "text_prompts": [
            {
              "text": prompt,
              "weight": 1,
            }
          ],
          "cfg_scale": 7,
          "height": 1024,
          "width": 1024,
          "samples": 1,
          "steps": 30,
        }));

    if (response.statusCode == 200) {
      try {
        debugPrint(response.statusCode.toString());
        imageData = response.bodyBytes;
        loadingChange(true);
        searchingChange(false);
        notifyListeners();
      } on Exception {
        debugPrint("failed to generate image");
      }
    } else {
      debugPrint("failed to generate image");
    }
  }
}
