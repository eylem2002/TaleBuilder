import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
            onPressed: () {
              ///back
            },
          ),
        ],
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
    return DashChat(
        currentUser: currentUser, onSend: _sendMessage, messages: messages);
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [
        chatMessage,
        ...messages
      ]; //spread operator --take the messages list and add here

      try {
        String question = chatMessage.text!;
        gemini.streamGenerateContent(question).listen(
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
}
