import 'package:chatfacilito/presentation/widgets/chat_item.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ChatList());

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ChatItem();
        },
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const <NavigationDestination>[
          NavigationDestination(icon: Icon(Icons.message), label: 'Messages'),
          NavigationDestination(icon: Icon(Icons.phone), label: 'Calls'),
          NavigationDestination(icon: Icon(Icons.person_2_outlined), label: 'Contacts'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }
}
