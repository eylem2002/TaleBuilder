// // ignore_for_file: depend_on_referenced_packages

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:http/http.dart' as http;
// import 'package:tale/core/functions/all_actions.dart';
// import 'package:tale/core/services/elevenlabs_api.dart';
// import 'package:tale/utils/consts.dart';

// class VoiceToTextController extends GetxController {
//   http.Response? response;

//   File? audioFile;

//   final textController = TextEditingController();
//   final apiKey = TextEditingController();
//   final fileName = TextEditingController();
//   final directory = TextEditingController();

//   RxBool isTalking = false.obs;
//   RxBool isGettingVoice = false.obs;
//   RxBool isGettingUser = false.obs;
//   RxBool isGeneratingVoice = false.obs;

//   RxDouble voiceStability = 0.75.obs;
//   RxDouble similarityBoost = 1.0.obs;
//   double reStability = 0.75;
//   double reBoost = 1.0;

//   String text = '';
//   RxString selectedVoice = 'Adam'.obs;
//   String reselectedVoice = 'Adam';
//   RxString externalStorage = '/storage/emulated/0/T2V'.obs;
//   RxString selectedFormat = '.mp3'.obs;

//   Map<String, String> voiceMap = {
//     'Adam': 'pNInz6obpgDQGcFmaJgB',
//     'Antoni': 'ErXwobaYiN019PkySvjV',
//     'Arnold': 'VR6AewLTigWG4xSOukaG',
//     'Bella': 'EXAVITQu4vr4xnSDxMaL',
//     'Callum': 'N2lVS1w4EtoT3dr4eOWO',
//     'Charlie': 'IKne3meq5aSn9XLyUdCD',
//     'Dorothy': 'ThT5KcBeYPX3keUQqHPh',
//   };

//   RxList<String> fileFormats = ['.mp3', '.wav'].obs;

//   RxList<String> voiceList =
//       ['Adam', 'Antoni', 'Arnold', 'Bella', 'Callum', 'Charlie', 'Dorothy'].obs;

//   RxInt textCount = 0.obs;
//   RxInt voiceLimit = 0.obs;

//   @override
//   void onInit() async {
//     super.onInit();
//     directory.text = 'Directory: ${externalStorage.value}';
//     final api = await AllActions().getSharedPref('API_Key');
//     if (api != '') {
//       apiKey.text = "";
//     }

//     Future.delayed(const Duration(seconds: 3));

//     await AllActions().requestPermission();
//     final direct = Directory(externalStorage.value);
//     if (await direct.exists()) {
//     } else {
//       try {
//         await direct.create(recursive: true);
//       } catch (e) {
//         Get.snackbar(
//             'No Storage Permission', 'Please check the storage Permission!');
//       }
//     }
//   }

//   onVoiceSelect(String selectedName) {
//     selectedVoice.value = selectedName;
//   }

//   onFormatSelect(String format) {
//     selectedFormat.value = format;
//   }

//   onVoiceFetch() async {
//     isGettingVoice.value = !isGettingVoice.value;
//     voiceMap = await getVoiceList();
//     if (voiceMap != null) {
//       voiceList.value = voiceMap.keys.toList();
//     }
//     isGettingVoice.value = !isGettingVoice.value;
//   }

//   onUserInfo() async {
//     isGettingUser.value = !isGettingUser.value;
//     final limit = await getUserInfo("");
//     if (limit != null) {
//       voiceLimit.value = limit;
//     } else {
//       voiceLimit.value = 0;
//     }
//     isGettingUser.value = !isGettingUser.value;
//   }

//   onTextToVoice() async {
//     if (textController.text == '') {
//       Get.snackbar('Fill in!', 'Please Enter Text!');
//     } else {
//       if (ELEVENLABS_API_KEY == '') {
//         Get.snackbar('Misssing API!', 'Please Enter Your API Key!');
//       } else {
//         if (textController.text == '') {
//           Get.snackbar('Enter Text!', 'Please Enter Your Text!');
//         } else {
//           if (text == textController.text &&
//               reselectedVoice == selectedVoice.value &&
//               reStability == voiceStability.value &&
//               reBoost == similarityBoost.value) {
//             isTalking.value = !isTalking.value;
//             await AllActions().playAutio(audioFile);
//             isTalking.value = !isTalking.value;
//           } else {
//             isGeneratingVoice.value = !isGeneratingVoice.value;
//             response = await getVoiceFromText(
//                 ELEVENLABS_API_KEY,
//                 textController.text,
//                 voiceMap[selectedVoice.value]!,
//                 voiceStability.value,
//                 similarityBoost.value);
//             if (response != null) {
//               audioFile = await AllActions().saveTemp(response!);
//               await onUserInfo();
//               isGeneratingVoice.value = !isGeneratingVoice.value;
//               isTalking.value = !isTalking.value;
//               fileName.text = extractFirstLine(textController.text);
//               await AllActions().playAutio(audioFile);
//               isTalking.value = !isTalking.value;
//               text = textController.text;
//               reselectedVoice = selectedVoice.value;
//               reStability = voiceStability.value;
//               reBoost = similarityBoost.value;
//             } else {
//               isGeneratingVoice.value = !isGeneratingVoice.value;
//             }
//           }
//         }
//       }
//     }
//   }

//   onSave() async {
//     await AllActions().requestPermission();
//     if (response != null && fileName.text != '') {
//       AllActions().saveMp3ToFile(
//           response!,
//           '${fileName.text}${selectedFormat.value}',
//           directory.text.replaceFirst('Directory: ', ''));
//     } else {
//       if (fileName.text == '') {
//         Get.snackbar('No File Name!', 'Please Enter a file name to save!');
//       } else {
//         Get.snackbar('No Voice!', 'Please convert Text to Voice First!');
//       }
//     }
//   }

//   String extractFirstLine(String input) {
//     RegExp regExp = RegExp(r'^([^\n.;:!,]*[.;:!,])');
//     Match? match = regExp.firstMatch(input);

//     if (match != null) {
//       String result = match.group(0)!.trim();
//       if (result.isNotEmpty && ";:!,.!?".contains(result[result.length - 1])) {
//         result = result.substring(0, result.length - 1);
//       }
//       return result;
//     } else if (input.split(' ').length < 8 &&
//         !input.contains(RegExp(r'[.;:!,]'))) {
//       return input.trim();
//     } else {
//       return input.split(' ').take(6).join(' ').trim();
//     }
//   }
// }
