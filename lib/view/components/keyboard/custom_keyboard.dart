import 'package:flutter/material.dart';
import 'package:payment_interface/view/components/keyboard/done_key.dart';

import 'backspace_key.dart';
import 'text_key.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({
    super.key,
    this.onTextInput,
    this.onBackspace,
    this.onDone,
  });
  final ValueSetter<String>? onTextInput;
  final VoidCallback? onBackspace;
  final VoidCallback? onDone;

  void _textInputHandler(String text) => onTextInput?.call(text);
  void _backspaceHandler() => onBackspace?.call();
  void _doneHander() => onDone?.call();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.grey[200],
      child: Column(
        children: [
          buildRowOne(),
          buildRowTwo(),
          buildRowThree(),
          buildRowFour(),
        ],
      ),
    );
  }

  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '1',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '2',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '3',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '4',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '5',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '6',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '7',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '8',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '9',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowFour() {
    return Expanded(
      child: Row(
        children: [
          BackspaceKey(
            onBackspace: _backspaceHandler,
          ),
          TextKey(
            text: '0',
            onTextInput: _textInputHandler,
          ),
          DoneKey(
            onDone: _doneHander,
          )
        ],
      ),
    );
  }
}
