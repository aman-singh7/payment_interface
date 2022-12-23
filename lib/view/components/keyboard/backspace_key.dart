import 'package:flutter/material.dart';

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    super.key,
    this.onBackspace,
    this.flex = 1,
  });
  final VoidCallback? onBackspace;
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
              onBackspace?.call();
            },
            child: Center(
              child: Icon(
                Icons.backspace,
                color: Colors.blue[700],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
