import 'package:flutter/material.dart';

void main() => runApp(const ChatItem());

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 219, 219, 219)))),
      child: Row(
        children: [
          Image.asset(
            "assets/images/google.png",
            height: 50,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alex Liderson',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text('How are you today?')
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      '2 min ago',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 5), // Espacio de 20 píxeles arriba
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 3),
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Text(
                        '1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
