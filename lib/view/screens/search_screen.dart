import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/theme/text_theme.dart';
import 'package:tale/utils/theme/theme_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
      id: "1",
      firstName: "Gemini",
      profileImage:
          "https://seeklogo.com/images/G/google-gemini-logo-A5787B2669-seeklogo.com.png");
  @override
  Widget build(BuildContext context) {
    backgroundcolor:
    Color(0xFF0A061C);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: GradientText(
          'Chat With Gemini',
          gradient: ThemeManager.title,
          style: TextStyle(
            fontSize: LayoutManager.widthNHeight0(context, 1) * 0.05,
            fontFamily: ThemeManager.fontFamily,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Image.asset(
        //       'assets/images/logo.png',
        //       fit: BoxFit.contain,
        //     ),
        //     onPressed: () {
        //       ///back
        //     },
        //   ),
        // ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: ThemeManager.background,
          ),
        ),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Container(
      decoration: BoxDecoration(gradient: ThemeManager.background),
      child: DashChat(
          inputOptions: InputOptions(trailing: [
            IconButton(
                onPressed: () {
                  _sendMediaMessage();
                },
                icon: const Icon(Icons.image, color: Colors.white))
          ]),
          currentUser: currentUser,
          onSend: _sendMessage,
          messages: messages),
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [
        chatMessage,
        ...messages
      ]; //spread operator --take the messages list and add here

      try {
        String question = chatMessage.text!;
        List<Uint8List>? images;
        if (chatMessage.medias?.isNotEmpty ?? false) {
          images = [File(chatMessage.medias!.first.url).readAsBytesSync()];
        }
        gemini.streamGenerateContent(question, images: images).listen(
          (event) {
            ChatMessage? lastMessage = messages.firstOrNull;
            if (lastMessage != null && lastMessage.user == geminiUser) {
              lastMessage = messages.removeAt(0);
              String response = event.content?.parts?.fold("",
                      (previous, current) => "$previous ${current.text}}") ??
                  "";
              lastMessage.text += response;
              setState(() {
                messages = [lastMessage!, ...messages];
              });
            } else {
              String response = event.content?.parts?.fold("",
                      (previous, current) => "$previous ${current.text}}") ??
                  "";
              ChatMessage message = ChatMessage(
                  user: geminiUser, createdAt: DateTime.now(), text: response);

              setState(() {
                messages = [message, ...messages];
              });
            }
          },
        );
      } catch (e) {
        print(e);
      }
    });
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
          user: currentUser,
          createdAt: DateTime.now(),
          text: "Describe This Image?",
          medias: [
            ChatMedia(url: file.path, fileName: "", type: MediaType.image)
          ]);
      _sendMessage(chatMessage);
    }
  }
}
