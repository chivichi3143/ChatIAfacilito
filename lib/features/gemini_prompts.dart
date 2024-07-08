import 'dart:io';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

class GeminiChat extends StatefulWidget {
  const GeminiChat({super.key});

  @override
  State<GeminiChat> createState() => _GeminiChatState();
}

class _GeminiChatState extends State<GeminiChat> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];
  ChatUser chatUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(id: "1", firstName: "Gemini");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat AI Facilito"), centerTitle: true),
      body: _buildDash(),
    );
  }

  Widget _buildDash() {
    return DashChat(
      inputOptions: InputOptions(trailing: [
        IconButton(onPressed: _sendMediaMessage, icon: const Icon(Icons.image))
      ]),
      currentUser: chatUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [File(chatMessage.medias!.first.url).readAsBytesSync()];
      }
      gemini.streamGenerateContent(question, images: images).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: response,
              isMarkdown: true);
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void _sendMediaMessage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? imageFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      ChatMessage chatMessage = ChatMessage(
          user: chatUser,
          createdAt: DateTime.now(),
          text: "Describe esta imagen",
          medias: [
            ChatMedia(url: imageFile.path, fileName: "", type: MediaType.image)
          ]);
      _sendMessage(chatMessage);
    }
  }
}
