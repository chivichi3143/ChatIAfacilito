import 'package:chatiafacilito/presentation/screens/chat_list.dart';
import 'package:chatiafacilito/presentation/screens/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }

  int index = 0;
  final screens = [
    const ChatList(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 20,
        toolbarHeight: 60,
        shadowColor: Colors.red[300],
        backgroundColor: Colors.red[300],
        title: Text(
          "Bienvenido ${user.email!.split('@')[0]}",
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: screens[index],
    );
  }
}
