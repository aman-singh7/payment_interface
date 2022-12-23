import 'package:flutter/material.dart';

class DoneKey extends StatelessWidget {
  const DoneKey({
    super.key,
    this.onDone,
    this.flex = 1,
  });
  final VoidCallback? onDone;
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
              onDone?.call();
            },
            child: GestureDetector(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue[700],
                ),
                child: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
