// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tale/core/functions/all_actions.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/theme/text_theme.dart';
import 'package:tale/utils/theme/theme_manager.dart';
import 'package:tale/view/widgets/components.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:tale/core/functions/all_actions.dart';
import 'package:tale/core/services/elevenlabs_api.dart';
import 'package:tale/utils/consts.dart';

class VoiceToText extends StatefulWidget {
  const VoiceToText({super.key});

  @override
  State<VoiceToText> createState() => _VoiceToTextState();
}

class _VoiceToTextState extends State<VoiceToText> {
  @override
  http.Response? response;

  File? audioFile;

  final textController = TextEditingController();
  final apiKey = TextEditingController();
  final fileName = TextEditingController();
  final directory = TextEditingController();

  RxBool isTalking = false.obs;
  RxBool isGettingVoice = false.obs;
  RxBool isGettingUser = false.obs;
  RxBool isGeneratingVoice = false.obs;

  RxDouble voiceStability = 0.75.obs;
  RxDouble similarityBoost = 1.0.obs;
  double reStability = 0.75;
  double reBoost = 1.0;

  String text = '';
  RxString selectedVoice = 'Adam'.obs;
  String reselectedVoice = 'Adam';
  RxString externalStorage = '/storage/emulated/0/T2V'.obs;
  RxString selectedFormat = '.mp3'.obs;

  Map<String, String> voiceMap = {
    'Adam': 'pNInz6obpgDQGcFmaJgB',
    'Antoni': 'ErXwobaYiN019PkySvjV',
    'Arnold': 'VR6AewLTigWG4xSOukaG',
    'Bella': 'EXAVITQu4vr4xnSDxMaL',
    'Callum': 'N2lVS1w4EtoT3dr4eOWO',
    'Charlie': 'IKne3meq5aSn9XLyUdCD',
    'Dorothy': 'ThT5KcBeYPX3keUQqHPh',
  };

  RxList<String> fileFormats = ['.mp3', '.wav'].obs;

  RxList<String> voiceList =
      ['Adam', 'Antoni', 'Arnold', 'Bella', 'Callum', 'Charlie', 'Dorothy'].obs;

  RxInt textCount = 0.obs;
  RxInt voiceLimit = 0.obs;

  @override
  void onInit() async {
    directory.text = 'Directory: ${externalStorage.value}';
    final api = await AllActions().getSharedPref('API_Key');
    if (api != '') {
      apiKey.text = "";
    }

    Future.delayed(const Duration(seconds: 3));

    await AllActions().requestPermission();
    final direct = Directory(externalStorage.value);
    if (await direct.exists()) {
    } else {
      try {
        await direct.create(recursive: true);
      } catch (e) {
        Get.snackbar(
            'No Storage Permission', 'Please check the storage Permission!');
      }
    }
  }

  onVoiceSelect(String selectedName) {
    selectedVoice.value = selectedName;
  }

  onFormatSelect(String format) {
    selectedFormat.value = format;
  }

  onVoiceFetch() async {
    isGettingVoice.value = !isGettingVoice.value;
    voiceMap = await getVoiceList();
    if (voiceMap != null) {
      voiceList.value = voiceMap.keys.toList();
    }
    isGettingVoice.value = !isGettingVoice.value;
  }

  onUserInfo() async {
    isGettingUser.value = !isGettingUser.value;
    final limit = await getUserInfo("");
    if (limit != null) {
      voiceLimit.value = limit;
    } else {
      voiceLimit.value = 0;
    }
    isGettingUser.value = !isGettingUser.value;
  }

  onTextToVoice() async {
    if (textController.text == '') {
      Get.snackbar('Fill in!', 'Please Enter Text!');
    } else {
      if (ELEVENLABS_API_KEY == '') {
        Get.snackbar('Misssing API!', 'Please Enter Your API Key!');
      } else {
        if (textController.text == '') {
          Get.snackbar('Enter Text!', 'Please Enter Your Text!');
        } else {
          if (text == textController.text &&
              reselectedVoice == selectedVoice.value &&
              reStability == voiceStability.value &&
              reBoost == similarityBoost.value) {
            isTalking.value = !isTalking.value;
            await AllActions().playAutio(audioFile);
            isTalking.value = !isTalking.value;
          } else {
            isGeneratingVoice.value = !isGeneratingVoice.value;
            response = await getVoiceFromText(
                ELEVENLABS_API_KEY,
                textController.text,
                voiceMap[selectedVoice.value]!,
                voiceStability.value,
                similarityBoost.value);
            if (response != null) {
              audioFile = await AllActions().saveTemp(response!);
              await onUserInfo();
              isGeneratingVoice.value = !isGeneratingVoice.value;
              isTalking.value = !isTalking.value;
              fileName.text = extractFirstLine(textController.text);
              await AllActions().playAutio(audioFile);
              isTalking.value = !isTalking.value;
              text = textController.text;
              reselectedVoice = selectedVoice.value;
              reStability = voiceStability.value;
              reBoost = similarityBoost.value;
            } else {
              isGeneratingVoice.value = !isGeneratingVoice.value;
            }
          }
        }
      }
    }
  }

  String extractFirstLine(String input) {
    RegExp regExp = RegExp(r'^([^\n.;:!,]*[.;:!,])');
    Match? match = regExp.firstMatch(input);

    if (match != null) {
      String result = match.group(0)!.trim();
      if (result.isNotEmpty && ";:!,.!?".contains(result[result.length - 1])) {
        result = result.substring(0, result.length - 1);
      }
      return result;
    } else if (input.split(' ').length < 8 &&
        !input.contains(RegExp(r'[.;:!,]'))) {
      return input.trim();
    } else {
      return input.split(' ').take(6).join(' ').trim();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A061C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: GradientText(
          'Voice To Text',
          gradient: ThemeManager.title,
          style: TextStyle(
            fontSize: LayoutManager.widthNHeight0(context, 1) * 0.05,
            fontFamily: ThemeManager.fontFamily,
          ),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              onPressed: AllActions().showDevInfo,
              icon: Icon(
                Icons.info_outline_rounded,
                color: ThemeManager.primary,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            TextFieldX(
              controller: textController,
              hintText: "Your Text Here...",
              multiLine: 5,
              isPass: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const BodyText('Remaining Characters: '),
                  Obx(() => BodyText(voiceLimit.toString()))
                ],
              ),
            ),
            const SizedBox(height: 30),
            VoiceSettingsSlider(value: voiceStability),
            VoiceSettingsSlider(value: similarityBoost),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => ListDropDown(
                    dropDownList: voiceList.value.toList(),
                    onListSelect: onVoiceSelect,
                  ),
                ),
                Obx(
                  () => GestureDetector(
                      onTap: onTextToVoice,
                      child: Stack(
                        children: [
                          isGeneratingVoice.value
                              ? Center(
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        color: ThemeManager.primary,
                                        shape: BoxShape.circle,
                                        boxShadow: [shadowGlow]),
                                    child: CircularProgressIndicator(
                                      color: ThemeManager.primary,
                                    ),
                                  ),
                                )
                              : const CircularMic(),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
