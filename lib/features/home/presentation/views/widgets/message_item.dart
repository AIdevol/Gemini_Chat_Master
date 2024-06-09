import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.sendMediaMessage,
    required this.currentUser,
    required this.sendMessage,
    required this.messages,
  });
  final void Function()? sendMediaMessage;
  final void Function(ChatMessage) sendMessage;
  final ChatUser currentUser;
  final List<ChatMessage> messages;

  @override
  Widget build(BuildContext context) {
    return DashChat(
      messageOptions: const MessageOptions(
        currentUserContainerColor: Colors.green,
        containerColor: Color.fromARGB(255, 167, 166, 166),
        textBeforeMedia: true,
        textColor: Colors.white,
      ),
      inputOptions: InputOptions(
        sendOnEnter: true,
        sendButtonBuilder: (send) {
          return IconButton(
            onPressed: send,
            icon: const Image(
              image: AssetImage(
                'assets/images/send.png',
              ),
              color: Colors.green,
              width: 30,
              height: 30,
            ),
          );
        },
        cursorStyle: const CursorStyle(
          color: Colors.green,
        ),
        autocorrect: true,
        trailing: [
          IconButton(
            onPressed: sendMediaMessage,
            icon: const Image(
              image: AssetImage(
                'assets/images/camera.png',
              ),
              color: Colors.green,
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      currentUser: currentUser,
      onSend: sendMessage,
      messages: messages,
    );
  }
}
