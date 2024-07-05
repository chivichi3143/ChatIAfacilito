import 'package:flutter/material.dart';

// void main() => runApp(const FieldBox());

class FieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const FieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(50), borderSide: const BorderSide(color: Colors.transparent));

    final inputDecoration = InputDecoration(
        hintText: "End your message with '??' ",
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        fillColor: Colors.black,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              final textValue = textController.value.text;
              onValue(textValue);
              textController.clear();
            },
            icon: const Icon(Icons.send)));

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      decoration: inputDecoration,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
