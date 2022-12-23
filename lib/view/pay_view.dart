import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_interface/view/base_view.dart';
import 'package:payment_interface/viewmodels/pay_viewmodel.dart';

class PayView extends StatelessWidget {
  const PayView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PayViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.blue[700],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.blue[700],
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              )
            ],
          ),
          body: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/portraits/men/51.jpg',
                    ),
                    radius: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/portraits/men/61.jpg',
                    ),
                    radius: 25,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                'Payment to red Bus',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Text(
                'redBus@axis',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: model.key,
                child: SizedBox(
                  height: 60,
                  width: 150,
                  child: TextFormField(
                    controller: model.controller,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.normal,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required Field";
                      }

                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      hintText: '00',
                      prefixIconConstraints: BoxConstraints(maxWidth: 15),
                      prefixIcon: Text(
                        '₹',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Payment via Billdesk',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          bottomSheet: BottomSheet(
            onClosing: () {},
            enableDrag: false,
            backgroundColor: Colors.blue[700],
            builder: (context) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.wallet_outlined),
                        const SizedBox(width: 8),
                        const Text('Your Bank **** 4321'),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/upi',
                            arguments: model.controller.text);
                      },
                      color: Colors.blue[700],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Proceed to pay',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'IN PARTNERSHIP WITH YOUR BANK',
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
