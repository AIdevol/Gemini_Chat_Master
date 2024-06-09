// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:typed_data';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_chat/features/home/presentation/views/widgets/app_bar.dart';
import 'package:gemini_chat/features/home/presentation/views/widgets/message_item.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:regexp/regexp.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();
  bool isDark = false;
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage:
        "https://i.pinimg.com/564x/fe/3b/7d/fe3b7dc5a289077c9f31440b6e1c2b43.jpg",
  );
  void sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini
          .streamGenerateContent(
        question,
        images: images,
      )
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(
            () {
              messages = [lastMessage!, ...messages];
            },
          );
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Describe this picture?",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      sendMessage(chatMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: appBar(
        isDark: isDark,
        widget: InkWell(
          onTap: () {
            setState(() {
              isDark = !isDark;
            });
          },
          child: isDark
              ? const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.sunny,
                    color: Colors.white,
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.dark_mode,
                  ),
                ),
        ),
      ),
      body: MessageItem(
        sendMediaMessage: sendMediaMessage,
        messages: messages,
        currentUser: currentUser,
        sendMessage: sendMessage,
      ),
    );
  }
}
