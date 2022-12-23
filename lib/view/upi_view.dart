import 'package:flutter/material.dart';
import 'package:payment_interface/view/base_view.dart';
import 'package:payment_interface/view/components/keyboard/custom_keyboard.dart';
import 'package:payment_interface/viewmodels/upi_viewmodel.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class UpiView extends StatelessWidget {
  const UpiView({required this.amount, super.key});

  final String amount;

  @override
  Widget build(BuildContext context) {
    return BaseView<UpiViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 60,
                  color: Colors.grey[200],
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Text(
                        'ICICI Bank',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/upi_logo.png',
                        width: 100,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.blue[700],
                  height: 25,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: const [
                      Text(
                        'Verve Financial Services',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '₹1.00',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'ENTER UPI PIN',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        model.obscureText = !model.obscureText;
                      },
                      icon: Icon(model.obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      label: Text(model.obscureText ? 'Show' : 'Hide'),
                    ),
                  ],
                ),
                SizedBox(
                  width: 200,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    controller: model.controller,
                    obscureText: model.obscureText,
                    onChanged: (value) {},
                    readOnly: true,
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: BottomSheet(
            onClosing: () {},
            enableDrag: false,
            builder: (context) {
              return CustomKeyboard(
                onTextInput: (value) {
                  if (model.controller.text.length == 4) return;
                  model.controller.text = model.controller.text + value;
                },
                onBackspace: () {
                  if (model.controller.text.isEmpty) return;
                  var str = model.controller.text;
                  str = str.substring(0, str.length - 1);
                  model.controller.text = str;
                },
                onDone: () {
                  if (model.controller.text.length == 4) {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pushReplacementNamed('/success', arguments: amount);
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
