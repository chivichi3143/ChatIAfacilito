import 'package:flutter/material.dart';
import 'package:chatiafacilito/presentation/widgets/field_box.dart';

void main() => runApp(const ChatList());

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  printMessage(message) {
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Column(
          children: [
            const Expanded(child: Text('hola')),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(child: FieldBox(onValue: printMessage)),
                ],
              ),
            )
          ],
        ));
  }
}
