import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:tale/utils/consts.dart';

getVoiceFromText(String apiKey, String text, String voiceId,
    double voiceStability, double similarityBoost) async {
  String url = "https://api.elevenlabs.io/v1/text-to-speech/$voiceId";

  Map<String, dynamic>? payload = {
    "model_id": "eleven_monolingual_v1",
    "text": text,
    "voice_settings": {
      "stability": voiceStability,
      "similarity_boost": similarityBoost,
    }
  };
  Map<String, String>? headers = {
    "Accept": "audio/mpeg",
    "Content-Type": "application/json",
    "xi-api-key": apiKey,
  };
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(payload),
    );
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401 || response.statusCode == 402) {
      Get.snackbar("API Error", "Please Check Your API Key!");
      return null;
    }
  } catch (error) {
    Get.snackbar("Error!", "An Error Occurred!");
    return null;
  }
}

getUserInfo(String apiKey) async {
  Map<String, String>? headers = {
    "Content-Type": "application/json",
    "xi-api-key": ELEVENLABS_API_KEY,
  };
  final response = await http
      .get(Uri.parse("https://api.elevenlabs.io/v1/user"), headers: headers);
  if (response.statusCode == 200) {
    final jsonResponse = response.body;
    Map<String, dynamic> jsonMap = json.decode(jsonResponse);
    int characterLimit = jsonMap['subscription']['character_limit'];
    int characterCount = jsonMap['subscription']['character_count'];
    print("object $characterCount ----- $characterLimit");
    return (characterLimit - characterCount);
  } else {
    Get.snackbar("Error!", "Invalid API Key!");
  }
}

getVoiceList() async {
  http.Response response =
      await http.get(Uri.parse("https://api.elevenlabs.io/v1/voices"));

  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = json.decode(response.body);
    List<dynamic> voices = responseData['voices'];
    Map<String, String> voiceMap = {};
    for (Map<String, dynamic> voice in voices) {
      String voiceId = voice['voice_id'];
      String name = voice['name'];
      voiceMap[name] = voiceId;
    }
    List<MapEntry<String, String>> sortedEntries = voiceMap.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    voiceMap = Map.fromEntries(sortedEntries);
    return voiceMap;
  } else {
    Get.snackbar("Error!", "An Error Occurred");
    return null;
  }
}
