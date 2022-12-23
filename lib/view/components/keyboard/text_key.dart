import 'package:flutter/material.dart';

class TextKey extends StatelessWidget {
  const TextKey({
    required this.text,
    this.onTextInput,
    this.flex = 1,
    super.key,
  });

  final String text;
  final ValueSetter<String>? onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.grey[200],
          child: InkWell(
            onTap: () {
              onTextInput?.call(text);
            },
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
